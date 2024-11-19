import juego.*
import paloma.*
import muros.*
import dificultades.*

object puntos {
    
    method total() = juego.puntos()
    
}

// class Punto{

//     method image() = valor.toString()+".png"
// }
object textoPuntos {
  method position () = game.at(11,6)
  method image() = "puntos1.png"
  method mostrarPuntos() {
        game.addVisual(self)
    }
}

