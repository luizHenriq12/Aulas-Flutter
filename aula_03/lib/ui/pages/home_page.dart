import 'package:aula_03/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final gasolinaController = TextEditingController();
  final _etanolController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Etanol x Gasolina'),
          backgroundColor: Colors.blueAccent.shade200,
        ),

        body: Column(
          children: [
            
            CampoTexto(gasolinaController, 'Gasolina', 'R\$'),
            CampoTexto(_etanolController, 'Etanol', 'R\$'),

            ElevatedButton(onPressed: calcular, child: Text("Calcular"))
          ],
        ),
      ),
    );
  }

  void calcular() {
    final valorGasolina = double.parse(gasolinaController.text);
    final valorEtanol = double.parse(_etanolController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      //etanol e melhor
    }
    else {
      //gasolina e melhor
    }
  }
}