
$(document).on("turbolinks:load", function () {

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

        $.ajax({
            url: '/admin/blogs/'+ blogID,
            dataType: 'script',
            method: 'patch',
            data: {redirect_check: 1, blog:{isPublic: button_val}},
            success: function(){
            }
        });
    });

    $(".change_time_button").on("click", function(){
        var blogID = $(this).parent().attr("change_sattus_id");
        $(this).hide();
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
        $.ajax({
            url: '/admin/blogs/'+ blogID,
            dataType: 'script',
            method: "patch",
            data: {redirect_check: 1, blog:{datePublic: data.date.format("Y-MM-D hh:mm") }},
            success: function(){
                //$("#public_time_"+ blogID).html(data.date.format("Y年MM月D日 hh:mm"));
            }
        });
    });



    $(document).ready(function() {

        $("#title_error_message").hide();
        $("#date_error_message").hide();
        $("#image_error_message").hide();
        $("#content_error_message").hide();
        $("#author_error_message").hide();
        $("#jobName_error_message").hide();
        $("#age_error_message").hide();

        // validate for title input
        $("#title-input").focusout(function () {
           var val = $(this).val();
            if (val == '')
            {
                $("#title_error_message").html("タイトルを入カしてください。");
                $("#title_error_message").show();
            }
            else if (val.length > 2){
                $("#title_error_message").html("255文字以内で入カしてください。");
                $("#title_error_message").show();
            }else
            {
                $("#title_error_message").hide();
            }
        });

        // validate for datetime input
        $("#datetimepicker").focusout(function () {
            var val = $(this).val();
            if(val == '')
            {
                $("#date_error_message").html("公開日時を設定して下さい。");
                $("#date_error_message").show();
            }
            else{
                $("#date_error_message").hide();
            }
        });

        // validate for image input
        $("#dimage").change(function() {
            var val = $(this).val();
            if (!val.match(/(?:png|jpeg)$/)) {
                $("#image_error_message").html("不正なファイル形式です")
                $("#image_error_message").show();
            }else {
                $("#image_error_message").hide();
            }

        });
        
        // validate content input
        $("#content-text").focusout(function () {
            var val = $(this).val();
            if (val.size() > 256)
            {
                $("#content_error_message").html("本文は2MB以内で作成して下さい。");
                $("#content_error_message").show();
            }
            else {
                $("#content_error_message").hide();
            }
        });

        // validate author input
        $("#author-text").focusout(function () {
            var val = $(this).val();
            if(val == ''){
                $("#author_error_message").html("名前を入カしてください。");
                $("#author_error_message").show();
            }else if (val.length > 32) {
                $("#author_error_message").html("32文字以内で入カしてください。");
                $("#author_error_message").show();
            }else {
                $("#author_error_message").hide();
            }
        });

        //validate job name input
        $("#jobName-text").focusout(function () {
            var val = $(this).val();
            if(val == ''){
                $("#jobName_error_message").html("職業を入カしてください。");
                $("#jobName_error_message").show();
            }else if (val.length > 32) {
                $("#jobName_error_message").html("32文字以内で入カしてください。");
                $("#jobName_error_message").show();
            }else {
                $("#jobName_error_message").hide();
            }
        });
        
        //validate age input
        $("#age-input").focusout(function () {
            var val = $(this).val();
            if(val == ''){
                $("#age_error_message").html("年齢を入カしてください。");
                $("#age_error_message").show();
            }else if (val.length > 2) {
                $("#age_error_message").html("2文字以内で入カしてください。");
                $("#age_error_message").show();
            }else if (!Number(val)){
                $("#age_error_message").html("数字を入カしてください。");
                $("#age_error_message").show();
            }else {
                $("#age_error_message").hide();
            }
        });
        
    });

});

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









