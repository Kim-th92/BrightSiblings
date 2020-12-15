
    var wsUri = "ws://localhost:8181/ex/count";

    function send_message() {

        websocket = new WebSocket(wsUri);
        websocket.onopen = function(evt) {

            onOpen(evt);

        };

        websocket.onmessage = function(evt) {

            onMessage(evt);

        };

        websocket.onerror = function(evt) {

            onError(evt);

        };

    }


    function onOpen(evt) 

    {

       websocket.send("${nick}");

    }

    function onMessage(evt) {

    		$('#count').append(evt.data);

    }

    function onError(evt) {

    }

    $(document).ready(function(){

    		send_message();

    });

//--------

$("#search_btn").click(function(){
		$(".search-hide").stop().slideDown(500);
	return false; //중요
});
 $(document).click(function(e){ 
		if(e.target.className =="search-hide"){return false}
	  		$(".search-hide").stop().slideUp(500);
			
});

 $("#btn_profile").click(function(){
		$("#hide").stop().slideDown(500);
	return false; //중요
});
$(document).click(function(e){ 
		if(e.target.className =="hide"){return false}
	  		$("#hide").stop().slideUp(500);
			
});


$("#btn_msg").click(function(){
	$("#msg-hide").stop().slideDown(500);
return false; //중요
});
$(document).click(function(e){ 
	if(e.target.className =="msg-hide"){return false}
  		$("#msg-hide").stop().slideUp(500);
		
});


	$( document ).ready( function() {
        var jbOffset = $( 'header' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( 'header' ).addClass( 'headerFixed' );
          }
          else {
            $( 'header' ).removeClass( 'headerFixed' );
          }
        });
      } );