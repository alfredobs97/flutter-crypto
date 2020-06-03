import 'dart:convert';

class Moneda {
  final String simbolo;
  final String nombre;
  final double precio;

  Moneda({
    this.simbolo,
    this.nombre,
    this.precio,
  });

  static Moneda fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Moneda(
      simbolo: map['symbol'],
      nombre: map['name'],
      precio: double.parse(map['price_usd']),
    );
  }


  static Moneda fromJson(String source) => fromMap(json.decode(source));
}
