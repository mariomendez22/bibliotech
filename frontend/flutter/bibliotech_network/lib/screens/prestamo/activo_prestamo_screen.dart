import 'package:bibliotech_network/models/personal_model.dart';
import 'package:bibliotech_network/models/prestamo_model.dart';
import 'package:bibliotech_network/services/prestamo_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class PrestamosActivosPage extends StatefulWidget {
  const PrestamosActivosPage({super.key});

  @override
  State<PrestamosActivosPage> createState() => _PrestamosActivosPageState();
}

class _PrestamosActivosPageState extends State<PrestamosActivosPage> {

  final service = PrestamoService();

  List<Prestamo> prestamos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    cargarPrestamos();
  }

  Future<void> cargarPrestamos() async {
    try {
      prestamos = await service.getPrestamosActivos();
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
  final formatoFecha = DateFormat('dd/MM/yyyy','es_MX',);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Préstamos Activos'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : prestamos.isEmpty
                  ? const Center(
                      child: Text(
                        'No hay préstamos activos',
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: cargarPrestamos,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: prestamos.length,
                        itemBuilder: (context, index) {
          
                          final prestamo = prestamos[index];
          
                          return  Card(
                            elevation: 4,
                            shadowColor: const Color(0xFF0A7BFF).withOpacity(.15),
                            margin: const EdgeInsets.only(bottom: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: const BorderSide(
                                color: Color(0xFFE8F2FF),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
          
                                  Row(
                                    children: [
          
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE8F2FF),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          color: Color(0xFF0A7BFF),
                                        ),
                                      ),
          
                                      const SizedBox(width: 12),
          
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
          
                                            Text(
                                              prestamo.socio,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Color(0xFF071B4A),
                                              ),
                                            ),
          
                                            Text(
                                              'Socio',
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12,
                                              ),
                                            ),
          
                                          ],
                                        ),
                                      ),
          
                                    ],
                                  ),
          
                                  const SizedBox(height: 18),
          
                                  Text(
                                    prestamo.libro,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF071B4A),
                                    ),
                                  ),
          
                                  const SizedBox(height: 12),
          
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F2FF),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      prestamo.codigoBarras,
                                      style: const TextStyle(
                                        color: Color(0xFF0A7BFF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
          
                                  const SizedBox(height: 18),
          
                                  Row(
                                    children: [
          
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE8F2FF),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
          
                                              const Text(
                                                'Fecha entrega',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF0A7BFF),
                                                ),
                                              ),
          
                                              const SizedBox(height: 4),
          
                                              Text(
                                                formatoFecha.format(
                                                  DateTime.parse(
                                                    prestamo.fechaSalida,
                                                  ),
                                                ),
                                                style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Color(0xFF071B4A),
                                                ),
                                              ),
          
                                            ],
                                          ),
                                        ),
                                      ),
          
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFF1E8),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
          
                                              const Text(
                                                'Fecha límite',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFFF6B00),
                                                ),
                                              ),
          
                                              const SizedBox(height: 4),
          
                                              Text(
                                                formatoFecha.format(
                                                  DateTime.parse(
                                                    prestamo.fechaLimite,
                                                  ),
                                                ),
                                                style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Color(0xFF071B4A),
                                                ),
                                              ),
          
                                            ],
                                          ),
                                        ),
                                      ),
          
                                    ],
                                  ),
          
                                  if (prestamo.diasRetraso > 0) ...[
                                    const SizedBox(height: 12),
          
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.red.shade200),
                                      ),
                                      child: Row(
                                        children: [
          
                                          const Icon(
                                            Icons.warning_amber_rounded,
                                            color: Colors.red,
                                          ),
          
                                          const SizedBox(width: 8),
          
                                          Expanded(
                                            child: Text(
                                              'Retraso de ${prestamo.diasRetraso} día(s)',
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
          
                                        ],
                                      ),
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  
                                  Row(
                                    children: [
          
                                      const Icon(
                                        Icons.badge_outlined,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
          
                                      const SizedBox(width: 5),
          
                                      Expanded(
                                        child: Text(
                                          'Registrado por ${prestamo.bibliotecario}',
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
          
                                    ],
                                  ),
          
                                  const SizedBox(height: 16),
          
                                  SizedBox(
                                    width: double.infinity,
                                    height: 45,
                                    child: FilledButton.icon(
                                      style: FilledButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFF6B00),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.assignment_return,
                                      ),
                                      label: const Text(
                                        'Registrar devolución',
                                      ),
                                       onPressed: () async {
                                            final confirmar =
                                                await showDialog<bool>(
                                              context: context,
                                              builder: (context) {
          
                                                return AlertDialog(
                                                  title: const Text(
                                                    'Registrar devolución',
                                                  ),
                                                  content: const Text(
                                                    '¿Desea devolver este ejemplar?',
                                                  ),
                                                  actions: [
          
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                          context,
                                                          false,
                                                        );
                                                      },
                                                      child: const Text(
                                                        'Cancelar',
                                                      ),
                                                    ),
          
                                                    FilledButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                          context,
                                                          true,
                                                        );
                                                      },
                                                      child: const Text(
                                                        'Aceptar',
                                                      ),
                                                    ),
          
                                                  ],
                                                );
          
                                              },
                                            );
          
                                            if (confirmar != true) {
                                              return;
                                            }
          
                                            try {
          
                                              await service.devolverPrestamo(
                                                prestamo.idPrestamo,
                                                Personal().idPersonal,
                                              );
          
                                              await cargarPrestamos();
          
                                              if (!mounted) return;
          
                                              if(context.mounted ){
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Devolución registrada',
                                                  ),
                                                ),
                                              );
                                              }
                                            } catch (e) {
          
                                              if (!mounted) return;
                                              if(context.mounted ){
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    e.toString(),
                                                  ),
                                                ),
                                              );
                                              }
                                            }
          
                                          },
                                    ),
                                  ),
          
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        ),
      ),
    );
  }

}