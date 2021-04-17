import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _crossFadeState = [CrossFadeState.showFirst, CrossFadeState.showFirst];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo Page",
          style: TextStyle(),
        ),
        backgroundColor: Colors.white.withOpacity(.0),
        elevation: 0,
      ),
      backgroundColor: Colors.white.withOpacity(.5),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: AnimatedCrossFade(
                crossFadeState: _crossFadeState[0],
                duration: const Duration(seconds: 2),
                firstChild: TextButton(
                    onPressed: () {
                      setState(() {
                        _crossFadeState[0] = CrossFadeState.showSecond;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/5/51/Logo_Bloco_de_Notas-pt.PNG"),
                    )),
                secondChild: TextButton(
                  onPressed: () {
                    setState(() {
                      _crossFadeState[0] = CrossFadeState.showFirst;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.network(
                        "https://play-lh.googleusercontent.com/imEAd3PykpVSA6bRklnje-aDXeljJKHOJFICdhKJilJlJlWabxqWWtM04hE9Nnh3Bg"),
                  ),
                ),
                layoutBuilder: (Widget topChild, Key topChildKey,
                    Widget bottomChild, Key bottomChildKey) {
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        key: bottomChildKey,
                        left: 100.0,
                        top: 100.0,
                        child: bottomChild,
                      ),
                      Positioned(
                        key: topChildKey,
                        child: topChild,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: AnimatedCrossFade(//TODO Demonstração AnimatedCrossFade
                firstChild: TextButton(
                    onPressed: () {
                      setState(() {
                        _crossFadeState[1] = CrossFadeState.showSecond;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/5/51/Logo_Bloco_de_Notas-pt.PNG"),
                    )),
                secondChild: TextButton(
                  onPressed: () {
                    setState(() {
                      _crossFadeState[1] = CrossFadeState.showFirst;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: Image.network(
                        "https://play-lh.googleusercontent.com/imEAd3PykpVSA6bRklnje-aDXeljJKHOJFICdhKJilJlJlWabxqWWtM04hE9Nnh3Bg"),
                  ),
                ),
                firstCurve: Curves.slowMiddle,
                secondCurve: Curves.easeInOut,
                sizeCurve: Curves.bounceInOut,
                alignment: Alignment.center,
                crossFadeState: _crossFadeState[1],
                duration: const Duration(seconds: 1),
                reverseDuration: const Duration(seconds: 5),
                //layoutBuilder: ,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 100,left: 20, right: 20),
            child: Container(
              height: 100,
              child: TextButton(//TODO Demonstração TextButton
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                  overlayColor: MaterialStateProperty.all(Colors.orange),
                  shadowColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(2),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(0)),
                  fixedSize: MaterialStateProperty.all(Size.fromHeight(0)),
                  maximumSize: MaterialStateProperty.all(Size.fromHeight(36)),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.white, width: 5)),
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.padded,
                  animationDuration: Duration.zero,
                  alignment: Alignment.center,
                  enableFeedback: false,
                ),
                clipBehavior: Clip.none,
                autofocus: true,
                onPressed: () {
                  /*final snackBar = SnackBar(
                    content: Text('Clique no TextButton'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                },
                onLongPress: () {
                  /*final snackBar = SnackBar(
                    content: Text('Clique longo no TextButton'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                },
                focusNode: FocusNode(),
                child: Text(
                  "TextButton",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}