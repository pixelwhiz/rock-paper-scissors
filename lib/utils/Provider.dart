import 'dart:math';

class Provider {
  static int gameScore = 0;
  static List<String> choices = ["Rock", "Paper", "Scissors"];
}

class GameChoice {
  String? type = "";
  static var gameRules = {
    "Rock": {
      "Rock": "It's Draw",
      "Paper": "You Lose",
      "Scisors": "You Win",
    },
    "Paper": {
      "Rock": "You Win",
      "Paper": "It's Draw",
      "Scisors": "You Lose",
    },
    "Scisors": {
      "Rock": "You Lose",
      "Paper": "You Win",
      "Scisors": "It's Draw",
    }
  };

  GameChoice(this.type);
}
