import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionada = 0;
  var _pontucaoTotal = 0;
  final _perguntas = const [
    /* Diz que é uma lista com perguntas | Para colocar outra escrita, só colocar virgula  */
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Vermelho', 'pontuacao': 6},
        {'texto': 'Verde', 'pontuacao': 2},
        {'texto': 'Branco,', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 2},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 6},
        {'texto': 'Leão,', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntasSelecionada++; //Quando clicar nas respostas ele sempre incrementa mais 1, partindo do valor (var)
        _pontucaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntasSelecionada = 0;
      _pontucaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntasSelecionada < _perguntas.length;
  }

  @override /* Decorator */
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /* barra que vai ficar em cima da aplicação */
        appBar: AppBar(
          /* Barra de aplicativo. Pode colocar o que quiser aqui dentro (mas é a barra) */
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntasSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontucaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerguntaAppState();
  }
}
