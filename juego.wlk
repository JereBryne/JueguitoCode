import paloma.*
import muros.*


object juego {
  const muros = []
  var juegoIniciado = false
  var tiempo = 1000
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
  method facil() {
    game.removeVisual(pantallaPresentacion)
    self.configurarTeclasFacil()
    game.onTick(500,"cambio",{paloma.cambiarVersion()})
    game.addVisual(paloma)
    self.hacerMuro()
    game.onTick(tiempo, "muro", {self.avanzarMuros()})
    game.onTick(tiempo*3, "muro", {self.hacerMuro()})
    game.onCollideDo(self.especialPrimerMuro(), {a=>
        self.sumarPunto()
        game.say(paloma,self.puntosString())})
    
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

  method mostrarMuros() {
    muros.forEach{m=>m.mostrar()} 
  }
  method avanzarMuros() {
    muros.forEach{m=>m.avanzar()} 
  }

  method especialPrimerMuro() = muros.first().nuevoEspecial()

  method sumarPunto() {
    puntos +=1
  }
  method puntosString() = puntos.toString()

  method configurarTeclasFacil() {
    paloma.teclasMovimiento()
    keyboard.z().onPressDo({self.mostrarMuros()})
    keyboard.m().onPressDo({self.hacerMuro()})
    keyboard.a().onPressDo({self.avanzarMuros()})
  }

  method configurarTeclasDificil() {
    paloma.teclasMovimiento()
    paloma.teclasColor()
    keyboard.z().onPressDo({self.mostrarMuros()})
    keyboard.m().onPressDo({self.hacerMuro()})
    keyboard.a().onPressDo({self.avanzarMuros()})
  }
}
object pantallaPresentacion {
  method image() = "presentacion.png"
  method position() = game.at(0,0)
}