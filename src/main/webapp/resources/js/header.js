    


   

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