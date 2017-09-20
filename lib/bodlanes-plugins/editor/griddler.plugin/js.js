addCallback({code: 'afterRenderBlock', execute: function(param){
  // Get Griddler params for this content block, if available
  var content_block = content_blocks.filter(function(cb){ return(cb.id == param.block_id); })[0];
  if(!content_block || !content_block.plugin_options || (content_block.plugin_options == "")) return;
  var json = JSON.parse(content_block.plugin_options);
  if(!json) return;
  var griddler_params = {};
  json.forEach(function(e){
    var matches = e.name.match(/^griddler\[(.+)\]$/)
    if(matches) griddler_params[matches[1]] = e.value;
  });
  var grid_size = griddler_params['grid-size'];
  // Set up grid
  $(`.content-block-ready[data-id=${param.block_id}]`).css({
    'display': 'grid',
    'grid-template': `repeat(auto-fill, ${grid_size}) / repeat(auto-fill, ${grid_size})`,
    'height': '100%'
  });
}});
