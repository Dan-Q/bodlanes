addCallback({code: 'afterRenderBlock', execute: function(param){
  // set up storage space for 'dismissed' list (so we don't pop up oversplash every time, only after refresh)
  if(!window.oversplashDismissed) window.oversplashDismissed = [];

  // extract relevant parameters
  var content_block = content_blocks.filter(function(cb){ return(cb.id == param.block_id); })[0];
  if(!content_block || !content_block.plugin_options || (content_block.plugin_options == "")) return;
  var json = JSON.parse(content_block.plugin_options);
  if(!json) return;
  oversplash_params = {};
  json.forEach(function(e){
    var matches = e.name.match(/^oversplash\[(.+)\]$/)
    if(matches) oversplash_params[matches[1]] = e.value;
  });
  if(((oversplash_params.text || '') != '') && (window.oversplashDismissed.indexOf(param.block_id.toString()) == -1)){
    $('.content-block-ready:visible').append('<style type="text/css">.oversplash-wrapper { position: absolute; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0, 0, 0, 0.5); } .oversplash {  position: relative; top: 50%; transform: translateY(-50%); max-width: 60vw; border-radius: 20px; padding: 40px 60px; margin: 0 auto; text-align: center; background: white; color: black; font-size: 2em; }</style><div class="oversplash-wrapper"><div class="oversplash">' + oversplash_params.text + '</div></div>');
    $('.oversplash-wrapper, .oversplash').on('click', function(){
      window.oversplashDismissed.push(param.block_id.toString());
      $('.oversplash-wrapper').fadeOut();
    });
  }
}});
