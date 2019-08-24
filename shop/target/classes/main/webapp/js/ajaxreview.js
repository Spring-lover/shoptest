jQuery(document).ready(function($){
    $("#review_btn").click(function () {
        var text = $("#Your_review").val();
        $.get("reviewServlet", {text: text}, function (data) {
            var home_view=$("#home_view");
            var view='<p><textarea cols="20" rows="10">'+data.msg+'</textarea></p>';
            home_view.append(view);
            $("#Review").style.display="none";
        });
        return false;
    });
    $("#Description").click(function () {
        $("#home").toggle();
    })
    $("#Reviews").click(function () {
        $("#Review").toggle();
    })
});