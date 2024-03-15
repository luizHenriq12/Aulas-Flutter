import 'package:flutter/widgets.dart';

class CalcularCombustivelBloc {

  var resultado = '';
  final gasolinaController = TextEditingController();
  final etanolController = TextEditingController();
  // Para deixar privado, é necessário colocar o _ no começo do nome da variável


  void calcular() {

    final valorGasolina = double.parse(gasolinaController.text);
    final valorEtanol = double.parse(etanolController.text);
    //var resultado2 = valorGasolina * 0.7;

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = 'Etanol é melhor';
    } else {
      resultado = 'Gasolina é melhor';
    }

  }
}