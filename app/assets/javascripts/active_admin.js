//= require active_admin/base

function BlogDefaults() {
  $('#event_name').val("Blog Due");
  $('#event_start_at_4i').val('09');
  $('#event_start_at_5i').val('00');
  $('#event_end_at_4i').val('09');
  $('#event_end_at_5i').val('00');
  }

function NYCPresenterDefaults() {
  $('#event_name').val("NYC on Rails Presentation");
  $('#event_start_at_4i').val('19');
  $('#event_start_at_5i').val('00');
  $('#event_end_at_4i').val('21');
  $('#event_end_at_5i').val('00');
  }

function LocationDefaults() {
  $('#event_location').val("Flatiron School");
  $('#event_address').val("33 West 26th St.");
}

function DateDefaults() {  
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

// this is to select users for blog post/NYC on Rails presentation when event type is selected, otherwise hidden, also uses function above to populate default values
$(function(){
  $('#event_users_input').hide();
  $('#event_event_type_id').change(function(){
    if($(this).val() === '3') {
      $('#event_users_input').show();
       BlogDefaults();
       DateDefaults();
       LocationDefaults();
    } else if ($(this).val() === '6') {
      $('#event_users_input').show();
       NYCPresenterDefaults();
       DateDefaults();
       LocationDefaults();
    } else {
      $('#event_users_input').hide();
    }
  });
});


// this is to show the users selected on the edit page
$(function(){
    if($('#event_event_type_id').val() === '3') {
      $('#event_users_input').show();
    } else {
      $('#event_users_input').hide();
    }
  });


// NYC on Rails Defaults
$(function(){
  $('#event_event_type_id').change(function(){
    if($(this).val() === '1') {
      NYCPresenterDefaults();
      $('#event_name').val("NYC on Rails Meetup");
      LocationDefaults();
    } else if ($(this).val() === '4') {
      LocationDefaults();
    }
  });
});

//autofill dates
$(function(){
  $('#event_event_type_id').change(function(){
  DateDefaults();
  });
});

