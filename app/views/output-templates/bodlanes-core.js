var bodlanes = JSON.parse($('#bodlanes-json').html());
var presentation = JSON.parse($('#presentation-json').html());
var content_blocks = JSON.parse($('#content-blocks-json').html());
var media_files = JSON.parse($('#media-files-json').html());

/* Callbacks (plugin engine) */
var callbacks = [];
function executeCallback(code, param){
  for(var i = 0; i < callbacks.length; i++){
    var callback_function  = callbacks[i];
    if(callback_function.code != code) continue;
    callback_function.execute(param);
  }
}
function addCallback(callback){
  callbacks.push(callback);
}

/* Timers (chronological interaction engine) */
var timers = {};

/* Core functionality established on load */
$(function(){
  /* Pre-renders the content blocks into the DOM for quick hot-swapping later */
  function setUpPrerenderedBlocks(){
    $('body').append('<div id="content-blocks-ready" />');
    var readyArea = $('#content-blocks-ready');
    content_blocks.forEach(function(content_block){
      readyArea.append('<div class="content-block-ready" data-id="'+content_block.id+'">'+content_block.content+'</div>')
    });
  }

  /* Sets up a timer containers for each content area */
  function setUpTimerContainers(){
    $('.content-area').each(function(){
      timers[$(this).data('id')] = [];
    });
  }

  /* Clears all timers on a content area */
  function clearTimersFromArea(area_id){
    for(var i = 0; i < timers[area_id].length; i++) clearTimeout(timers[area_id][i]);
  }

  /* Adds a timer to a content area */
  function addTimerToArea(area_id, timer){
    if(timer.type == 'after'){
      if(timer['after-action'] == 'go'){
        timers[area_id].push(setTimeout(function(){
          renderBlock(timer['after-action-go-block'], timer['after-action-go-area']);
        }, timer['after-ms']));
      } else {
        console.log("Didn't understand 'after' timer action: " + timer['after-action']);
      }
    } else {
      console.log("Didn't understand timer type: " + timer.type);
    }
  }

  // Returns an array of all content blocks currently visible
  function currentlyVisibleContentBlockIds(){
    return $('.content-block-ready:visible').map(function(){return(parseInt($(this).data('id')));}).toArray();
  }

  /* Triggered upon change of the URL hash */
  function hashChanged(){
    //console.log('hashChanged()');
    if(window.ignoreHashChanges) return;
    var already_visible_block_ids = currentlyVisibleContentBlockIds();
    var block_ids = window.location.hash.substr(1).split(',').map(function(id){ return(parseInt(id)); }).filter(function(id){ return !already_visible_block_ids.includes(id); });
    //console.log('to ' + block_ids.join(','));
    for(var i = 0; i < block_ids.length; i++) renderBlock(block_ids[i]);
  }

  /* Writes a hash to the URL with all the currently-visible content blocks, so refresh/back works */
  function writeHash(){
    //console.log('writeHash()');
    window.ignoreHashChanges = true;
    window.location.hash = $('.content-area').map(function(){return($(this).data('content-block-id'))}).toArray().join(',');
    window.ignoreHashChanges = false;
  }

  /* Gives a block ID, returns that block */
  function getBlock(block_id){
    return content_blocks.find(function(b){ return(b.id == block_id); });
  }

  /* Given a block ID, renders that block to the specified area ID - if area ID not specified, block default used */
  function renderBlock(block_id, area_id){
    var block = getBlock(block_id);
    if(!block) {
      console.log('ERROR: block ' + block_id + ' not found in renderBlock('+ block_id + ', ' + area_id + ')');
      return;
    }
    executeCallback('beforeRenderBlock', { block_id: block_id, area_id: area_id });
    area_id = area_id || block.content_area_id;
    /* Clear any old timers */
    clearTimersFromArea(area_id);
    /* Render the content */
    var html = $("#content-blocks-ready .content-block-ready[data-id='"+block_id+"']").clone(); /* Clone from the DOM preload rather than rendering from the JSON, for speed. */
    $(".content-area[data-id='"+area_id+"']").html(html).data('content-block-id', block_id);
    /* Set up any timers */
    if(block.timings && block.timings != ""){
      var timings = JSON.parse(block.timings);
      for(var i = 0; i < timings.length; i++) addTimerToArea(area_id, timings[i]);
    }
    writeHash();
    executeCallback('afterRenderBlock', { block_id: block_id, area_id: area_id });
  }

  /* Renders each 'default' block into its default area */
  function renderDefaultBlocks(){
    for(block of content_blocks.filter(function(b){ return(b.default); })){
      renderBlock(block.id);
    }
  }

  /* Sets up hooks to capture <a> clicks */
  function setUpHooks(){
    $('body').on('click', 'a, area', function(event){
      var a = $(event.target).closest('a, area');
      var href = a.attr('href').match(/(\d+)$/);
      if(href){
        a.closest('.content-area').find('a, area').removeClass('last-clicked');
        a.addClass('last-clicked');
        renderBlock(parseInt(href[0]), parseInt(a.attr('target')));
        return false;
      }
    });
  }

  /* If hash (anchor) provided, jump to specified content block(s) after launch */
  preloads = window.location.hash.substr(1).split(',');

  /* Launch the application */
  setUpPrerenderedBlocks();
  setUpTimerContainers();
  renderDefaultBlocks();
  setUpHooks();

  /* If hash (anchor) provided, jump to specified content block(s) after launch */
  for(var i = 0; i < preloads.length; i++) renderBlock(preloads[i]);

  /* Monitor subsequent hash changes */
  window.onhashchange = hashChanged;
});
