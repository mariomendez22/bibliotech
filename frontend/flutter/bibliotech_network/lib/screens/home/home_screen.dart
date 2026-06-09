import 'package:bibliotech_network/models/personal_model.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final menus = [
      {'titulo': 'Nuevo Préstamo', 'icono': Icons.add_card_rounded},
      {'titulo': 'Préstamos Activos', 'icono': Icons.assignment_rounded},
      {'titulo': 'Histórico', 'icono': Icons.history_rounded},
      {'titulo': 'Libros', 'icono': Icons.menu_book_rounded},
      {'titulo': 'Socios', 'icono': Icons.people_alt_rounded},
      {'titulo': 'Autores', 'icono': Icons.edit_note_rounded},
      {'titulo': 'Editoriales', 'icono': Icons.business_rounded},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset('assets/logo.png',height: 50),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Salir'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFFF6B00),
            ),
            onPressed: () {
              Personal().clear();
              Navigator.pushReplacementNamed(context,'/login');
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),

          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF071B4A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
          
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
          
                      const SizedBox(width: 15),
          
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
          
                            const Text(
                              'Bienvenido',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
          
                            Text(
                              Personal().nombre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
          
                            Text(
                              Personal().puesto,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
          
                          ],
                        ),
                      ),
          
                    ],
                  ),
                ),
          
                const SizedBox(height: 25),
          
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Accesos rápidos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF071B4A),
                    ),
                  ),
                ),
          
                const SizedBox(height: 15),
          
                Expanded(
                  child: GridView.builder(
                    itemCount: menus.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.15,
                    ),
                    itemBuilder: (context,index) {
          
                      final item = menus[index];
          
                      return Card(
                        elevation: 3,
                        shadowColor: const Color(0xFF0A7BFF).withOpacity(.10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
          
                            switch (item['titulo']) {
          
                              case 'Nuevo Préstamo':
                                Navigator.pushNamed(context,'/prestamo/nuevo');
                                break;
          
                              case 'Préstamos Activos':
                                Navigator.pushNamed(context,'/prestamo/activos');
                                break;
                              case 'Histórico':
                                Navigator.pushNamed(context,'/prestamo/historico');
                                break;
                              case 'Libros':
                                Navigator.pushNamed(context,'/libros');
                                break;
          
                              case 'Socios':
                                Navigator.pushNamed(context,'/socios');
                                break;
          
                              case 'Autores':
                                Navigator.pushNamed(context,'/autores');
                                break;
          
                              case 'Editoriales':
                                Navigator.pushNamed(context,'/editoriales');
                                break;
          
                            }
          
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
          
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F2FF),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  item['icono'] as IconData,
                                  size: 30,
                                  color: const Color(0xFF0A7BFF),
                                ),
                              ),
          
                              const SizedBox(height: 12),
          
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  item['titulo'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF071B4A),
                                  ),
                                ),
                              ),
          
                            ],
                          ),
                        ),
                      );
          
                    },
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}