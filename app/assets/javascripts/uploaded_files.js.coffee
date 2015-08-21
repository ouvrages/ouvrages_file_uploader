#= require jquery-fileupload

$.fn.ouvragesFileUpload = ->
  this.each ->
    $(this).find('.ofu-input').fileupload(
      autoUpload: true
      url: $(this).closest('.ofu-field').data('url')
      uploadTemplateId: null
      downloadTemplateId: null
      paramName: 'files[]'
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $(this).closest('.ofu-field').find('.ofu-progress-bar').css('width', progress + "%").text(progress + "%")
    ).bind('fileuploadstart', (e, data) ->
      window.ofuFileCount++
      $(this).closest('.ofu-field').find('.ofu-files-container').empty()
      $(this).closest('.ofu-field').find('.ofu-files-container').append("<div class='progress'><div class='ofu-progress-bar bar' style='width: 0;'></div></div>")
      return
    ).bind('fileuploaddone', (e, data) ->
      $(this).closest('.ofu-field').find('input[type=hidden]').val(data.result.files[0].id)

      window.ofuFileCount--
      return
    ).bind('fileuploadfail', (e, data) ->
      window.ofuFileCount--
      return
    ).bind('fileuploadadd', (e, data) ->
      $(this).closest('.ofu-field').find('.ofu-files-container').empty()
      return
    )

window.ofuFileCount = 0

$(document).ready ->
  $('.ofu-field[data-auto=true]').ouvragesFileUpload()

$(window).bind 'beforeunload', ->
  if window.ofuFileCount > 0
    console.log("PREVENT")
