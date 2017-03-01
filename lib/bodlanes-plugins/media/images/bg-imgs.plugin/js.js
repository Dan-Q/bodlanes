addCallback({code: 'afterRenderBlock', execute: function(param){
  // extract relevant parameters
  var content_block = content_blocks.filter(function(cb){ return(cb.id == param.block_id); })[0];
  if(!content_block || !content_block.plugin_options || (content_block.plugin_options == "")) return;
  var json = JSON.parse(content_block.plugin_options);
  if(!json) return;
  bg_imgs_params = {};
  json.forEach(function(e){
    var matches = e.name.match(/^bg-imgs\[(.+)\]$/)
    if(matches) bg_imgs_params[matches[1]] = e.value;
  });
  console.log(bg_imgs_params);

  if((bg_imgs_params.image || '') != ''){
    $('.content-block-ready:visible').prepend('<img src="' + bg_imgs_params.image + '" class="' + bg_imgs_params.class + '" />');
  }
}});
