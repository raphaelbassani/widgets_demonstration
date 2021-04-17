import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:widgets_demonstration/demo_page.dart';
import 'package:widgets_demonstration/notes_bloc.dart';
import 'package:widgets_demonstration/notes_builder.dart';
import 'package:widgets_demonstration/notes_new.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Color componentsColor = Colors.white.withOpacity(.5);

  @override
  Widget build(BuildContext context) {
    final _noteBloc = Provider.of<NotesBloc>(context);
    String counterText = "";
    if (_noteBloc.notes.length < 1) {
      counterText = "Crie uma nota ->";
    } else if (_noteBloc.notes.length == 1) {
      counterText = "1 Nota";
    } else {
      counterText = _noteBloc.notes.length.toString() + " Notas";
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 42),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DemoPage(),
                            ));
                          },
                          child: Icon(
                            Icons.help_outline_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 30),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Bloco de Notas",
                            style: TextStyle(
                                fontSize: 40,
                                color: Theme.of(context).primaryColor),
                          )),
                    ),
                    NotesBuilder(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: componentsColor,
                ),
                child: Row(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 40, top: 10),
                          child: Text(
                            counterText,
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColor),
                          ),
                        )),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 40, top: 10),
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(//TODO Demonstração showModalBottomSheet
                              context: context,
                              builder: (context) => Container(
                                height:
                                MediaQuery.of(context).size.height * 0.82,
                                decoration: new BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(25.0),
                                    topRight: const Radius.circular(25.0),
                                  ),
                                ),
                                child: NewNote(),
                              ),
                              backgroundColor: Colors.black,
                              //elevation: 5,
                              //shape: ShapeBorder.lerp(a, b, t),
                              //clipBehavior: Clip.antiAliasWithSaveLayer, Pixelagem das bordas
                              //barrierColor: Colors.orange,
                              isScrollControlled: true,
                              useRootNavigator: true,
                              isDismissible: true,
                              enableDrag: true,
                              //routeSettings: RouteSettings(),
                              //transitionAnimationController:
                            );
                          },
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}