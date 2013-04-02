//= require active_admin/base

function BlogDefaults() {
  $('#event_name').val("Blog Due");
  $('#event_start_at_4i').val('09');
  $('#event_start_at_5i').val('00');
  $('#event_end_at_4i').val('09');
  $('#event_end_at_5i').val('00');
  $('#event_location').val("Flatiron School");
  $('#event_address').val("33 West 26th St.");
}


$(function(){
  $('#event_users_input').hide();
  $('#event_event_type_id').change(function(){
    if($(this).val() === '3') {
      $('#event_users_input').show();
       BlogDefaults();
    } else {
      $('#event_users_input').hide();
      // $('#new_event li:not(#event_event_type_input)').val('');
    };
  });
});
      // $('#new_event li:not(#event_event_type_input)')[0].reset();