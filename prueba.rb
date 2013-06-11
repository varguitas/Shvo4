require 'rubygems'
require 'sinatra'
require 'slim'
require "instagram"
require "twitter"

# Clase CInstagram
# Atributo: resultado -> atributo de solo lectura, posee los resultados de realizar las consultas en Instagram
# Paquetes requeridos: rubygems & instagram
# CONSTRUCTOR:
#	- palabra:texto
#	- cantidad:entero,opcional
# METODOS:
#	- imprimirResultado() : Imprime el texto con el resultado de las busquedas en instagram
#	- obtenerResultado() : Retorna el texto con el resultado de las busquedas en instagram
# ---------------------------------------------------------------------------------------

class CInstagram
	attr_reader :resultado
	def initialize(palabra,cantidad=15)
		Instagram.configure do |config|
		  config.client_id = "410015208"
		  config.access_token = "410015208.5b9e1e6.809706cd64d54c0799ff38ba225a7d8d"
		end
		# Instagram.tag_recent_media
		#	- palabra: hastack
		#	- count: Cantidad de fotos
		# Para mas informacion visitar: http://rubydoc.info/github/Instagram/instagram-ruby-gem/index
		######################################################################
		@resultado = Instagram.tag_recent_media(palabra,options={:count=>cantidad})
	end
	
	public
	def imprimirResultado
		puts @resultado
	end
	
	def obtenerResultado
		return @resultado
	end
end

# Clase CTwitter
# Atributo: resultado -> atributo de solo lectura, posee los resultados de realizar las consultas en Twitter
# de realizar las consultas en Twitter
# Paquetes requeridos: rubygems & twitter
# CONSTRUCTOR:
#	- palabra:texto
#	- cantidad:entero,opcional
# METODOS:
#	- imprimirResultado() : Imprime el texto con el resultado de las busquedas en twitter
#	- obtenerResultado() : Retorna el texto con el resultado de las busquedas en twitter
# ---------------------------------------------------------------------------------------
class CTwitter
	attr_reader :resultado
	def initialize(palabra,cantidad=15)
		Twitter.configure do |config|
		  config.consumer_key = "wMT3UONrMDrjddhZDK4qw"
		  config.consumer_secret = "tiz9MRNRjg2agJcTqhLFItTGfuAyjbzPuXF2FoBaTI"
		  config.oauth_token = "473447215-xv3DRZb8BxtFJ2MeWshP5pay0JlkYZrOs3uMKTjA"
		  config.oauth_token_secret = "gO1pRSj1EDf1GegMoxQ2Bat47P8mmTyq7kn7L02k0zE"
		end
		# Twitter.search
		#	- palabra: hastack
		#	- count: Cantidad de twitts
		#	- result_type: puede ser recent, popular o mixed
		# Para mas informacion visitar: http://rdoc.info/gems/twitter/index
		######################################################################
		@resultado = Twitter.search(palabra, :count => cantidad, :result_type => "recent").results.map do |status|
			"#{status.created_at}--tweetSeparator--#{status.from_user}--tweetSeparator--#{status.full_text}--tweetSeparator--#{status.user.profile_image_url(size=:bigger)}--tweetEnd--"
		end
	end
	
	public
	def imprimirResultado
		puts @resultado
	end
	
	def obtenerResultado
		return @resultado
	end
end


# CLASE MAIN

get '/' do
	if params[:search].nil?
		slim :index
	else
		twt = CTwitter.new(params[:search])
		ins = CInstagram.new(params[:search])
		twt.obtenerResultado
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
div.encabezado
	h1 Twitter & Instagram search
div.contenido
	div.searchBox
		div.send
			input.search type="text"
			div.go
				img src="images/go.png" width="48px" height="48px"
		div.center
			img.twitter-logo src="images/twitter.png" width="72px" height="72px" alt="Twitter" title="Twitter"
			img.instagram-logo src="images/instagram.png" width="72px" height="72px" alt="Instagram" title="Instagram"
div.pie

