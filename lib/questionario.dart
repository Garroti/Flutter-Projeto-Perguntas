import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  @override
  Widget build(BuildContext context) {
    var obj = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    List<Widget> widgets = [];

    if (obj != null) {
      List<Map<String, Object>> respostas = obj as List<Map<String, Object>>;
      widgets = respostas.map((t) {
        return Resposta(t['texto'].toString(),
            () => responder(int.parse(t['pontuacao'].toString())));
      }).toList();
    }

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets
      ],
    );
  }
}
