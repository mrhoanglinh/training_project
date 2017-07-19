$ ->
  $(document).ready ->
     $('#datetimepicker').datetimepicker()

  loadImageFile = (e) ->
    previewImage = document.getElementById('previewImage')
    previewImage.src = URL.createObjectURL(e.target.files[0])

  loadAvatar = (e) ->
    previewAvatar = document.getElementById('previewAvatar')
    previewAvatar.src = URL.createObjectURL(event.target.files[0])








