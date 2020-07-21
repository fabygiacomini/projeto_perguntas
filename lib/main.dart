import 'package:flutter/material.dart';

main() => runApp(PerguntaApp()); // passa ao run o componente nó raiz da aplicação, aquele que vai chamar os demais

class _PerguntaAppState extends State<PerguntaApp> { // nome do componente com estado que será gerenciada no generics
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [ // a parte "List<String>" poderia ser suprimida sem problemas
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[_perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder, // sem os parenteses, pois é p passar a função e não invocá-la (referencia)
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
          ],
        ),
      ),
    ); // Certos comentarios são add automaticamente e indica o fim do widget usado ->
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}