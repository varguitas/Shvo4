$(document).ready(function(){
	var tweet = true;
	var insta = true;
	$(".searchBox").hide();
	if ($.getURLParam("search") == null) {
		$(".encabezado h1").effect("slide",options = { to: { width: 200, height: 60 } },1000).promise().done(function(){
			$(".searchBox").slideDown("slow");
		});
	}
	else{
		$(".contenido").css("height","500px");
		$(".contenido").css("margin-top","40px");
	}
	$(".twitter-logo").on("click",function(){
		if(tweet){
			$(this).attr("src","images/twitter-disable.png");
			tweet=false;
		}
		else{
			$(this).attr("src","images/twitter.png");
			tweet=true;
		}
	});
	$(".instagram-logo").on("click",function(){
		if(insta){
			$(this).attr("src","images/instagram-disable.png");
			insta=false;
		}
		else{
			$(this).attr("src","images/instagram.png");
			insta=true;
		}
	});
	$(".go").click(function() {
		if(tweet && insta) {
			window.location = "?twitter="+$.trim($(".search").val())+"&instagram="+$.trim($(".search").val())+"&search=true";
		}
		else if(tweet && !insta) {
			window.location = "?twitter="+$.trim($(".search").val())+"&search=true";
		}
		else if(!tweet && insta) {
			window.location = "?instagram="+$.trim($(".search").val());
		}
		else {
			$(".twitter-logo").effect("shake",options = { to: { width: 10, height: 60 } },1000);
			$(".instagram-logo").effect("shake",options = { to: { width: 10, height: 60 } },1000);
		}
	});
});
