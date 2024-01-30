import 'dart:math';

import 'package:batukertasgunting/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:batukertasgunting/utils/Provider.dart';
import 'package:batukertasgunting/pages/Game.dart';
import 'package:google_fonts/google_fonts.dart';

class GameResult extends StatefulWidget {
  GameResult(this.gameChoice, { Key? key }) : super(key: key);
  GameChoice gameChoice;
  @override
  _GameResultState createState() => _GameResultState();
}

class _GameResultState extends State<GameResult> {
  String? randomChoice() {
    Random random = new Random();
    int compChoiceIndex = random.nextInt(3);
    return Provider.choices[compChoiceIndex];
  }

  @override
  Widget build(BuildContext context) {
    String? compChoice = randomChoice();
    String? compChoicePath;
    switch (compChoice) {
      case "Rock":
        compChoicePath = "assets/img/rock_btn.png";
        break;
      case "Paper":
        compChoicePath = "assets/img/paper_btn.png";
        break;
      case "Scisors":
        compChoicePath = "assets/img/scisor_btn.png";
        break;
      default:
        compChoicePath = "assets/img/scisor_btn.png";
        break;
    }

    String? player_choice;
    switch (widget.gameChoice.type) {
      case "Rock":
        player_choice = "assets/img/rock_btn.png";
        break;
      case "Paper":
        player_choice = "assets/img/paper_btn.png";
        break;
      case "Scisors":
        player_choice = "assets/img/scisor_btn.png";
        break;
      default:
    }

    if (GameChoice.gameRules[widget.gameChoice.type]![compChoice] == "You Win") {
      setState(() {
        Provider.gameScore++;
      });
    }

    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "20 Muhammad Daffa XII TKJ 1", style:
        GoogleFonts.plusJakartaSans(
          fontSize: 20.0,
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SCORE",
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Provider.gameScore}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: Button(() {}, player_choice!, btnWidth - 20),
                    ),
                    Text(
                      "VS",
                      style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 26.0),
                    ),
                    AnimatedOpacity(
                      opacity: 1,
                      duration: Duration(seconds: 3),
                      child: Button(() {}, compChoicePath!, btnWidth - 20),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "${GameChoice.gameRules[widget.gameChoice.type]![compChoice]}",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Game()));
                },
                padding: EdgeInsets.all(16.0),
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                child: Text(
                  "Play Again",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0
                  ),
                ),),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: (){},
                padding: EdgeInsets.all(16.0),
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                child: Text(
                  "Rules",
                  style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 24.0),
                ),),
            ),
          ],
        ),
      ),
    );
  }
}