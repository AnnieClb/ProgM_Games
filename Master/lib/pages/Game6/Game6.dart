import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late List<List<String>> _board;
  late bool _isPlayer1Turn;
  late bool _gameOver;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ''));
    _isPlayer1Turn = true;
    _gameOver = false;
  }

  void _makeMove(int row, int col) {
    if (!_gameOver && _board[row][col] == '') {
      setState(() {
        _board[row][col] = _isPlayer1Turn ? 'X' : 'O';
        _isPlayer1Turn = !_isPlayer1Turn;
        _checkGameStatus();
      });
    }
  }

  void _checkGameStatus() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != '' &&
          _board[i][0] == _board[i][1] &&
          _board[i][1] == _board[i][2]) {
        _endGame();
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] != '' &&
          _board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i]) {
        _endGame();
        return;
      }
    }

    // Check diagonals
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      _endGame();
      return;
    }

    if (_board[2][0] != '' &&
        _board[2][0] == _board[1][1] &&
        _board[1][1] == _board[0][2]) {
      _endGame();
      return;
    }

    // Check for a draw
    bool isBoardFull = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board[i][j] == '') {
          isBoardFull = false;
          break;
        }
      }
    }
    if (isBoardFull) {
      _endGame();
    }
  }

  void _endGame() {
    setState(() {
      _gameOver = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Tic Tac Toe'),
          backgroundColor: Colors.deepPurple,
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCell(0, 0),
          _buildCell(0, 1),
          _buildCell(0, 2),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCell(1, 0),
          _buildCell(1, 1),
          _buildCell(1, 2),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCell(2, 0),
          _buildCell(2, 1),
          _buildCell(2, 2),
        ],
      ),
      SizedBox(height: 20.0),
      _gameOver
          ? Text(
        'Game Over',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      )
          : SizedBox(),
      SizedBox(height: 20.0),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Spécifier le rayon de bordure pour obtenir des bords arrondis
          ),
        ),
        onPressed: _gameOver ? _startNewGame : null,
        child: Text('Start New Game'),
      ),
    ],
    ),
    ),
    );
  }

  Widget _buildCell(int row, int col) {
    return GestureDetector(
      onTap: () => _makeMove(row, col),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            _board[row][col],
            style: TextStyle(fontSize: 48.0),
          ),
        ),
      ),
    );
  }
}
