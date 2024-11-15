import paloma.*


object control {
  const muro = new Muro()
  method prueba() {
    muro.generarBloques()
    game.addVisual(muro.bloques().get(0))
  }
  method avanzar() {
    muro.avanzar()
  }
}

class Muro{
    const property bloques = []
    const property color = natural
    var posicionX = game.width()-1
    const valoresY = [0,1,2,3,4,5,6,7]

    method nuevoBloque() = new Bloque(posicionX = posicionX,posicionY = self.valorY())
    method nuevoEspecial() = new Especial(posicionX = posicionX,posicionY = self.valorY())
    method generarBloques(){
        bloques.clear()
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))
        bloques.add(bloques.add(self.nuevoBloque()))        
        bloques.add(bloques.add(self.nuevoEspecial()))
    }

    method valorY() {
        const indiceRandom = valoresY.anyOne()
        const valor = indiceRandom
        valoresY.remove(indiceRandom)
        return valor
    }

    method avazar() {
      posicionX -= 1
      bloques.forEach({b=>b.posicionX(posicionX) })
    }
}

class Bloque {
    var property posicionX
    const property posicionY
    method image() = "prueba.png"
    var property position = game.at(posicionX,posicionY)
}
class Comun inherits Bloque {}
class Especial inherits Bloque {
    override method image() = "prueba1.png"
}