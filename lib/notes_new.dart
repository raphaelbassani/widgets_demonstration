import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:widgets_demonstration/notes_bloc.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> with SingleTickerProviderStateMixin {
  TextEditingController newNoteController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _noteBloc = Provider.of<NotesBloc>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white.withOpacity(.5),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.2),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: TextField(//TODO Demonstração TextField
                  controller: newNoteController,
                  //focusNode: FocusNode(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  //keyboardType: TextInputType.emailAddress,
                  //textInputAction: TextInputAction.send,
                  //textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor, fontSize: 15),
                  //strutStyle: StrutStyle(fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.center,
                  //textAlignVertical: TextAlignVertical.center,
                  //textDirection: TextDirection.rtl,
                  //readOnly: true,
                  toolbarOptions: ToolbarOptions(copy: true, cut: true,),
                  //showCursor: false,
                  autofocus: true,
                  /*obscuringCharacter: "*",
                  obscureText: true,
                  maxLines: 1,*/
                  /*smartDashesType: SmartDashesType.enabled,
                  smartQuotesType: SmartQuotesType.enabled,*/
                  enableSuggestions: false,
                  maxLines: 15,
                  //minLines: 15,
                  //expands: true,
                  //maxLength: 200,
                  //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  //onChanged: (String entry){},
                  //onEditingComplete: (){},
                  //onAppPrivateCommand: (){},
                  inputFormatters: [
                    //LengthLimitingTextInputFormatter(2),
                    //FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  //enabled: false,
                  /*cursorWidth: 10,
                  cursorHeight: 50,
                  cursorRadius: Radius.circular(100),*/
                  cursorColor: Colors.white,
                  selectionHeightStyle: BoxHeightStyle.max,
                  selectionWidthStyle: BoxWidthStyle.max,
                  keyboardAppearance: Brightness.dark,
                  //scrollPadding: EdgeInsets.zero,
                  //dragStartBehavior: DragStartBehavior.down,
                  //enableInteractiveSelection: false,
                  //selectionControls: TextSelectionControls(),
                  //onTap: (){},
                  //mouseCursor: MouseCursor.defer,
                  //buildCounter: ,
                  //scrollController: ScrollController(),
                  //scrollPhysics: AlwaysScrollableScrollPhysics(),
                  //autofillHints: ,
                  //restorationId: newNoteController.text,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 200, height: 70 ,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(Size.fromHeight(20)),
              ),
              onPressed: () {
                setState(() {
                  //print(newNoteController.text);
                  _noteBloc.writeNote(newNoteController.text);
                  _noteBloc.notesCounter();
                  Navigator.pop(context);
                });
              },
              child: Text("Salvar", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
          ),
        ],
      ),
    );
  }
}