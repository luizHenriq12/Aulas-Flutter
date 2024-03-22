import 'package:aula_03/bloc/calcular_combustivel_bloc.dart';
import 'package:aula_03/ui/pages/sobre_page.dart';
import 'package:aula_03/ui/widgets/campo_texto.dart';
import 'package:aula_03/ui/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Map> listaMenu;

  void _abrirSobre() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SobrePage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Para deixar privado, é necessário colocar o _ no começo do nome da variável
    final _calcBloc = CalcularCombustivelBloc(context);


    listaMenu = [({"Texto": "Sobre", "Clique": _abrirSobre})];

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
        drawer: MenuLateral(listaItens: listaMenu),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() { _calcBloc.calcular(); });
          },
          child: Icon(Icons.local_gas_station, size: 34,),
          ),

        body: Column(
          children: [
            CampoTexto(_calcBloc.gasolinaController, 'Gasolina', 'R\$'),
            CampoTexto(_calcBloc.etanolController, 'Etanol', 'R\$'),
            ElevatedButton(
                onPressed: () {
                  setState(() { _calcBloc.calcular(); });
                },
                child: const Text('Calcular')),

            Text(_calcBloc.resultado, style: TextStyle(fontSize: 32),)
          ],
        ),
      ),
    );
  }
}
