//= require active_admin/base

function BlogDefaults() {
  $('#event_name').val("Blog Due");
  $('#event_start_at_4i').val('09');
  $('#event_start_at_5i').val('00');
  $('#event_end_at_4i').val('09');
  $('#event_end_at_5i').val('00');
  $('#event_location').val("Flatiron School");
  $('#event_address').val("33 West 26th St.");
  $('#event_start_at_1i').change(function(){
    var value = $(this).val();
    $('#event_end_at_1i').val(value);
    });
  $('#event_start_at_2i').change(function(){
    var value = $(this).val();
    $('#event_end_at_2i').val(value);
    });
  $('#event_start_at_3i').change(function(){
    var value = $(this).val();
    $('#event_end_at_3i').val(value);
    });
  }

// this is to select users for blog post when event type is selected, otherwise hidden, also uses function above to populate default values
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


// this is to show the users selected on the edit page
$(function(){
    if($('#event_event_type_id').val() === '3') {
      $('#event_users_input').show();
    } else {
      $('#event_users_input').hide();
    };
  });
