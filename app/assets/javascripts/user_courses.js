$(function () {


  $('input[type=checkbox]').change(function(){
    var c = this.checked ? '100%' : '0%';
    $.post('/user_courses/update_progress', { user_course_id: this.id, progress: c }, function(data) {
	    
    });
	});

  $("a.accordion-toggle").click(function (){
  	$(this).children().eq(0).toggleClass('icon-chevron-right icon-chevron-down');
  });

  // $('#highlight-sidebar').scrollspy();

  $('input[type=checkbox]').change(function(){
    var duration = $('#clock'+i).val();
    $.post('/user_courses/update_progress', { user_course_id: this.id, time_spent: duration}, function(data) {
      
    });
  });


});
