$(document).ready(function(){
	/* Herramiento de JQueryUI para mostrar ayuda al usuario */
	$(".search").tooltip();
	/* Se inicializan variables */
	var tweet = true;
	var insta = true;
	/* Se ocultan divs que no sean necesarios desde el inicio */
	$(".searchBox").hide();
	$(".capaProtectora").hide();
	
	/* Función para rotar elementos */
	(function($){
	 var _e = document.createElement("canvas").width
	 $.fn.cssrotate = function(d) {  
		return this.css({
	  '-moz-transform':'rotate('+d+'deg)',
	  '-webkit-transform':'rotate('+d+'deg)',
	  '-o-transform':'rotate('+d+'deg)',
	  '-ms-transform':'rotate('+d+'deg)'
	 }).prop("rotate", _e ? d : null)
	 }; 
	 var $_fx_step_default = $.fx.step._default;
	 $.fx.step._default = function (fx) {
	 if(fx.prop != "rotate")return $_fx_step_default(fx);
	 if(typeof fx.elem.rotate == "undefined")fx.start = fx.elem.rotate = 0;
	 $(fx.elem).cssrotate(fx.now)
	 }; 
	})(jQuery);

	/* Si no hay busqueda activa muestre el buscador, de lo contrario muestre el contenido de la busqueda */
	if ($.getURLParam("search") == null) {
		$(".contenido").css("background","#CCC");
		$(".encabezado h1").effect("slide",options = { to: { width: 200, height: 60 } },1000).promise().done(function(){
			$(".searchBox").slideDown("slow");
		});
	}
	else{
		$(".contenido").css("height","500px").promise().done(function(){
			$(".contenido").css("height","auto");
		});
		$(".contenido").css("margin-top","40px");
		$(".contenido").html($.parseHTML($(".contenido").text()));
	}
	
	/* Eventos para el click sobre las imagenes Twitter & Instagram. (Activar o Desactivar) */
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
	
	/* Evento para cuando el usuario presiona el boton buscar */
	$(".go").click(function() {
		/* Si la busqueda está en blanco mueva el input y no haga nada */
		if($(".search").val()==""){
			$(".search").effect("shake",options = { to: { width: 10, height: 0 } },500);
		}
			else{
				/* Se realizan comprobaciones de busqueda */
			if(tweet && insta) {
				$(".capaProtectora").fadeIn();
				window.location = "?twitter="+$.trim($(".search").val())+"&instagram="+$.trim($(".search").val())+"&search=true";
			}
			else if(tweet && !insta) {
				$(".capaProtectora").fadeIn();
				window.location = "?twitter="+$.trim($(".search").val())+"&search=true";
			}
			else if(!tweet && insta) {
				$(".capaProtectora").fadeIn();
				window.location = "?instagram="+$.trim($(".search").val())+"&search=true";
			}
			else {
				$(".center").effect("shake",options = { to: { width: 10, height: 0 } },500);
			}
		}
	});
});
