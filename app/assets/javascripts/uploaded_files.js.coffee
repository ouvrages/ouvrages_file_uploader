#= require jquery-fileupload

$.fn.ouvragesFileUpload = ->
  this.each ->
    $(this).find('.ofu-input').fileupload(
      autoUpload: true
      url: $(this).closest('.ofu-field').data('url')
      uploadTemplateId: null
      downloadTemplateId: null
      paramName: 'files[]'
      dropZone: this
      pasteZone: this
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $(this).closest('.ofu-field').find('.ofu-progress-bar').css('width', progress + "%").text(progress + "%")
    ).bind('fileuploadstart', (e, data) ->
      window.ofuFileCount++
      filesContainer = $(this).closest('.ofu-field').find('.ofu-files-container')
      filesContainer.empty()
      filesContainer.append("<div class='progress'><div class='ofu-progress-bar bar' style='width: 0;'></div></div>")
      return
    ).bind('fileuploaddone', (e, data) ->
      if data.result.error or !data.result.files or data.result.files.length == 0
        $(this).closest('.ofu-field').find('.ofu-progress-bar').text("Error").closest(".progress").addClass("progress-danger")
        alert(data.result.error.message) if data.result.error.message
      else
        $(this).closest('.ofu-field').find('input[type=hidden]').val(data.result.files[0].id)
        $(this).closest('.ofu-field').find('.ofu-progress-bar').text($(this).closest('.ofu-field').data('text'))

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
