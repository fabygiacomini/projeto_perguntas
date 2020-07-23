import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return 'Precisa melhorar :/';
    } else if (pontuacao < 15) {
      return 'Está no caminho rs';
    } else if (pontuacao < 28) {
      return 'Bons gostos';
    } else if (pontuacao < 38) {
      return 'Impressionante! Tem classe rs';
    } else {
      return 'Nível Jedi de cultura! rs';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // alinhar centro da coluna (altura)
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 23),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
