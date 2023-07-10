import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_tic_tac_toe/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultDeclaration = '';
  int attempts = 0;
  int oScore = 0;
  Timer? timer;
  static const maxSecond = 30;
  int seconds = maxSecond;
  int xScore = 0;
  int filledboxes = 0;
  bool oTurn = true;
  bool winnerFound = false;
  List<int> matchIndexes = [];
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = maxSecond;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Player O',
                            style: custonFontStyle,
                          ),
                          Text(
                            oScore.toString(),
                            style: custonFontStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Player X',
                            style: custonFontStyle,
                          ),
                          Text(
                            xScore.toString(),
                            style: custonFontStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                ))),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5, color: primarycolor),
                              color: matchIndexes.contains(index)
                                  ? blueColor
                                  : mainColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(displayXO[index],
                                style: TextStyle(
                                    fontSize: 64,
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(resultDeclaration, style: custonFontStyle),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTimer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = "O";
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = "X";
        }
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        matchIndexes.addAll([0, 1, 2]);
        startTimer();
        _updateScore(displayXO[0]);
      });
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        matchIndexes.addAll([0, 3, 6]);
        startTimer();
        _updateScore(displayXO[0]);
      });
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        matchIndexes.addAll([0, 4, 8]);
        startTimer();
        _updateScore(displayXO[0]);
      });
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        matchIndexes.addAll([2, 4, 6]);
        startTimer();
        _updateScore(displayXO[2]);
      });
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins!';
        matchIndexes.addAll([1, 4, 7]);
        startTimer();
        _updateScore(displayXO[1]);
      });
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        matchIndexes.addAll([2, 5, 8]);
        startTimer();
        _updateScore(displayXO[2]);
      });
    }
    if (!winnerFound && filledboxes == 9) {
      setState(() {
        resultDeclaration = "NoBody Wins!";
      });
    }
  }

  void _updateScore(String Winner) {
    if (Winner == 'O') {
      oScore++;
    } else if (Winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
    });
    filledboxes = 0;
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSecond,
                  valueColor: AlwaysStoppedAnimation(whiteColor),
                  strokeWidth: 8,
                  backgroundColor: mainColor,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
            onPressed: () {
              startTimer();
              _clearBoard();
              ++attempts;
            },
            child: Text(
              attempts == 0 ? "Start" : "Play Again",
              style: TextStyle(
                  fontSize: 25, color: blackColor, fontWeight: FontWeight.bold),
            ));
  }
}
