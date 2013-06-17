require 'rubygems'
require 'twitter'

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
	def initialize(palabra,cantidad=2)
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
		puts "Buscando: "+palabra+" #Resultados: "+cantidad.to_s
		@resultado = Twitter.search(palabra, :count => cantidad, :result_type => "recent", :lang => "es").results.map do |status|
			"#{status.created_at}--tweetSeparator--#{status.from_user}--tweetSeparator--#{status.full_text}--tweetSeparator--#{status.user.profile_image_url(size=:bigger)}"
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
