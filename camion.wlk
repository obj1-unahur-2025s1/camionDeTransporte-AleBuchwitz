object camion {
    const cargamento = []

    method agregarAlCargamento(unaCosa) {
      cargamento.add(unaCosa)
    }
    method sacarDelCargamento(unaCosa) {
      cargamento.remove(unaCosa)
    }
    method pesoTotalDelCamion() {
      return cargamento.filter({
        c => c.peso()
      }).sum() + 1000
    }
    method saberSiTodosLosPesosDelCargamentoSonPares() {
      return cargamento.all({
        c => c.peso() % 2 == 0
      })
    }
    method consultarSiHayAlgunaCosaDePeso(unPeso) {
      return cargamento.any({
        c => c.peso() == unPeso
      })
    }
    method obtenerPrimerCosaCargadaConPeligro(peligrosidad) {
      return cargamento.findOrElse({
        c => c.peligrosidad() == peligrosidad
      }, {})
    }
    method obtenerTodasLasCosasConPeligrosidad(peligrosidad) {
      return cargamento.filter({
        c => c.peligrosidad() >= peligrosidad
      })
    }
    method listaQueSuperaElNivelDePeligrosidadDeUnaCosa(unaCosa) {
      return cargamento.filter({
        c => c.peligrosidad() >= unaCosa.peligrosidad()
      }).asList()
    }
    method pesoDelCamionExcedido() {
      return self.pesoTotalDelCamion() >= 2500
    }
}