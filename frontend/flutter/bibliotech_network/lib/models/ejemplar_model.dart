class Ejemplar {

  final int idEjemplar;
  final String codigoBarras;

  Ejemplar({
    required this.idEjemplar,
    required this.codigoBarras,
  });

  factory Ejemplar.fromJson(
    Map<String, dynamic> json,
  ) {
    return Ejemplar(
      idEjemplar: json['id_ejemplar'] ?? 0,
      codigoBarras: json['codigo_barras'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id_ejemplar': idEjemplar,
    'codigo_barras': codigoBarras,
  };

  @override
  String toString() => codigoBarras;
}