import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/first_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> displayed = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  ];
  bool nextPlayer = false;
  int slotsOccupied = 0;
  String winner = "";
  int exWins = 0;
  int ohWins = 0;
  void checkWinner(int index) {
    //first row
    if (displayed[0] == displayed[1] &&
        displayed[0] == displayed[2] &&
        displayed[0] != " ") {
      winner = displayed[0];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    }
    //first column
    else if (displayed[0] == displayed[3] &&
        displayed[0] == displayed[6] &&
        displayed[0] != " ") {
      winner = displayed[0];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    } else if (displayed[2] == displayed[5] &&
        displayed[2] == displayed[8] &&
        displayed[2] != " ") {
      winner = displayed[2];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    }
    //second column
    else if (displayed[1] == displayed[4] &&
        displayed[1] == displayed[7] &&
        displayed[1] != " ") {
      winner = displayed[1];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    }
    //second row
    else if (displayed[3] == displayed[4] &&
        displayed[3] == displayed[5] &&
        displayed[3] != " ") {
      winner = displayed[3];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    }
    //third row
    else if (displayed[6] == displayed[7] &&
        displayed[6] == displayed[8] &&
        displayed[6] != " ") {
      winner = displayed[6];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    }
    //the two diagonals
    else if (displayed[0] == displayed[4] &&
        displayed[0] == displayed[8] &&
        displayed[0] != " ") {
      winner = displayed[0];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    } else if (displayed[2] == displayed[4] &&
        displayed[2] == displayed[6] &&
        displayed[2] != " ") {
      winner = displayed[2];
      if (winner == "X") {
        exWins++;
      } else if (winner == "O") {
        ohWins++;
      }
      showCustomDialog(context);
    } else if (slotsOccupied == 9) {
      drawDialog(context);
    }
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Congatulations🎉 player: $winner',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade900,
          content: Lottie.network(
              "https://assets4.lottiefiles.com/packages/lf20_xcz6wutt.json"),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play Again',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  void drawDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Oops, thats a draw',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade900,
          content: Lottie.network(
              "https://assets10.lottiefiles.com/private_files/lf30_aiwdh2wk.json"),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play Again',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      setState(() {
        displayed[i] = " ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myTextStyle =  GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, fontSize: 15));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Let's play!!!",
                style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(  
                height: 380,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, int index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (nextPlayer == true && displayed[index] == " ") {
                                nextPlayer = !nextPlayer;
                                slotsOccupied++;
                                displayed[index] = "O";
                              } else if (nextPlayer == false &&
                                  displayed[index] == " ") {
                                nextPlayer = !nextPlayer;
                                slotsOccupied++;
                                displayed[index] = "X";
                              }
                              checkWinner(index);
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400)),
                            child: Center(
                                child: Text(
                              displayed[index],
                              style: TextStyle(
                                  color: displayed[index] == "X"
                                      ? Colors.red
                                      : const Color.fromARGB(255, 30, 9, 224),
                                  fontSize: 45,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
                const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Player X",
                          style: myTextStyle,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          "Score: ${exWins.toString()}",
                          style: myTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Player O",
                          style: myTextStyle,
                        ),
                          const SizedBox(height: 10,),
                        Text(
                          "Score: ${ohWins.toString()}",
                          style: myTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
