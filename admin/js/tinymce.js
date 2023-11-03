tinymce.init({
  selector: "textarea", // change this value according to your HTML
  plugins: "advlist",
  custom_undo_redo_levels: 10
});


$(document).ready(function() {
    $('#selectAll').click(function(event){
        if(this.checked) {
            $('.postBulkOperation').each(function(){
                this.checked = true;
            });
        } else {
            $('.postBulkOperation').each(function(){
                this.checked = false;
            });
        }
    });    
});
