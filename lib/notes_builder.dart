import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_demonstration/notes_compressed.dart';
import 'package:widgets_demonstration/notes_expanded.dart';
import 'notes_bloc.dart';

class NotesBuilder extends StatefulWidget {
  @override
  _NotesBuilderState createState() => _NotesBuilderState();
}

class _NotesBuilderState extends State<NotesBuilder> {
  @override
  Widget build(BuildContext context) {
    final _noteBloc = Provider.of<NotesBloc>(context);
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _noteBloc.notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Dismissible(//TODO Demonstração Dismissible
              key: UniqueKey(),
              child: AnimatedCrossFade(
                crossFadeState: _noteBloc.animate[index]
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 1000),
                sizeCurve: Curves.elasticInOut,
                firstChild: GestureDetector(
                  child: CompressedNotes(index),
                  onTap: () {
                    _noteBloc.animateNote(index);
                  },
                ),
                secondChild: GestureDetector(
                  child: ExpandedNotes(index),
                  onTap: () {
                    _noteBloc.animateNote(index);
                  },
                ),
              ),
              background: Container(
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete_outline,
                        size: 50,
                        color: Colors.white,
                      )),
                ),
              ),
              /*secondaryBackground: Container(
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      )),
                ),
              ),*/
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title:  Text("Confirmar"),
                      content: const Text("Deseja deletar essa nota?"),
                      actions: <Widget>[
                        TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent)
                            ),
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Confirmar",style: TextStyle(color: Colors.white, fontSize: 15),)
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent)
                          ),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancelar",style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),
                      ],
                    );
                  },
                );
              },
              //onResize: ,
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _noteBloc.notes.removeAt(index);
                  _noteBloc.notesCounter();
                });
              },
              direction: DismissDirection.endToStart,
              //resizeDuration: Duration(seconds: 1),
              //dismissThresholds: ,
              movementDuration: Duration(seconds: 1),
              //crossAxisEndOffset: 50,
              //dragStartBehavior: DragStartBehavior.down,b
              //behavior: HitTestBehavior.opaque,
            ),
          );
        });
  }
}
