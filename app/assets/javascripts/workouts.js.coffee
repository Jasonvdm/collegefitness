# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Workouts ||= {}

Workouts.initialize = ->
  console.log('Workouts.initialize')
  init_edit_page()

init_edit_page = ->
  checked = $('#equipment_needed').attr("checked") 
  if checked
    #console.log("HOURLY")
    $('#equipment_list').show()
  #console.log('init_edit_page')
  $("#equipment_needed").on "change", ->
    #console.log(hourly)
    checked = $('#equipment_needed').attr("checked") 
    if checked
      #console.log("HOURLY")
      $('#equipment_list').show()
    else
	    $('#equipment_list').hide()
  $('#equipment_needed').trigger('change')

true

	