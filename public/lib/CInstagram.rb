require "rubygems"
require "instagram"

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
