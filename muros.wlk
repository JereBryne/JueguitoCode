import paloma.*
import juego.*

class Muro{
    const property bloques = [
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      nuevoEspecial
    ]
    const property color = natural
    var posicionX = game.width()-1
    const valoresY = [0,1,2,3,4,5,6,7]    
    const property nuevoEspecial = new Especial(posicionX = posicionX,posicionY = self.valorY())
    method nuevoComun() = new Comun(posicionX = posicionX,posicionY = self.valorY())

    method valorY() {
        const indiceRandom = valoresY.anyOne()
        const valor = indiceRandom
        valoresY.remove(indiceRandom)
        return valor
    }
    method posicionX() = posicionX
    method mostrar(){
      bloques.forEach({b=>game.removeVisual(b)})
      bloques.forEach({b=>game.addVisual(b)})
    }

    method avanzar() {
      posicionX -= 1
      bloques.forEach({b=>b.cambiarX(posicionX) })
    }
    method eliminar() {
      bloques.forEach({b=>b.eliminar()})
    }
}
object eliminador {
  var property position = game.at(-2,2)
  method image() = "vidrioAmarillo.png"
}



class Bloque {
    var property posicionX
    const property posicionY
    method image()
    var property position = game.at(posicionX,posicionY)
    method cambiarX(unValor){
      position = game.at(unValor,posicionY)
    }
    method eliminar() {
      game.removeVisual(self)
    }
    method interaccionPaloma()
    method interaccionEliminar() {
      juego.eliminarMuro()
    } 

}
class Comun inherits Bloque {
    override method image() = "paredNatural.png"
    override method interaccionPaloma() {
      juego.perder()
    }
}
class Especial inherits Bloque {
    override method image() = "bloqueVacio.png"
    override method interaccionPaloma() {
      juego.sumarPunto()
      paloma.decirPuntos()
    } 
}


