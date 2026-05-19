object camion {
    const cosas = []
    const tara = 1000
    const pesoMaximoPermitido = 2500

    // Se pide que se le pueda cargar y descargar cosas (de 1 a vez)
    method cargar(cosa) {
        cosas.add(cosa)
        cosa.sufreCambios()
    }
    method descargar(cosa) { cosas.remove(cosa)}
 
    // Cual es el peso total del camión, incluyendo su tara que es de 1000 kg.
    method pesoTotal() = tara + self.todosLosPesosDeLasCosas().sum()

    method todosLosPesosDeLasCosas() = cosas.map({ c => c.peso() })

    // También se necesita conocer si los pesos de todas las cosas cargadas en el camión son números pares.
    method sonParesLosPesosDeLasCosas() = self.todosLosPesosDeLasCosas().all({ peso => peso % 2 == 0 })
    
    // Debemos poder consultar si hay alguna cosa que pesa un determinado valor.
    method hayCosaConPeso(peso) = self.todosLosPesosDeLasCosas().contains(peso)

    // Para un mejor control del tipo de peligro que puede representar la carga, 
    // se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    method primerCosaConNivelPeligrosidad(nivelDePeligrosidad) = cosas.find({ c => c.nivelDePeligrosidad() == nivelDePeligrosidad })

    // Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cosasConNivelDePeligrosidad(nivelDePeligrosidad) = cosas.filter({ c => c.nivelDePeligrosidad() == nivelDePeligrosidad })

    // Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method cosasConNivelDePeligrosidadMayorAlDe(cosa) = cosas.filter({ c => c.nivelDePeligrosidad() > cosa.nivelDePeligrosidad() })

    // Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method estaExcedidoDePeso() = self.pesoTotal() > pesoMaximoPermitido

    // Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y ninguno de los objetos cargados supere un nivel máximo de peligrosidad que depende del viaje, por eso para este caso el valor del nivel se pasará como argumento.
    method puedeCircularEnRuta(nivelDePeligrosidad) = !self.estaExcedidoDePeso() && cosas.all({ c => c.nivelDePeligrosidad() < nivelDePeligrosidad })

    // Saber si el camión tiene alguna cosa que pesa entre un valor mínimo y un valor máximo.
    method hayCosaConPesoEntre(minPeso, maxPeso) = cosas.any({ c => c.peso().between(minPeso, maxPeso)})
    
    // Saber la cosa más pesada que tiene cargada.
    method cosaMasPesada() = cosas.max({ c => c.peso() })

    // La cantidad total de bultos que el camión tiene cargados
    method totalDeBultos() = cosas.sum({ c => c.bultos() })
}