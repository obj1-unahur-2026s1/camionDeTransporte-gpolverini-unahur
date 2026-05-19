/*
    Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
*/
object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
}
/*
    Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot.
*/
object bumblebee {
    var modo = auto

    method trasformarEn(nuevoModo) { modo = nuevoModo }

    method peso() = 800
    method nivelDePeligrosidad() = modo.nivelDePeligrosidad()
}

object auto {
    method nivelDePeligrosidad() = 15
}

object robot {
    method nivelDePeligrosidad() = 30
}

/*
    Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
*/
object paqueteDeLadrillos {
    var cantidadDeLadrillos = 50

    method cantidadDeLadrillos(cantidad) { cantidadDeLadrillos = cantidad }
    
    method peso() = 2 * cantidadDeLadrillos
    method nivelDePeligrosidad() = 2
}

/*
    Arena a granel: el peso es variable, la peligrosidad es 1.
*/
object arenaAGranel {
    var property peso = 0
    method nivelDePeligrosidad() = 1
}

/*
    Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
*/
object bateriaAntiarea {
    var estaConMisiles = false

    method cargarMisilies() { estaConMisiles = true }

    method peso() = if (estaConMisiles) { 300 } else { 200 }
    method nivelDePeligrosidad() = if (estaConMisiles) { 100 } else { 0 }
}

/*
    Contenedor portuario: un contenedor puede tener otras cosas adentro. El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
*/
object contenedorPortuario {
    const cosas = []

    method cargar(cosa) { cosas.add(cosa)}
    method descargar(cosa) { cosas.remove(cosa)}
    method vaciar() { cosas.clear() }
    
    method peso() = 100 + cosas.sum({ c => c.peso() })
    method nivelDePeligrosidad() = if (cosas.isEmpty()) { 0 } else { cosas.max({ c => c.nivelDePeligrosidad() }) }
}

/*
    Residuos radioactivos: el peso es variable y su peligrosidad es 200.
*/
object residuosRadioactivos {
    var property peso = 0
    method nivelDePeligrosidad() = 200
}

/*
    Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. El peso es el peso de la cosa que tenga adentro. El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
*/
object embalajeDeSeguridad {
    var cosa = paqueteDeLadrillos

    method embalar(unaCosa) { cosa = unaCosa }

    method peso() = cosa.peso()
    method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() * 0.5
}