// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-colorpicker.js
//= require_tree .

$(document).ready(function() {
  $("#modal").on("hidden", function() {
    $("body").css({ overflow: "inherit" });
    $("#modal .colorpicker-input").colorpicker("hide");
  });

  $("#modal").on("shown", function() {
    $("body").css({ overflow: "hidden" });
    $("#modal .colorpicker-input").colorpicker();
  });

  $(".flash").closest(".row-fluid").delay(5000).fadeOut();
});

$(document).on("change", ".color-select", function(event) {
  var hex_value = $(this).find(":selected").data("hex");
  $(this).next("span.color-select").css({ backgroundColor: hex_value });
});

$(document).on("click", "span.collapse-toggle i", function(event) {
  var parentSpan = $(this).parent();
  var isCollapsed = parentSpan.data("collapsed");
  if (isCollapsed) {
    $(this).attr("class", "icon-minus-sign");
  }
  else {
    $(this).attr("class", "icon-plus-sign");
  }
  parentSpan.data("collapsed", !isCollapsed);
  $(this).closest("h2").next(".links").slideToggle();
});

function globalCollapseToggle(event, collapsed) {
  $("span.collapse-toggle i").each(function() {
    var $this = $(this);
    if($this.parent().data("collapsed") != collapsed) {
      $this.click();
    }
  });
  event.preventDefault();
}

$(document).on("click", "#expand_all", function(event) {
  globalCollapseToggle(event, false);
});

$(document).on("click", "#collapse_all", function(event) {
  globalCollapseToggle(event, true);
});
