$(function(){
    $('#login').on('click', function(){
        setTimeout(function(){
            $.Notify({type: 'success', caption: 'Success', content: "Welcome"});
        }, 2000);
    });
});

//
// function updateRole(role) {
//     $("#update").val(`${role.title}`);
//     $('#editform').attr('action', `/roles/${role.id}`);
// }