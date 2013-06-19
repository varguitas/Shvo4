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
	attr_reader :autorNombre,:perfilImagen,:coment,:imagenPeq,:imagen,:thumbnail,:enlace,:hora,:sigNodo,:antNodo
	def initialize(sig,ant,autorN,perImg,com,standard,thumb,link,hora)
		@autorNombre = autorN.nil? ? "" : autorN
		@perfilImagen = perImg.nil? ? "" : perImg
		@coment = com.nil? ? "No hay comentarios disponibles..." : com
		@imagen = standard.nil? ? "" : standard
		@thumbnail = thumb.nil? ? "" : thumb
		@enlace = link.nil? ? "" : link
		@hora = hora.nil? ? "" :  Time.at(hora.to_i).to_datetime.to_s
		@sigNodo=sig
		@antNodo=ant
	end
	public
	def obtenerHtml
		return "<div class='instaPost'><div class='postDetails'><div class='usrProfile'><div class='usrProfilePhoto'><img width='50px' height='50px' alt='perfil image' src='"+@perfilImagen+"' /></div><div class='usrData'><h1>"+@autorNombre+"</h1></div></div><div class='description'><p>"+@coment+"</p><span class='hora'>"+@hora+"</span></div></div><div class='postImages'><div class='postThumb'><img class='thumb-image-insta' title='Click para expandir la imagen' width='120px' height='120px' alt='Image Thumbnail' src='"+@thumbnail+"' /></div></div><div class='extendido'><div class='extendido-img'><img src='"+@imagen+"' width='auto' height='auto' alt='Extended Image'><div class='link'><img src='/images/atras.png' class='atras' width='32px' height='32px' alt='Atras'><a href='"+@enlace+"'><img src='/images/ir.png' width='32px' height='32px' alt='Ir a Instagram'></a><a href='"+@imagen+"' download='image.jpg' ><img src='/images/descargar.png' width='32px' height='32px' alt='Descargar imagen'></a></div></div></div></div>"
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
end
