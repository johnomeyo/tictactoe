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
  void checkWinner(int index) {
    //first row
    if (displayed[0] == displayed[1] &&
        displayed[0] == displayed[2] &&
        displayed[0] != " ") {
      showCustomDialog(context);
    }
    //first column
    else if (displayed[0] == displayed[3] &&
        displayed[0] == displayed[6] &&
        displayed[0] != " ") {
      showCustomDialog(context);
    } else if (displayed[2] == displayed[5] &&
        displayed[2] == displayed[8] &&
        displayed[2] != " ") {
      showCustomDialog(context);
    }
    //second column
    else if (displayed[1] == displayed[4] &&
        displayed[1] == displayed[7] &&
        displayed[1] != " ") {
      showCustomDialog(context);
    }
    //second row
    else if (displayed[3] == displayed[4] &&
        displayed[3] == displayed[5] &&
        displayed[3] != " ") {
      showCustomDialog(context);
    }
    //third row
    else if (displayed[6] == displayed[7] &&
        displayed[6] == displayed[8] &&
        displayed[6] != " ") {
      showCustomDialog(context);
    }
    //the two diagonals
    else if (displayed[0] == displayed[4] &&
        displayed[0] == displayed[8] &&
        displayed[0] != " ") {
      showCustomDialog(context);
    } else if (displayed[2] == displayed[4] &&
        displayed[2] == displayed[6] &&
        displayed[2] != " ") {
      showCustomDialog(context);
    }
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congatulations🎉'),
          content: LottieBuilder.network(
              "https://assets8.lottiefiles.com/packages/lf20_l4xxtfd3.json"),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again',style: TextStyle(color: Colors.black),),
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
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
             Text("Let's play!!!",style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white)),),
              const SizedBox(height: 50,),
            SizedBox(
              height: 500,
              child: GridView.builder(
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
                              displayed[index] = "O";
                            } else if (nextPlayer == false &&
                                displayed[index] == " ") {
                              nextPlayer = !nextPlayer;
                              displayed[index] = "X";
                            }
                            checkWinner(index);
                            // print(nextPlayer);
                            //displayed[index] = index.toString();
                          });
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade800)),
                          child: Center(
                              child: Text(
                            displayed[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
