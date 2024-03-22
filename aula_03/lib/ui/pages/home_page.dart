import 'package:aula_03/bloc/calcular_combustivel_bloc.dart';
import 'package:aula_03/ui/pages/sobre_page.dart';
import 'package:aula_03/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // Para deixar privado, é necessário colocar o _ no começo do nome da variável
    final _calcBloc = CalcularCombustivelBloc(context);

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
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Column(
                  children: [
                    Icon(Ionicons.car_sport, size: 80, color: Colors.blueAccent.shade700,),
                    Text('Gasolina x Etanol')
              ] 
              )),
              ListTile(title: Text('Sobre'), onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SobrePage()));
              },),
              ListTile(title: Text('Item 2'), onTap: () {},),
              ListTile(title: Text('Item 3'), onTap: () {},),
            ],    //CTRL + D copia e cola texto na linha de baixo
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() { _calcBloc.calcular(); });
          },
          child: Icon(Icons.local_gas_station, size: 34,),),

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
