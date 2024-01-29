import 'package:batukertasgunting/pages/GameResult.dart';
import 'package:batukertasgunting/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:batukertasgunting/utils/Provider.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SCORE",
                    style: TextStyle(
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

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 - btnWidth / 2 - 20,
                      child: Hero(
                        tag: "Rock",
                        child: Button(() {
                          print("You choosed Rock!");
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GameResult(GameChoice("Rock")))
                          );
                        }, "assets/img/rock_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                        top: btnWidth,
                        left: MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                        child: Hero(
                            tag: "paper",
                            child: Button(() {
                              print("You choosed Paper!");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GameResult(GameChoice("Paper")))
                              );
                            }, "assets/img/paper_btn.png", btnWidth)
                        ),
                    ),
                    Positioned(
                        top: btnWidth,
                        right: MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                        child: Hero(
                            tag: "scisors",
                            child: Button(() {
                              print("You choosed Scisor!");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GameResult(GameChoice("Scisors")))
                              );
                            }, "assets/img/scisor_btn.png", btnWidth)
                        ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: (){},
                padding: EdgeInsets.all(16.0),
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 5.0),
                ),
                child: Text(
                  "Rules",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
