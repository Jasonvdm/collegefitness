# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Users ||= {}

Users.initialize = ->
  console.log('Users.initialize')
  init_edit_page()

init_edit_page = ->
  #console.log('init_edit_page')
  $('#user_contact_pref_email_me, #user_contact_pref_text_me').on "change", ->
    email = $('#user_contact_pref_email_me').attr("checked")
    #console.log(hourly)
    if email
      #console.log("HOURLY")
      $('#number_pref').hide()
      $('#carrier_selection').hide()
    else
      $('#number_pref').show()
      $('#carrier_selection').show()
      #do flat rate
  $('#user_contact_pref_email_me').trigger('change')

true