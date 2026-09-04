class Faixa {
  final String nome;
  final String frequencia;
  final String categoria;
  final List<SegmentoFaixa> segmentos;

  const Faixa({
    required this.nome,
    required this.frequencia,
    required this.categoria,
    this.segmentos = const [],
  });
}

class SegmentoFaixa {
  final String frequencia;
  final String modos;
  final String classes;
  final String aplicacao;
  final String observacao;

  const SegmentoFaixa({
    required this.frequencia,
    required this.modos,
    required this.classes,
    required this.aplicacao,
    required this.observacao,
  });
}