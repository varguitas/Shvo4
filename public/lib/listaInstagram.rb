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
	attr_writer :primerNodo,:ultimoNodo
	def insertar(autorN,imagen,hora)
		temporal=nodoInstagram.new(nil,@ultimoNodo,autorN,imagen,hora)
		if @primerNodo.nil?
			@primerNodo=@ultimoNodo=temporal
		else
			@ultimoNodo.sigNodo=temporal
			@ultimoNodo=temporal
		end
	end
	def obtenerHtml
		auxiliar=@primerNodo
		resultado=""
		while not auxiliar.nil?
			resultado=resultado+auxiliar.obtenerHtml
			auxiliar=auxiliar.sigNodo
		end
		return resultado
	end
end
