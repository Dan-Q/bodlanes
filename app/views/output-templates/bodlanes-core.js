var presentation = JSON.parse($('#presentation-json').html());
var content_blocks = JSON.parse($('#content-blocks-json').html());

$(function(){
  function getBlock(block_id){
    return content_blocks.find(function(b){ return(b.id == block_id); });
  }

  function renderBlock(block_id, area_id){
    var block = getBlock(block_id);
    area_id = area_id || block.content_area_id;
    $(".content-area[data-id='"+area_id+"']").html(block.content);
  }

  function renderDefaultBlocks(){
    for(block of content_blocks.filter(function(b){ return(b.default); })){
      renderBlock(block.id);
    }
  }

  function setUpHooks(){
    $('body').click('a', function(event){
      var a = $(event.target);
      var href = a.attr('href').match(/(\d+)$/);
      if(href){
        renderBlock(parseInt(href[0]), parseInt(a.attr('target')));
        return false;
      }
    });
  }

  renderDefaultBlocks();
  setUpHooks();
});
