
$(function(){
  $('#semester_semester').change(function(){
    if ($(this).val() == "") {
      $(".displaya").hide();
    } else {
      $(".displaya").show();
      var sem = $(this).val();
      $.get('/directory/' + sem, function(data) { 
        $(".displaya").html(data);
        });
      } 
  });
});
