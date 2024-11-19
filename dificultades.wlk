import paloma.*
import muros.*
import juego.*
object facil{
    method hacerMuro() {
        juego.agregarMuro(new Muro(color = natural))
        juego.mostrarMuros()
    }
    method configurarTeclas() {
        paloma.teclasMovimiento()
    }
}
object dificil {
    const colores = [azul,rojo,verde,amarillo]
    method hacerMuro() {
        juego.agregarMuro(new Muro(color = self.colorRandom()))
        juego.mostrarMuros()
    }

    method colorRandom() = colores.anyOne()
    method configurarTeclas() {
        paloma.teclasMovimiento()
        paloma.teclasColor()
  }
}