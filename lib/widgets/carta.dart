import 'package:flutter/material.dart';
import 'package:intro_flutter/model/moneda.dart';



class MonedaCard extends StatelessWidget {
  final Moneda moneda;

  const MonedaCard({Key key, this.moneda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(moneda.simbolo,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 60),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nombre: ${moneda.nombre}'),
                  Text('Precio: ${moneda.precio.toString()}\$')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
