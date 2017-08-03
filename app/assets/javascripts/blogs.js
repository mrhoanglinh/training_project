
$(document).on("turbolinks:load", function () {

    // preview image
    $(function() {
        var imagesPreview = function(input, placeToInsertImagePreview) {

            if (input.files) {
                var filesAmount = input.files.length;

                for (i = 0; i < filesAmount; i++) {
                    var reader = new FileReader();

                    reader.onload = function(event) {
                        $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                    }

                    reader.readAsDataURL(input.files[i]);
                }
            }

        };

        // preview image blog
        $('#dimage').on('change', function() {
            $('.image_preview').empty();
            imagesPreview(this, 'div.image_preview');
        });

        // preview image author
        $('#author_image').on('change', function() {
            $('.author_image_preview').empty();
            imagesPreview(this, 'div.author_image_preview');
        });        
    });

    // show preview content from ckeditor
    $("#preview").on("click", function(event)
    {
        var content = CKEDITOR.instances['content_text'].getData();
        $("#modal_content").html(content);
        $("#myModal").modal();
        $('#myModal').on('hidden.bs.modal', function(){
            $("video").each(function () { this.pause() });
        });

        event.preventDefault();
    });

    // change public status
    $(".public_button").on("click", function(){
        var blogID = $(this).parent().attr("change_sattus_id");
        var button_val = $(this).attr("public_status");

        $.ajax({
            url: '/admin/blogs/'+ blogID,
            dataType: 'script',
            method: 'patch',
            data: {redirect_check: 1, blog:{isPublic: button_val}},
            success: function(){
                if (button_val == 1)
                {
                    $("#unpublic_button_" + blogID).show();
                    $("#public_button_" + blogID).hide();
                    $("#public_id_" + blogID).html('公開中')
                }
                else
                {
                    $("#unpublic_button_" + blogID).hide();
                    $("#public_button_" + blogID).show();
                    $("#public_id_" + blogID).html('非公開中')
                }
            }
        });
    });

    $(".change_time_button").on("click", function(){
        var blogID = $(this).parent().attr("change_sattus_id");
        // $(this).hide();
        $("#public_time_" + blogID).hide();
        $("#input_date_" + blogID).show();
    });

    $('.input_date').datetimepicker({
        format: 'YYYY-MM-DD hh:mm:ss',
        useCurrent: false
    });

    // $('.datetimepicker_cell').datetimepicker({
    //     useCurrent: false
    // });

    $('.datetimepicker_cell').on('dp.change', function(data){
        var blogID = $(this).parent().attr("change_sattus_id");
        $(".bootstrap-datetimepicker-widget").hide();
        $("#public_time_"+ blogID).html(data.date.format("Y年MM月D日 hh:mm"));
        $("#change_time_button_"+ blogID).show();
        $("#input_date_"+ blogID).hide();
        $("#public_time_"+ blogID).show();
        dateTime = data.date.format("Y-MM-D hh:mm")
        $.ajax({
            url: '/admin/blogs/'+ blogID,
            dataType: 'script',
            method: "patch",
            data: {redirect_check: 1, blog:{datePublic:  dateTime}},
            success: function(){ 
                if (new Date() > new Date(dateTime))
                {
                    $("#public_id_" + blogID).html('公開中')
                }
                else 
                {
                    $("#public_id_" + blogID).html('非公開中')
                }                               
            }
        });        
    });

    // back button click
    $('#back_page').on('click', function(){
        $('.image_preview').empty();
        imagesPreview(this, 'div.image_preview');

        $('.author_image_preview').empty();
        imagesPreview(this, 'div.author_image_preview');
    });

});

// // preview image before upload
// var loadImageFile = function(event) {
//     var previewImage = document.getElementById('previewImage');
//     previewImage.src = URL.createObjectURL(event.target.files[0]);
// };
//
// // preview avatar before upload
// var loadAvatar = function(event) {
//     var previewAvatar = document.getElementById('previewAvatar');
//     previewAvatar.src = URL.createObjectURL(event.target.files[0])
// }









