import 'package:bibliotech_network/models/prestamo_model.dart';
import 'package:bibliotech_network/services/prestamo_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HistoricoPrestamosPage extends StatefulWidget {
  const HistoricoPrestamosPage({super.key});

  @override
  State<HistoricoPrestamosPage> createState() => _HistoricoPrestamosPageState();
}

class _HistoricoPrestamosPageState extends State<HistoricoPrestamosPage> {

  final service = PrestamoService();
  final formatoFecha = DateFormat('dd/MM/yyyy');

  List<Prestamo> prestamos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    cargar();
  }

  Future<void> cargar() async {
    prestamos = await service.getHistorico();

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        title: const Text('Histórico'),
        centerTitle: true,
        backgroundColor: const Color(0xFF071B4A),
        foregroundColor: Colors.white,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
              child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: prestamos.length,
                  itemBuilder: (context,index) {
              
                    final prestamo = prestamos[index];
              
                    return _HistorialItem(
                      prestamo: prestamo,
                      formatoFecha: formatoFecha,
                    );
                  },
                ),
            ),
          ),
    );
  }
}

class _HistorialItem extends StatelessWidget {

  final Prestamo prestamo;
  final DateFormat formatoFecha;

  const _HistorialItem({
    required this.prestamo,
    required this.formatoFecha,
  });

  @override
  Widget build(BuildContext context) {

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [

              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Color(0xFF0A7BFF),
                  shape: BoxShape.circle,
                ),
              ),

              Container(
                width: 2,
                height: 140,
                color: Colors.blue.shade100,
              ),

            ],
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Card(
              margin: const EdgeInsets.only(bottom: 20),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                      prestamo.libro,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF071B4A),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(prestamo.socio),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
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

                    const SizedBox(height: 12),

                    Text(
                      'Prestado: ${formatoFecha.format(DateTime.parse(prestamo.fechaSalida))}',
                    ),

                    Text(
                      'Devuelto: ${formatoFecha.format(DateTime.parse(prestamo.fechaDevolucion!))}',
                    ),

                    const SizedBox(height: 10),

                   Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: prestamo.diasRetraso > 0
                            ? Colors.red.shade50
                            : Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        prestamo.diasRetraso > 0
                            ? 'Devuelto con ${prestamo.diasRetraso} días de retraso'
                            : 'Devuelto a tiempo',
                        style: TextStyle(
                          color: prestamo.diasRetraso > 0
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}