import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/main.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStyle = const TextStyle(color: Colors.white, fontSize: 15);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            "T I C  T A C   T O E",
            style: GoogleFonts.pressStart2p(textStyle: myTextStyle),
          )),
          const SizedBox(
            height: 40,
          ),
          LottieBuilder.network(
              "https://assets4.lottiefiles.com/packages/lf20_eAqEBOw7m9.json"),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text(
                    "Play Game",
                    style: GoogleFonts.pressStart2p(
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 20)),
                  )),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
