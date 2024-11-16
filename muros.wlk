import paloma.*


object control {
  const muro = new Muro()
  method prueba() {
    // muro.generarBloques()
    muro.bloques().forEach({b=>game.addVisual(b)})
  }
  method avanzarMuro() {
    muro.avanzar()
  }
}

class Muro{
    const property bloques = [
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoComun(),
      self.nuevoEspecial()
    ]
    const property color = natural
    var posicionX = game.width()-1
    const valoresY = [0,1,2,3,4,5,6,7]

    method nuevoComun() = new Comun(posicionX = posicionX,posicionY = self.valorY())
    method nuevoEspecial() = new Especial(posicionX = posicionX,posicionY = self.valorY())
    

    method valorY() {
        const indiceRandom = valoresY.anyOne()
        const valor = indiceRandom
        valoresY.remove(indiceRandom)
        return valor
    }

    method avanzar() {
      posicionX -= 1
      bloques.forEach({b=>b.cambiarX(posicionX) })
    }
}

class Bloque {
    var property posicionX
    const property posicionY
    method image()
    var property position = game.at(posicionX,posicionY)
    method cambiarX(unValor){
      position = game.at(unValor,posicionY)
    }
}
class Comun inherits Bloque {
    override method image() = "prueba.png"
}
class Especial inherits Bloque {
    override method image() = "prueba1.png"
}