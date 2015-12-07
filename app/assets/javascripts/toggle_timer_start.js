turboReady(function($) {

  $checkbox = jQuery("#set_timer_start");

  $checkbox.change(function(){
    $active_timer_start = jQuery("fieldset.active_timer_start");
    if(jQuery(this).is(":checked")) {
      $active_timer_start.find(":input").attr("disabled", false);
    } else {
      $active_timer_start.find(":input").attr("disabled", true);
    }
  });

  $checkbox.trigger("change");

});
