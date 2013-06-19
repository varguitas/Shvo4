# Clase listaTwitter
# Atributos:
#	primerNodo: -> Puntero a el primer nodo de la lista
#	ultimoNodo: -> Puntero a el ultimo nodo de la lista
# CONSTRUCTOR:
#	- autorN:texto
#	- autorI:texto
#	- mensaje:texto
#	- hora:texto
# METODOS:
#	- obtenerHtml() : Devuelve html correspondiente a todos los nodos
# ---------------------------------------------------------------------------------------
class ListaTwitter
	@primerNodo=nil
	@ultimoNodo=nil
	def initialize()
		@primerNodo=nil
		@ultimoNodo=nil
	end
	public
	def insertar(autorN,autorI,mensaje,hora)
		temporal=NodoTwitter.new(nil,@ultimoNodo,autorN,autorI,mensaje,hora)
		if @primerNodo.nil?
			@primerNodo=temporal
			@ultimoNodo=temporal
		else
			@ultimoNodo.sigNodoCambiar(temporal)
			@ultimoNodo=temporal
		end
	end
	def obtenerHtml
		auxiliar=@primerNodo
		resultadoHtmlTwitter=""
		while !auxiliar.nil?
			resultadoHtmlTwitter=resultadoHtmlTwitter+auxiliar.obtenerHtml
			auxiliar=auxiliar.obtenerSiguiente
		end
		return resultadoHtmlTwitter
	end
end
