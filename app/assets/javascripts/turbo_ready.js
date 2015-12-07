window.turboReady = function(callback) {
  jQuery(document).on("ready page:load", callback);
};
