class Socio {

  final int idSocio;
  final String nombre;

  Socio({
    required this.idSocio,
    required this.nombre,
  });

  factory Socio.fromJson(
    Map<String, dynamic> json,
  ) {
    return Socio(
      idSocio: json['id_socio'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id_socio': idSocio,
    'nombre': nombre,
  };

  @override
  String toString() => nombre;
}