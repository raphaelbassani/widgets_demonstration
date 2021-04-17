import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_demonstration/notes_bloc.dart';

class ExpandedNotes extends StatefulWidget {
  final int index;

  const ExpandedNotes(this.index);

  @override
  _ExpandedNotesState createState() => _ExpandedNotesState();
}

class _ExpandedNotesState extends State<ExpandedNotes> {
  @override
  Widget build(BuildContext context) {
    final _noteBloc = Provider.of<NotesBloc>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 306,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(.5)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              _noteBloc.notes[widget.index],
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
