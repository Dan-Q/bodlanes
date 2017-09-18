// Show help when changing grid size (and on load)
$('#griddler-image').on('change', function(){
  $('.griddler-grid-details').hide().filter(`#griddler-grid-details-${$(this).val()}`).show();
});
setTimeout(function(){ $('#griddler-image').trigger('change'); }, 500);
