import muros.*
import juego.*


object paloma{
    const posicionX = 1
    var property posicionY =4
    var version = vuelo1
    var property color = "Natural"

    method image() = "paloma"+color+version.version()+ ".png"
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
        keyboard.q().onPressDo({self.color("Azul")})
        keyboard.w().onPressDo({self.color("Verde")})
        keyboard.e().onPressDo({self.color("Rojo")})
        keyboard.r().onPressDo({self.color("Amarillo")})
        keyboard.n().onPressDo({self.color("Natural")})
    }

}

object natural {
  method color() = "Natural"
}

object vuelo1 {
    method version() = "V1"
    method siguiente() = vuelo2
}
object vuelo2 {
    method version() = "V2"
    method siguiente() = vuelo1
}