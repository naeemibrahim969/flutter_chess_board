import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChessBoardController _chessBoardController1 = new ChessBoardController();
  ChessBoardController _chessBoardController2 = new ChessBoardController();
  bool canMove1 = true;
  bool canMove2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChessBoard(
              enableUserMoves: canMove1,
              onMove: (move1, move2) {
                print("move1 $move1 -> $move2");
                _chessBoardController2.makeMove(move1, move2);
                canMove2 = true;
              },
              onCheck: (color) {
                print(color);
              },
              onCheckMate: (color) {
                print(color);
              },
              onDraw: () {},
              size: MediaQuery.of(context).size.width / 2,
              chessBoardController: _chessBoardController1,
            ),

            ChessBoard(
              enableUserMoves: canMove2,
              whiteSideTowardsUser: false,
              onMove: (move1, move2) {
                print("move1 $move1 -> $move2");
                _chessBoardController1.makeMove(move1, move2);
                canMove1 = true;
              },
              onCheck: (color) {
                print(color);
              },
              onCheckMate: (color) {
                print(color);
              },
              onDraw: () {},
              size: MediaQuery.of(context).size.width / 2,
              chessBoardController: _chessBoardController2,
            )
          ],
        ),
      ),
    );
  }
}