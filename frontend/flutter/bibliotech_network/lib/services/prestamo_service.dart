import 'package:bibliotech_network/models/ejemplar_model.dart';
import 'package:bibliotech_network/models/libro_model.dart';
import 'package:bibliotech_network/models/prestamo_model.dart';
import 'package:bibliotech_network/models/socio_model.dart';

import '../config/dio_client.dart';

class PrestamoService {

  Future<List<Socio>> getSocios() async {

    final response = await DioClient.dio.get(
      '/socios',
    );

    return (response.data as List)
        .map((e) => Socio.fromJson(e))
        .toList();
  }

  Future<List<Libro>> getLibros() async {

    final response = await DioClient.dio.get(
      '/libros',
    );

    return (response.data as List)
        .map((e) => Libro.fromJson(e))
        .toList();
  }

  Future<List<Ejemplar>> getEjemplares(
    int idLibro,
  ) async {
    final response = await DioClient.dio.get( '/libros/$idLibro/ejemplares', );
    return (response.data as List)
        .map((e) => Ejemplar.fromJson(e))
        .toList();
  }
Future<List<Prestamo>> getPrestamosActivos() async {

  final response = await DioClient.dio.get(
    '/prestamos/activos',
  );

  return (response.data as List)
      .map((e) => Prestamo.fromJson(e))
      .toList();
}

  Future<Map<String, dynamic>> registrarPrestamo({
    required int idSocio,
    required int idEjemplar,
    required int idPersonalEntrega,
    required DateTime fechaLimite,
  }) async {
    final response = await DioClient.dio.post( '/prestamos',
      data: {
        'id_socio': idSocio,
        'id_ejemplar': idEjemplar,
        'id_personal_entrega': idPersonalEntrega,
        'fecha_limite': fechaLimite.toIso8601String().split('T').first,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> devolverPrestamo( int idPrestamo, int idPersonalRecibe, ) async {

  final response = await DioClient.dio.put(
    '/prestamos/$idPrestamo/devolucion',
    data: {
      'id_personal_recibe':
          idPersonalRecibe,
    },
  );

  

  return response.data;
}
  Future<List<Prestamo>> getHistorico() async {

  final response = await DioClient.dio.get(
    '/prestamos/historico',
  );

  return (response.data as List)
      .map((e) => Prestamo.fromJson(e))
      .toList();
}
}