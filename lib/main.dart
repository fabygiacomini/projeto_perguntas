import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(
    PerguntaApp()); // passa ao run o componente nó raiz da aplicação, aquele que vai chamar os demais

class _PerguntaAppState extends State<PerguntaApp> {
  // nome do componente com estado que será gerenciada no generics
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    // a parte "List<String>" poderia ser suprimida sem problemas (foi alterado o tipo depois)
    {
      'texto': 'Qual é o melhor game da geração PS4/Xbox One?',
      'respostas': [
        {'texto': 'The Witcher III', 'pontuacao': 10},
        {'texto': 'The Last of Us Part II', 'pontuacao': 8},
        {'texto': 'God of War', 'pontuacao': 5},
        {'texto': 'Horizon Zero Dawn', 'pontuacao': 3},
        {'texto': 'Fifa 20 (rs)', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual a série mais viciante?',
      'respostas': [
        {'texto': 'The Last Kingdom', 'pontuacao': 10},
        {'texto': 'Friends', 'pontuacao': 8},
        {'texto': 'Vikings', 'pontuacao': 5},
        {'texto': 'Coisa Mais Linda', 'pontuacao': 3},
        {'texto': 'HIMYM', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual a banda mais maneira pra escrever na madruga?',
      'respostas': [
        {'texto': 'The Strokes', 'pontuacao': 10},
        {'texto': 'Black Rebel Motorcycle Club', 'pontuacao': 8},
        {'texto': 'The Killers', 'pontuacao': 5},
        {'texto': 'Rise Against', 'pontuacao': 3},
        {'texto': 'The XX', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o melhor estilo musical para se ouvir trabalhando?',
      'respostas': [
        {'texto': 'Game Soundtracks', 'pontuacao': 10},
        {'texto': 'Escandinavas', 'pontuacao': 8},
        {'texto': 'Black Metal', 'pontuacao': 5},
        {'texto': 'Low Fi', 'pontuacao': 3},
        {'texto': 'Sertanojo', 'pontuacao': 1},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for(var textoResp in respostas) { // abordagem imperativa - se não usasse o map
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Perguntas Aleatórias'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    ); // Certos comentarios são add automaticamente e indica o fim do widget usado ->
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
