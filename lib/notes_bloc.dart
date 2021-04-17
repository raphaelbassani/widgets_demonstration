import 'package:flutter/cupertino.dart';

class NotesBloc extends ChangeNotifier {
  List<String> _notes = [
    "Este é o teste inicial das notas",
    "Este é o teste inicial das notas",
    "O Notepad (ou Bloco de notas em português) é um editor de texto simples "
  "que é incluído em todas as versões Microsoft Windows desde a versão 1.0 em "
  "1985.[1] O uso mais comum do Bloco de notas é exibir ou editar arquivos de "
  "texto (.txt), mas muitos usuários o consideram uma ferramenta simples para "
  "criar e editar páginas web e scripts de linguagens de programação. Como o Bloco "
  "de notas oferece suporte apenas a uma formatação muito básica, não é possível "
  "salvar acidentalmente uma formatação especial em documentos que devem permanecer "
  "como texto puro. Isso é especialmente útil ao criar documentos HTML para uma página "
  "da Web, uma vez que os caracteres especiais ou outra formatação não podem "
  "aparecer na página da Web publicada, pois podem causar erros. É possível "
        "salvar os arquivos do Bloco de notas como Unicode, ANSI, UTF-8 ou "
        "Unicode big endian. Esses formatos oferecem maior flexibilidade quando "
        "se trabalha com documentos que utilizam diferentes conjuntos de caracteres."
  ];
  int _counter;
  List<bool> _animate = [false, false,false];

  get notes => _notes;

  get counter => _counter;

  get animate => _animate;

  void writeNote(String note) {
    _notes.add(note);
    _animate.add(false);
    notifyListeners();
  }

  void animateNote(int index) {
    _animate[index] = !_animate[index];
    notifyListeners();
  }

  void notesCounter() {
    _counter = _notes.length;
    notifyListeners();
  }
}
