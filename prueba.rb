require 'rubygems'
require 'sinatra'
require 'slim'
require "instagram"
require "twitter"
load 'public/lib/CInstagram.rb'
load 'public/lib/CTwitter.rb'
load 'public/lib/listaInstagram.rb'
load 'public/lib/listaTwitter.rb'
load 'public/lib/nodoTw.rb'
load 'public/lib/nodoIn.rb'

# INICIA CLASE MAIN
$listaTwitter=ListaTwitter.new()
$listaInstagram=ListaInstagram.new()
def analizarTextoTwitter(lista)
	largo=lista.count
	contador=0
	while contador<largo do
		listaTweet=lista[contador].split("--tweetSeparator--")
		$listaTwitter.insertar(listaTweet[1],listaTweet[3],listaTweet[2],listaTweet[0])
		contador+=1
	end
end


get '/' do
	if params[:search].nil?
		slim :index
	else
		@resultadoTw=""
		@resultadoIn=""
		puts "RESULTADO: "+@resultadoTw
		if not params[:twitter].nil?
			if params[:count].nil?
				twt = CTwitter.new(params[:twitter])
			else
				twt = CTwitter.new(params[:twitter],params[:count])
			end
			twResultados = twt.obtenerResultado
			analizarTextoTwitter(twResultados)
			@resultadoTw = "<div class='tw-div'>"+$listaTwitter.obtenerHtml+"</div>"
		end
		if not params[:instagram].nil?
			ins = CInstagram.new(params[:instagram])
			#QUEDA PENDIENTE
		end
		slim :busqueda
	end
end
__END__
@@layout
doctype html
html
  head
    meta charset="utf-8"
    title Twitter & Instagram search
    link rel="stylesheet" media="screen, projection" href="/css/index.css"
    link rel="stylesheet" media="screen, projection" href="/css/jqueryui.css"
    script src="/js/jquery.js"
    script src="/js/jqueryui.js"
    script src="/js/parametros.js"
    script src="/js/index.js"
  body
    == yield
@@index
div.capaProtectora
div.encabezado
	h1 Twitter & Instagram search
div.contenido
	div.searchBox
		div.send
			input.search type="text" title="Solamente letras sin caracteres especiales"
			div.go
				img src="images/go.png" width="48px" height="48px"
		div.center
			img.twitter-logo src="images/twitter.png" width="72px" height="72px" alt="Twitter" title="Twitter"
			img.instagram-logo src="images/instagram.png" width="72px" height="72px" alt="Instagram" title="Instagram"
div.about
	h1 Sobre este trabajo...
	hr
	p Este trabajo ha sido desarrollado para el curso de lenguajes de programación del Tecnológico de Costa Rica, impartido por el profesor Andrei Fuentes Leiva el primer semestre de 2013.
	p El contenido de la aplicación corresponde a:
	ul
		li Víctor Vargas Ramírez
		li Jose Pablo Matamoros Moya
	p Para más información:
	ul
		li vargasvr94@gmail.com
		li josepablomatamoros@gmail.com
@@busqueda
div.encabezado
	h1 Twitter & Instagram search
div.contenido
		= @resultadoTw
