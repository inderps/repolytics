$(document).ready(function(){
   $('#tags').tagsInput({
       'onAddTag':Settings.onAddTag,
        'onRemoveTag':Settings.onRemoveTag,
        'removeWithBackspace' : true
        });
    });

var Settings = {
    onAddTag: function(element) {
        $.ajax({
            url: "committers",
            type: "post",
            data: {"name" : element},
            success: function(committers) {
            }
        });
    },

    onRemoveTag: function(element) {
        console.log(element);
    }
}