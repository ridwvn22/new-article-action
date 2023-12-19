$(function(){
    //alert('jQuery is working!');

    // form calidation for comment body
    $('#comment-body').on('input', function(){
        console.log('Input event fired');
        const value = $(this).val().trim();
        const submitButton = $(this).closest('form').find('input[type="submit]');

        if (value === ''){
            $(this).css('border-color', 'red');
            submitButton.prop('disabled', true);
        } else{
            $(this).css('border-color', '');
            submitButton.prop('disabled', false);
        }
     });
    //Dynamic content loading for comments
    $('#load-comments').on('click', function () {
        const categoryId = $('#category-id').data('category');
        const articleId = $('#load-comments').data('article');

        console.log(categoryId);
        console.log(articleId);
        const url = `/categories/${categoryId}/articles/${articleId}/comments`;
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
            //append the new comments to the container comments
        })
        .fail(function (jqXHR, textStatus, errorThrown){
            console.error('Error fetching comments:', error);
            
        });
            //add fail callback to handle error messaging
        });
});