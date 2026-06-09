class Personal {
  static final Personal _instance = Personal._internal();
  factory Personal() => _instance;
  Personal._internal();
  int idPersonal = 0;
  String usuario = '';
  String nombre = '';
  String puesto = '';

  void fromJson(Map<String, dynamic> json) {
    idPersonal = json['id_personal'] ?? 0;
    usuario = json['usuario'] ?? '';
    nombre = json['nombre'] ?? '';
    puesto = json['puesto'] ?? '';
  }

  Map<String, dynamic> toJson() => {
    'id_personal': idPersonal,
    'usuario': usuario,
    'nombre': nombre,
    'puesto': puesto,
  };

  void clear() {
    idPersonal = 0;
    usuario = '';
    nombre = '';
    puesto = '';
  }

  bool get isLogged => idPersonal > 0;
}