class Prestamo {

  final int idPrestamo;
  final String socio;
  final String libro;
  final String codigoBarras;
  final String fechaSalida;
  final String fechaLimite;
  final String bibliotecario;
  final int diasRetraso;
  final String? fechaDevolucion;
  final String? entregadoPor;
  final String? recibidoPor;

  Prestamo({
    required this.idPrestamo,
    required this.socio,
    required this.libro,
    required this.codigoBarras,
    required this.fechaSalida,
    required this.fechaLimite,
    required this.bibliotecario,
    required this.diasRetraso,
    this.fechaDevolucion,
    this.entregadoPor,
    this.recibidoPor,
  });

  factory Prestamo.fromJson(
    Map<String, dynamic> json,
  ) {
    return Prestamo(
      idPrestamo: json['id_prestamo'],
      socio: json['socio'] ?? '',
      libro: json['libro'] ?? '',
      codigoBarras: json['codigo_barras'] ?? '',
      fechaSalida: json['fecha_salida'] ?? '',
      fechaLimite: json['fecha_limite'] ?? '',
      bibliotecario: json['bibliotecario'] ?? '',
      fechaDevolucion: json['fecha_devolucion_real']?? '',
      entregadoPor: json['entregado_por']?? '',
      recibidoPor: json['recibido_por']?? '',
      diasRetraso: json['dias_retraso'] ?? 0,
    );
  }
}