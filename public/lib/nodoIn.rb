# Clase NodoInstagram
# Atributos:
#	autorNombre: -> Nombre del usuario que realiza el tweet
#	autorImagen: -> Imagen de perfil del usuario que realiza el tweet
#	mensaje: -> texto del tweet realizado
#	hora: -> hora en la que se realizo el tweet
#	sigNodo: -> Nodo siguiente en la lista de nodos
#	antNodo: -> nodo anterior en la lista de nodos
# CONSTRUCTOR:
#	- autorNombre:texto
#	- imagen:texto
#	- hora:texto
#	- sigNodo:NodoTwitter
#	- antNodo:NodoTwitter
# METODOS:
#	- obtenerHtml() : Devuelve html correspondiente al nodo
# ---------------------------------------------------------------------------------------
class NodoInstagram
	attr_reader :autorNombre,:imagen,:hora,:sigNodo,:antNodo
	def initialize(sig,ant,autorN,imagen,hora)
		@autorNombre=autorN
		@imagen=imagen
		@hora=hora
		@sigNodo=sig
		@antNodo=ant
	end
	public
	def obtenerHtml
		return "<div class='instaphoto'><h1>"+@autorNombre+"</h1><img class='instaImage' width='50px' height='50px' alt='perfil image' src='"+@imagen+"' /><span class='hora'>"+@hora+"</span></div>"
	end
end
