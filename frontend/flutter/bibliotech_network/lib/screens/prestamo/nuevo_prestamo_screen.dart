import 'package:bibliotech_network/models/ejemplar_model.dart';
import 'package:bibliotech_network/models/libro_model.dart';
import 'package:bibliotech_network/models/personal_model.dart';
import 'package:bibliotech_network/models/socio_model.dart';
import 'package:bibliotech_network/services/prestamo_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NuevoPrestamoPage extends StatefulWidget {
  const NuevoPrestamoPage({super.key});

  @override
  State<NuevoPrestamoPage> createState() => _NuevoPrestamoPageState();
}

class _NuevoPrestamoPageState extends State<NuevoPrestamoPage> {

  final _formKey = GlobalKey<FormState>();
  final service = PrestamoService();

  List<Socio> socios = [];
  List<Libro> libros = [];
  List<Ejemplar> ejemplares = [];

  Socio? socioSeleccionado;
  Libro? libroSeleccionado;
  Ejemplar? ejemplarSeleccionado;

  bool loading = true;

  DateTime fechaLimite = DateTime.now().add(
    const Duration(days: 7),
  );

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {

    try {

      socios = await service.getSocios();
      libros = await service.getLibros();

    } catch (e) {

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

    } finally {

      if (mounted) {
        setState(() {
          loading = false;
        });
      }

    }

  }

  Future<void> cargarEjemplares(int idLibro) async {

    try {

      ejemplares = await service.getEjemplares(
        idLibro,
      );

      ejemplarSeleccionado = null;

      setState(() {});

    } catch (e) {

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

    }

  }

  @override
Widget build(BuildContext context) {

  if (loading) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      title: const Text('Nuevo Préstamo'),
      centerTitle: true,
      backgroundColor: const Color(0xFF071B4A),
      foregroundColor: Colors.white,
    ),
    body: Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF071B4A),
              Color(0xFF243D8F),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
      
                        const Icon(
                          Icons.menu_book_rounded,
                          size: 55,
                          color: Color(0xFF0A7BFF),
                        ),
      
                        const SizedBox(height: 10),
      
                        const Text(
                          'Registrar Préstamo',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF071B4A),
                          ),
                        ),
      
                        const SizedBox(height: 25),
      
                        DropdownButtonFormField<Socio>(
                          value: socioSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Socio',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF0A7BFF),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          items: socios.map((socio) {
                            return DropdownMenuItem(
                              value: socio,
                              child: Text(socio.nombre),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              socioSeleccionado = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un socio';
                            }
                            return null;
                          },
                        ),
      
                        const SizedBox(height: 15),
      
                        DropdownButtonFormField<Libro>(
                          value: libroSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Libro',
                            prefixIcon: const Icon(
                              Icons.menu_book,
                              color: Color(0xFF0A7BFF),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          items: libros.map((libro) {
                            return DropdownMenuItem(
                              value: libro,
                              child: Text(libro.titulo),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            if (value == null) return;
      
                            setState(() {
                              libroSeleccionado = value;
                            });
      
                            await cargarEjemplares(value.idLibro);
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un libro';
                            }
                            return null;
                          },
                        ),
      
                        const SizedBox(height: 15),
      
                        DropdownButtonFormField<Ejemplar>(
                          value: ejemplarSeleccionado,
                          decoration: InputDecoration(
                            labelText: 'Ejemplar',
                            prefixIcon: const Icon(
                              Icons.qr_code,
                              color: Color(0xFF0A7BFF),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          items: ejemplares.map((ejemplar) {
                            return DropdownMenuItem(
                              value: ejemplar,
                              child: Text(ejemplar.codigoBarras),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              ejemplarSeleccionado = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Seleccione un ejemplar';
                            }
                            return null;
                          },
                        ),
      
                        const SizedBox(height: 18),
      
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF1E8),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xFFFFD1B3),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(
                              Icons.calendar_month,
                              color: Color(0xFFFF6B00),
                            ),
                            title: const Text(
                              'Fecha límite',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat('dd/MM/yyyy').format(fechaLimite),
                            ),
                            onTap: () async {
      
                              final fecha = await showDatePicker(
                                context: context,
                                initialDate: fechaLimite,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 30),
                                ),
                              );
      
                              if (fecha != null) {
                                setState(() {
                                  fechaLimite = fecha;
                                });
                              }
      
                            },
                          ),
                        ),
      
                        const SizedBox(height: 25),
      
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6B00),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            icon: const Icon(Icons.library_add),
                            label: const Text(
                              'Registrar Préstamo',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: guardarPrestamo,
                          ),
                        ),
      
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


Future<void> guardarPrestamo() async {

  if (!_formKey.currentState!.validate()) {
    return;
  }

  try {

    final response =
        await service.registrarPrestamo(
      idSocio: socioSeleccionado!.idSocio,
      idEjemplar: ejemplarSeleccionado!.idEjemplar,
      idPersonalEntrega: Personal().idPersonal,
      fechaLimite: fechaLimite,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response['message'],
        ),
      ),
    );

    Navigator.pop(context);

  } catch (e) {

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );

  }

  }
}