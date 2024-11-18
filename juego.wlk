import paloma.*
import muros.*
import dificultades.*


object juego {
  const muros = []
  var juegoIniciado = false
  var puntos = 0
  var dificultad = 0
  method inicio() {
    self.presentacion()
    self.prepararTablero()
  }
  method prepararTablero() {
    game.cellSize(75)
    game.height(8)
    game.width(12)
    game.title("Jueguito")
    game.boardGround("fondo.png")
    muros.clear()
  }
  method presentacion(){
    game.addVisual(pantallaPresentacion)
    keyboard.f().onPressDo({
        if (!juegoIniciado){
            juegoIniciado = true
            dificultad = facil
            self.jugar()
        }
        })
    keyboard.d().onPressDo({
        if (!juegoIniciado){
            juegoIniciado = true
            dificultad = dificil
            self.jugar()
        }
    })
  }
  
  method perder() {
    game.removeVisual(game.allVisuals())
    game.addVisual(pantallaPerder)
    game.removeVisual(paloma)
    game.removeTickEvent("AvanzarMuros")
    game.removeTickEvent("HacerMuros")
  }

  method jugar() {
    self.baseJuego()
    dificultad.hacerMuro()
    game.onTick(self.tiempo(), "AvanzarMuros", {self.avanzarMuros()})
    game.onTick(self.tiempo()*3, "HacerMuros", {dificultad.hacerMuro()})
    game.onCollideDo(paloma, {objeto=>objeto.interaccionPaloma()})
    game.whenCollideDo(eliminador, {b=>b.interaccionEliminar()})
  }
  method dificil() {
    self.baseJuego()
  }

  method baseJuego() {
    game.removeVisual(pantallaPresentacion)
    game.onTick(500,"cambio",{paloma.cambiarVersion()})
    game.addVisual(paloma)
    game.addVisual(eliminador)
    dificultad.configurarTeclas()
  }
  
  method agregarMuro(unMuro) {
    muros.add(unMuro)
  }
  
  method eliminarMuro() {
    const muro = muros.find({f=>f.posicionX()==-2})
    muro.eliminar()
    muros.remove(muro)
  }

  method mostrarMuros() {
    muros.forEach{m=>m.mostrar()} 
  }
  method avanzarMuros() {
    muros.forEach{m=>m.avanzar()} 
  }
  method tiempo() {
    return 1000
  }

  method especialPrimerMuro() = muros.first().nuevoEspecial()

  method sumarPunto() {
    puntos +=1
  }
  method reiniciarPuntos() {
    puntos = 0
  }
  method puntosString() = puntos.toString()

  

  
}
object pantallaPresentacion {
  method image() = "presentacion.png"
  method position() = game.at(0,0)
}

object pantallaPerder {
  method image() = "perder.png"
  method position() = game.at(0,0)
}