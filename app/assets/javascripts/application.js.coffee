#= require jquery
#= require jquery_ujs
#= require jquery.jcrop
#= require turbolinks
#= require materialize-sprockets
#= require materialize/extras/nouislider
#= require materialize-form
#= require moment
#= require rome
#= require material-datetime-picker

$(document).on 'nested:fieldAdded', (event) ->
  window.materializeForm.init()
  return

$(document).on 'turbolinks:load', ->
  $('#crop-photo').modal({
    dismissible: true
    opacity: .5,
    inDuration: 300,
    outDuration: 200,
    startingTop: '4%',
    endingTop: '10%'
  })

  $('#user_avatar').change ->
    $('#crop-photo').modal('open')
    if this.files && this.files[0]
      reader = new FileReader()
      canvas = null
      reader.onload = (e) ->
#        $('.jcrop-holder > img').attr('src', e.target.result)
        image = new Image();
#        image.onload = validateImage;
        image.src = e.target.result;
        return

      reader.readAsDataURL(this.files[0])
      return

    $('#user_avatar_cropbox')

    return

  window.materializeForm.init()

  $('.button-collapse').sideNav
    menuWidth: 300
    edge: 'right'
    closeOnClick: true
    draggable: true

  startTimePicker = new MaterialDatetimePicker().on('submit', (val) ->
    $('#event_start_time').val(val.format("DD MMM YYYY, HH:mm"))
    Materialize.updateTextFields())

  $('#event_start_time').on('click', () -> startTimePicker.open())

  endTimePicker = new MaterialDatetimePicker().on('submit', (val) ->
    $('#event_end_time').val(val.format("DD MMM YYYY, HH:mm"))
    Materialize.updateTextFields())

  $('#event_end_time').on('click', () -> endTimePicker.open())

  new CarrierWaveCropper()
  return

class CarrierWaveCropper
  constructor: ->
    $('#user_avatar_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_avatar_crop_x').val(coords.x)
    $('#user_avatar_crop_y').val(coords.y)
    $('#user_avatar_crop_w').val(coords.w)
    $('#user_avatar_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#user_avatar_previewbox').css
      width: Math.round(100 / coords.w * $('#user_avatar_cropbox').width()) + 'px'
      height: Math.round(100 / coords.h * $('#user_avatar_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'

