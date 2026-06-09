class Libro {

  final int idLibro;
  final String titulo;

  Libro({
    required this.idLibro,
    required this.titulo,
  });

  factory Libro.fromJson(
    Map<String, dynamic> json,
  ) {
    return Libro(
      idLibro: json['id_libro'] ?? 0,
      titulo: json['titulo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id_libro': idLibro,
    'titulo': titulo,
  };

  @override
  String toString() => titulo;
}