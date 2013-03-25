$(function () {
  $('input[type=checkbox]').change(function(){
    var c = this.checked ? '100%' : '0%';
    $.post('/user_courses/update_progress', { user_course_id: this.id, progress: c }, function(data) {
	    
    });
	});
});
