import muros.*
import juego.*


object paloma{
    const posicionX = 1
    var property posicionY =4
    var version = vuelo1
    var property color = natural

    method image() = "paloma"+color.color()+version.version()+ ".png"
    method cambiarVersion() {
        version = version.siguiente()
    }
    method position() = game.at(posicionX,posicionY)

    method subir() {
        posicionY = 7.min(posicionY+1)
    }
    method bajar() {
        posicionY = 0.max(posicionY-1)
    }
    method teclasMovimiento() {
        keyboard.up().onPressDo({self.subir()})
        keyboard.down().onPressDo({self.bajar()})
    }
    method teclasColor() {
        keyboard.w().onPressDo({self.color(azul)})
        keyboard.a().onPressDo({self.color(verde)})
        keyboard.s().onPressDo({self.color(rojo)})
        keyboard.d().onPressDo({self.color(amarillo)})
        keyboard.n().onPressDo({self.color(natural)})
    }
    method decirPuntos() {
      game.say(self, juego.puntosString())
    }
}

object natural {
  method color() = "Natural"
}

object azul {
  method color() = "Azul"
}
object verde {
  method color() = "Verde"
}
object rojo {
  method color() = "Rojo"
}
object amarillo {
  method color() = "Amarillo"
}


object vuelo1 {
    method version() = "V1"
    method siguiente() = vuelo2
}
object vuelo2 {
    method version() = "V2"
    method siguiente() = vuelo1
}