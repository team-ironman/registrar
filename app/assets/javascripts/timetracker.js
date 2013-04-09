function secondsToHms(d) {
  d = Number(d);
  var h = Math.floor(d / 3600);
  var m = Math.floor(d % 3600 / 60);
  var s = Math.floor(d % 3600 % 60);
  if (h < 10) {h="0"+h} 
  if (m < 10) {m="0"+m} 
  if (s < 10) {s="0"+s} 
  return (h + ":" + m + ":" + s);
  // return ((h + ":") + (m > 0 ? (h > 0 && m < 10 ? "00" : "") + m + ":" : "00:") + (s < 10 ? "0" : "") + s); 
  

  // if (h < 10 || m < 10 || s < 10)
  //   return h
  // return (h + ":" + m + ":" + s);
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
    var i = $(this).parent().attr("id").split("_")[1];
      startclock(i);
  });
  
  // // Stop timer on "stop"
  $('input[name=stop]').click(function(i) {
      var i = $(this).parent().attr("id").split("_")[1];
      clear(i);
  });
  
  // // Restart timer on "restart"
  // $('input[name=reset]').each(function(i) {
  //     $(this).next().val(0);
  //     $(this).click(clear(i));
  // });
});