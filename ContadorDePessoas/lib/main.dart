import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contator De Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) => {
        setState(() {
          _people += delta;

          if (_people < 0) {
            _infoText = "Mundo invertido?";
          } else if (_people <= 10) {
            _infoText = "Pode entrar!";
          } else {
            _abrirDialog(context);
            _people = 10;
            _infoText = "Lotado!";
          }
        })
      };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "img/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () => {_changePeople(1)},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () => {_changePeople(-1)},
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        ),
      ],
    );
  }
}

// ignore: missing_return
Widget _abrirDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Titulo de dialogo"),
          content: Column(
            children: <Widget>[
              Text("Primeiro texto"),
              Text("Segundo texto"),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                child: Text("Fechar"),
              ),
            ],
          ),
        );
      });
}
