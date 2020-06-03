import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intro_flutter/model/moneda.dart';
import 'package:intro_flutter/widgets/carta.dart';


class Home extends StatelessWidget {
  Future<List<dynamic>> _obtenerMonedas() async {
    final response = await http
        .get('https://api.coinlore.net/api/tickers/?start=100&limit=70');
    final json = jsonDecode(response.body);

    return json['data'].map((item) => Moneda.fromMap(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cripto')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text('Listado de monedas disponibles',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
                future: _obtenerMonedas(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  if(snapshot.hasError)
                    return Center(child: Text('Error buscando'));
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MonedaCard(moneda: snapshot.data[index]),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
