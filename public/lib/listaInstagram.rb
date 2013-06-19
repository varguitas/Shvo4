# Clase listaInstagram
# Atributos:
#	primerNodo: -> Puntero a el primer nodo de la lista
#	ultimoNodo: -> Puntero a el ultimo nodo de la lista
# CONSTRUCTOR:
#	- autorN:texto
#	- imagen:texto
#	- hora:texto
# METODOS:
#	- obtenerHtml() : Devuelve html correspondiente a todos los nodos
# ---------------------------------------------------------------------------------------
class ListaInstagram
	@primerNodo=nil
	@ultimoNodo=nil
	def initialize
		@primerNodo=nil
		@ultimoNodo=nil
	end
	public
	def insertar(autorN,perImg,com,standard,thumb,link,hora)
		temporal=NodoInstagram.new(nil,@ultimoNodo,autorN,perImg,com,standard,thumb,link,hora)
		if @primerNodo.nil?
			@primerNodo=@ultimoNodo=temporal
		else
			@ultimoNodo.sigNodoCambiar(temporal)
			@ultimoNodo=temporal
		end
	end
	def obtenerHtml
		auxiliar=@primerNodo
		resultadoHtmlInstagram=""
		while not auxiliar.nil?
			resultadoHtmlInstagram=resultadoHtmlInstagram+auxiliar.obtenerHtml
			auxiliar=auxiliar.obtenerSiguiente
		end
		return resultadoHtmlInstagram
	end
end
