function secondsToHms(d) {
  d = Number(d);
  var h = Math.floor(d / 3600);
  var m = Math.floor(d % 3600 / 60);
  var s = Math.floor(d % 3600 % 60);
  if (h < 10) {h="0"+h} 
  if (m < 10) {m="0"+m} 
  if (s < 10) {s="0"+s} 
  return (h + ":" + m + ":" + s);
}

function hmsToSeconds(hms) {
  var a = hms.split(':'); // split it at the colons
  // minutes are worth 60 seconds. Hours are worth 60 minutes.
  var seconds = (+a[0]) * 60 * 60 + (+a[1]) * 60 + (+a[2]);
  return seconds;
}

$(function(){ //Anonymous function, to not leak variables to the global scope
  var intervals = [];
  function increase(i){
      return function(){
          var elem = $("#count"+i);
          elem.val(parseFloat(elem.val()) + 1);
          var sec = elem.val();
          var elema = $("#count"+i+"a");
          elema.val(secondsToHms(sec));
      }
  }
  
  function startclock(i){
      increase(i)();
      intervals[i] = setInterval(increase(i), 1000);
  }
  
  function clear(i){
      clearInterval(intervals[i]);
  }

  // Start timer on "Start"
  $('input[name=start]').click(function() {
    var i = $(this).attr("id").split("_")[1];
      startclock(i);
  });
  
  // Stop timer on "stop"
  $('input[name=stop]').click(function() {
      var i = $(this).attr("id").split("_")[1];
      var duration = $('#count'+i).val();
      $.post('/user_courses/update_time_spent', { user_course_id: i, time_spent: duration}, function(data) { 
      });
      clear(i);
  });


  $('input[name=timerHMS]').change(function() {
    var time = $(this).val();
    var sec = hmsToSeconds(time);
     $(this).prev().val(sec);
  })
  
  // // Restart timer on "restart"
  // $('input[name=reset]').each(function(i) {
  //     $(this).next().val(0);
  //     $(this).click(clear(i));
  // });
});