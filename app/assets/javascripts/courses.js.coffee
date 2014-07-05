# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#FbShareModal").modal "show"

$("#InfroTextSubmit").click ->
  if $("#title").val() is ""
    
    # invalid
    $("#title").next(".help-inline").show()
    false
  else
    
    # submit the form here
    # $('#InfroText').submit();
    true
