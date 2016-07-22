var presentation = JSON.parse($('#presentation-json').html());
var content_blocks = JSON.parse($('#content-blocks-json').html());

/* Callbacks (plugin engine) */
var callbacks = [];
function executeCallback(code, param){
  console.log(code);
  for(var i = 0; i < callbacks.length; i++){
    var callback_function  = callbacks[i];
    if(callback_function.code != code) continue;
    console.log(callback_function);
    callback_function.execute(param);
  }
}
function addCallback(callback){
  callbacks.push(callback);
}

/* Core functionality established on load */
$(function(){
  function getBlock(block_id){
    return content_blocks.find(function(b){ return(b.id == block_id); });
  }

  function renderBlock(block_id, area_id){
    var block = getBlock(block_id);
    executeCallback('beforeRenderBlock', { block_id: block_id, area_id: area_id });
    area_id = area_id || block.content_area_id;
    $(".content-area[data-id='"+area_id+"']").html(block.content).data('content-block-id', block_id);
    executeCallback('afterRenderBlock', { block_id: block_id, area_id: area_id });
  }

  function renderDefaultBlocks(){
    for(block of content_blocks.filter(function(b){ return(b.default); })){
      renderBlock(block.id);
    }
  }

  function setUpHooks(){
    $('body').on('click', 'a', function(event){
      var a = $(event.target);
      var href = a.attr('href').match(/(\d+)$/);
      if(href){
        a.closest('.content-area').find('a').removeClass('last-clicked');
        a.addClass('last-clicked');
        renderBlock(parseInt(href[0]), parseInt(a.attr('target')));
        return false;
      }
    });
  }

  renderDefaultBlocks();
  setUpHooks();
});
