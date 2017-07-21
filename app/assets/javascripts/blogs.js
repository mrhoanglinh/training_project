
// show datePicker
// $(document).ready(function(){
//     $('#datetimepicker').datetimepicker();
// });

// preview image before upload
var loadImageFile = function(event) {
    var previewImage = document.getElementById('previewImage');
    previewImage.src = URL.createObjectURL(event.target.files[0]);
};
// preview avatar before upload
var loadAvatar = function(event) {
    var previewAvatar = document.getElementById('previewAvatar');
    previewAvatar.src = URL.createObjectURL(event.target.files[0])
}








