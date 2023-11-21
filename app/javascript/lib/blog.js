$(function(){
    alert('jQuery is working!');

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
    $('#load-comments').on('click', function (){
        const url = '/categories/1/articles/3/comments';
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
        })
    });
});