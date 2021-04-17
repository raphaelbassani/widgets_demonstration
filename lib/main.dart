import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_demonstration/notes_bloc.dart';
import 'package:widgets_demonstration/notes_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesBloc()),
      ],
      child:  WidgetsDemoApp(),
    ),
  );
}

class WidgetsDemoApp extends StatefulWidget {
  @override
  _WidgetsDemoAppState createState() => _WidgetsDemoAppState();
}

class _WidgetsDemoAppState extends State<WidgetsDemoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}