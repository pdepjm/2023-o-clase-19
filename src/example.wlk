/*object caps {
	
	var cansancio
	
	//const antiguedad = 8
	method antiguedad() = 8
	
	method cansancio() = cansancio
	
	method puedeJugar() = self.esTitular() && !self.estaTotalmenteCansado()

	method esTitular() = self.antiguedad() > 3
	
	method estaTotalmenteCansado() = cansancio >= 100

	method tomarBebidaEnergizante(){
		cansancio = 0.max(cansancio - 10)
	}
}

object josedeodo {
	
	var cansancio
	
	//const antiguedad = 6
	method antiguedad() = 6
	
	method cansancio() = cansancio
	
	method puedeJugar() = self.esTitular() && !self.estaTotalmenteCansado()

	method esTitular() = self.antiguedad() > 3
	
	method estaTotalmenteCansado() = cansancio >= 100

	method tomarBebidaEnergizante(){
		cansancio = 0.max(cansancio - 10)
	}
}
*/
class Jugador {
	
	var cansancio = 50
	
	const antiguedad = 6
	
	method antiguedad() = antiguedad
	
	method cansancio() = cansancio
	
	method puedeJugar() = self.esTitular() && !self.estaTotalmenteCansado()

	method esTitular() = self.antiguedad() > 3
	
	method estaTotalmenteCansado() = cansancio >= 100

	method tomarBebidaEnergizante(){
		cansancio = 0.max(cansancio - 10)
	}
	
	method jugar(){
		cansancio += 20
	}
	
	method habilidad() = antiguedad * 2 - cansancio
}

const caps = new Jugador(antiguedad = 8)

//WELL KNOWN OBJECT - OBJETOS BIEN CONOCIDOS
object faker {
	var tilteado = false
	var habilidad = 0
	
	method estaTilteado() = tilteado
	
	method tomarTecito(){
		tilteado = false
	}
	
	method puedeJugar() = !tilteado	
	
	method jugar(){
		habilidad += 30
	}
	
	method habilidad() = if(tilteado) 0 else habilidad
}

class Partida {
	
	var azul
	var rojo
	
	method ganador() = [azul, rojo].max({participante => participante.habilidad()})
	
	method comenzar(){
		rojo.jugar()
		azul.jugar()
	}	
	
}

class Equipo{
	const jugadores = []
	
	method contratarJugador(nuevoJugador){
		jugadores.add(nuevoJugador)
	}
	
	method removerJugador(jugador){
		jugadores.remove(jugador)
	}
	
	method jugadoresDisponibles() = jugadores.filter({jugador => jugador.puedeJugar()})

	method jugar(){
		self.jugadoresDisponibles().forEach({jugador => jugador.jugar()})
	}
	
	method habilidad() = jugadores.sum({jugador => jugador.habilidad()})
}
