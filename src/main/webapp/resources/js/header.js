   
$("#search_btn").click(function(){
		$(".search-hide").stop().slideDown(500);
	return false; //중요
});


 $("#btn_profile").click(function(){
		$("#hide").stop().slideDown(500);
	return false; //중요
});
$(document).click(function(e){ 
		if(e.target.className =="hide"
		||e.target.id=="msg-hide"
		||e.target.className =="search"){
			e.preventDefault();
			}
	$("#hide").stop().slideUp(500);
	$("#msg-hide").stop().slideUp(500);
	$(".search_hide").stop().slideUp(500);
		
			
});

$("#btn_msg").click(function(){
	$("#msg-hide").stop().slideDown(500);
return false; //중요
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