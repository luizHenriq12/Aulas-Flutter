import 'package:aula_03/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/widgets.dart';

class CalcularCombustivelBloc {
  final BuildContext context;
  var resultado = '';
  final gasolinaController = TextEditingController();
  final etanolController = TextEditingController();

  CalcularCombustivelBloc(this.context);
  // Para deixar privado, é necessário colocar o _ no começo do nome da variável


  void calcular() {
      
    final valorGasolina = double.parse(gasolinaController.text);
    final valorEtanol = double.parse(etanolController.text);
    final mensagem = MensagemAleta();
    //var resultado2 = valorGasolina * 0.7;

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = 'Etanol é melhor';

      mensagem.show(context: context, titulo: 'resultado', texto: 'Etanol é melhor');
    } else {
      resultado = 'Gasolina é melhor';
       mensagem.show(context: context, titulo: 'resultado', texto: 'Gasolina é melhor');
    }

  }
}