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

    if ($('#infinite-scrolling-user').size() > 0) {
        $(window).on("scroll", function(){
            var more_blogs_user = $('.pagination .next_page a').attr('href');
            if (more_blogs_user && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
                $('.pagination').html('<i class="fa fa-spinner fa-spin" style="font-size:40px; color: black;"></i>');
                $.getScript(more_blogs_user);
            }
        });
    }

});