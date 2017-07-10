var ready;
ready = function () {
    $(".btn-unPublic").click(function() {
        byebug
        console.log('click')
        console.log(this.getAttribute("data-id"))

        blogId = this.getAttribute("data-id")
        $.ajax({
            url: 'blogs/' + blogId + '/unPublic',
            // dataType: 'json',
            dataType: 'script',
            method: "post",
            data: {},
            success: function(data) {
                console.log('success')
                console.log(data)
            },
            error: function(error) {
                console.log('error')
                console.log(error)
            }

        })
    })

};

$(document).on('turbolinks:load', ready);