import 'package:aula_03/bloc/calcular_combustivel_bloc.dart';
import 'package:aula_03/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _calcBloc = CalcularCombustivelBloc();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calculate_outlined, color: Colors.white, size: 36,),
              SizedBox(width: 8,),
              Text('Etanol x Gasolina', style: TextStyle(color: Colors.white),)
            ],
          ),
          backgroundColor: Colors.blueAccent.shade700,
        ),
        floatingActionButton: FloatingActionButton(onPressed: _calcular, child: Icon(Icons.local_gas_station, size: 34,),),
        body: Column(
          children: [
            CampoTexto(_calcBloc.gasolinaController, 'Gasolina', 'R\$'),
            CampoTexto(_calcBloc.etanolController, 'Etanol', 'R\$'),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),

            Text(_calcBloc.resultado, style: TextStyle(fontSize: 32),)
          ],
        ),
      ),
    );
  }

  void _calcular() {
    setState(() {
      _calcBloc.calcular();
    });
  }
}
