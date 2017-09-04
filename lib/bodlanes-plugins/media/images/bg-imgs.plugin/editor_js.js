$.getJSON('/presentations/2/media_files.json', function(media_files){ // TODO: stop hard-coding presentation number!
  media_files.forEach(function(media_file){
    if(!media_file.file_content_type.match(/^image\//)) return;
    $('#bg-imgs-image').append('<option value="' + media_file.file + '">' + media_file.file_file_name + '</option>');
  });
  if(currentImage = JSON.parse($('#original-content-block-plugin-options').text()).filter(function(o){ return(o['name']=='bg-imgs[image]'); })[0]){
    $('#bg-imgs-image').val(currentImage.value);
  }
});
