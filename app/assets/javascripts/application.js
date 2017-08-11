// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require moment
//= require bootstrap-datetimepicker
//= require jquery-fileupload
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.inview.min.js
//= require_tree .

$(document).on("turbolinks:load", function () {

    // show datePicker
    $(document).ready(function(){
        $('#datetimepicker').datetimepicker({
            format: 'YYYY-MM-DD hh:mm'
        });
    });

    $(".footer-menu").on("click", function(){
        $(".footer-menu").removeClass("active");
        $(this).addClass("active");
    });

    var loading_posts = false;
    $('a.infinite-scrolling-user').on('inview', function(e, visible) {
        if(loading_posts == true || visible == true){
            loading_posts = true;
            $.getScript($(this).attr('href'), function () {
                loading_posts = false;
            });
        };
    });

});