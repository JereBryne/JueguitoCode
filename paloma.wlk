object paloma{
    var property position = game.at(1,game.height())
    var version = vuelo1
    var property color = "Natural"

    method image() = "paloma"+color+version.version()+ ".png"
    method cambiarVersion() {
        version = version.siguiente()
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