import paloma.*
import muros.*


object juego {
  const muros = []
  var juegoIniciado = false
  var puntos = 0
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
            self.facil()
            juegoIniciado = true
        }
        })
    keyboard.d().onPressDo({
        if (!juegoIniciado){
            self.dificil()
            juegoIniciado = true
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

  method facil() {
    game.removeVisual(pantallaPresentacion)
    self.configurarTeclasFacil()
    game.onTick(500,"cambio",{paloma.cambiarVersion()})
    game.addVisual(paloma)
    self.hacerMuro()
    game.addVisual(eliminador)
    game.onTick(self.tiempo(), "AvanzarMuros", {self.avanzarMuros()})
    game.onTick(self.tiempo()*3, "HacerMuros", {self.hacerMuro()})
    game.onCollideDo(paloma, {objeto=>objeto.interaccionPaloma()})
    game.whenCollideDo(eliminador, {b=>b.interaccionEliminar()})
  }
  method dificil() {
    game.removeVisual(pantallaPresentacion)
    self.configurarTeclasDificil()
    game.onTick(500,"cambio",{paloma.cambiarVersion()})
    game.addVisual(paloma)
  }
  
  method hacerMuro() {
    muros.add(new Muro())
    self.mostrarMuros()
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
    return 600
  }

  method especialPrimerMuro() = muros.first().nuevoEspecial()

  method sumarPunto() {
    puntos +=1
  }
  method reiniciarPuntos() {
    puntos = 0
  }
  method puntosString() = puntos.toString()

  method configurarTeclasFacil() {
    paloma.teclasMovimiento()
  }

  method configurarTeclasDificil() {
    paloma.teclasMovimiento()
    paloma.teclasColor()
  }
}
object pantallaPresentacion {
  method image() = "presentacion.png"
  method position() = game.at(0,0)
}

object pantallaPerder {
  method image() = "perder.png"
  method position() = game.at(0,0)
}