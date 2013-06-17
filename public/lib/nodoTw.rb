# Clase NodoTwitter
# Atributos:
#	autorNombre: -> Nombre del usuario que realiza el tweet
#	autorImagen: -> Imagen de perfil del usuario que realiza el tweet
#	mensaje: -> texto del tweet realizado
#	hora: -> hora en la que se realizo el tweet
#	sigNodo: -> Nodo siguiente en la lista de nodos
#	antNodo: -> nodo anterior en la lista de nodos
# CONSTRUCTOR:
#	- autorNombre:texto
#	- autorImagen:texto
#	- mensaje:texto
#	- hora:texto
#	- sigNodo:NodoTwitter
#	- antNodo:NodoTwitter
# METODOS:
#	- obtenerHtml() : Devuelve html correspondiente al nodo
# ---------------------------------------------------------------------------------------
class NodoTwitter 
	attr_reader :autorNombre,:autorImagen,:mensaje,:hora
	attr_writer :sigNodo,:antNodo
	def initialize(sig,ant,autorN,autorI,mensaje,hora)
		@autorNombre=autorN
		@autorImagen=autorI
		@mensaje=mensaje
		@hora=hora
		@sigNodo=sig
		@antNodo=ant
	end
	public
	def obtenerHtml
		return "<div class='tweet'><div class='tweet-img'><img width='50px' height='50px' alt='perfil image' src='"+@autorImagen+"' /></div><div class='tweet-content'><h1>"+@autorNombre+"</h1><p>"+@mensaje+"</p></div><span class='hora'>"+@hora+"</span></div>"
	end
	def sigNodoCambiar(nodo)
		@sigNodo=nodo
	end
	def obtenerSiguiente
		return @sigNodo
	end
	def obtenerAnterior
		return @antNodo
	end
	def obtenerAutor
		return @autorNombre
	end
end
