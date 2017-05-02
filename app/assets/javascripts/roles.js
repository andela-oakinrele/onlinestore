
// $( document ).ready(function() {
//     $("#createRole").on('click', function(){
//         $.Dialog({
//             overlay: true,
//             shadow: true,
//             flat: true,
//             icon: '<img src="images/excel2013icon.png">',
//             title: 'Create Role',
//             content: '',
//             padding: 10,
//             onShow: function(_dialog){
//                 var content = '<form>' +
//                     '<label>Login</label>' +
//                     '<div class="input-control text">' +
//                     '<input type="text" name="login">' +
//                     '<button class="btn-clear"></button></div> ' +
//                 '<label>Password</label>' +
//                 '<div class="input-control password">' +
//                '<input type="password" name="password"> ' +
//                     '<button class="btn-reveal"></button></div>' +
//                 '<div class="input-control checkbox"> ' +
//                 '<label><input type="checkbox" name="c1" checked/> ' +
//                 '<span class="check"></span>Check me out</label></div>'+
//                 '<div class="form-actions">' +
//                 '<button class="button primary">Login to...</button> '+
//                 '<button class="button" type="button" onclick="$.Dialog.close()">Cancel</button> '+
//                 '</div>'+
//                 '</form>';
//
//                 $.Dialog.title("User login");
//                 $.Dialog.content(content);
//                 $.Metro.initInputs();
//             }
//         });
//     });
// });


// $( document ).ready(function() {
//     $(".deleterole").on('click', function(){
//         console.log('i got here');
//         $.Dialog({
//             overlay: true,
//             shadow: true,
//             flat: true,
//             title: "Confirm delete",
//             content: "You are about to delete a role.. Continue???",
//             actions: [
//                 {
//                     title: "Ok",
//                     onclick: function(el){
//                         $(el).data('dialog').close();
//                         window.location.assign("/roles")
//                     }
//                 },
//                 {
//                     title: "Cancel",
//                     cls: "js-dialog-close"
//                 }
//             ],
//             options: {
//             }
//         });
//     });
// });

function updateRole(role) {
    $("#update").val(`${role.title}`);
    $('#editform').attr('action', `/roles/${role.id}`);
}
//Override the default confirm dialog by rails
$(document).ready(function () {

    $.rails.allowAction = function(link){
        console.log('aa');
        if (link.data("confirm") == undefined){
            return true;
        }
        $.rails.showConfirmationDialog(link);
        return false;
    }
    //User click confirm button
    $.rails.confirmed = function(link){
        link.data("confirm", null);
        link.trigger("click.rails");
    }
    //Display the confirmation dialog
    $.rails.showConfirmationDialog = function(link){
        var message = link.data("confirm");
        $.Dialog({
            overlay: true,
            shadow: true,
            flat: true,
            title: "Confirm delete",
            content: "You are about to delete a role.. Continue???",
            actions: [
                {
                    title: "Ok",
                    onclick: function(el){
                        $(el).data('dialog').close();
                        $.rails.confirmed(link);
                    }
                },
                {
                    title: "Cancel",
                    cls: "js-dialog-close"
                }
            ],
            options: {
            }
        });
    }

    $(".edit").click(function(event){
        event.preventDefault();
    });

})