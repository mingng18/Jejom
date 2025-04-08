class ScriptGame {
  final List<Character> characters;
  final Host host;
  final String characterDesigner;
  final String title;
  final String scriptWriter;
  final String clueGenerator;
  final String duration;
  final String scriptPlanner;
  final String playerInstructionWriter;
  final String restaurantId;

  ScriptGame({
    required this.characters,
    required this.host,
    required this.characterDesigner,
    required this.title,
    required this.scriptWriter,
    required this.clueGenerator,
    required this.duration,
    required this.scriptPlanner,
    required this.playerInstructionWriter,
    required this.restaurantId,
  });

  factory ScriptGame.fromJson(Map<String, dynamic> json) {
    return ScriptGame(
      characters: (json['characters'] as List?)
              ?.map((c) => Character.fromJson(c))
              .toList() ??
          [],
      host: Host.fromJson(json['host'] ?? {}),
      characterDesigner: json['Character Designer'] ?? '',
      title: json['Title'] ?? '',
      scriptWriter: json['Script Writer'] ?? '',
      clueGenerator: json['Clue Generator'] ?? '',
      duration: json['Duration'] ?? '',
      scriptPlanner: json['Script Planner'] ?? '',
      playerInstructionWriter: json['Player Instruction Writer'] ?? '',
      restaurantId: json['restaurant'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characters': characters.map((c) => c.toJson()).toList(),
      'host': host.toJson(),
      'characterDesigner': characterDesigner,
      'title': title,
      'scriptWriter': scriptWriter,
      'clueGenerator': clueGenerator,
      'duration': duration,
      'scriptPlanner': scriptPlanner,
      'playerInstructionWriter': playerInstructionWriter,
      'restaurant': restaurantId,
    };
  }
}

class Character {
  final String name;
  final String act1;
  final String act2;
  final String act3;
  final String act4;

  Character({
    required this.name,
    required this.act1,
    required this.act2,
    required this.act3,
    required this.act4,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? '',
      act1: json['act_1'] ?? '',
      act2: json['act_2'] ?? '',
      act3: json['act_3'] ?? '',
      act4: json['act_4'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'act1': act1,
      'act2': act2,
      'act3': act3,
      'act4': act4,
    };
  }
}

class Host {
  final String hostGuideVoting;
  final String hostGuideCharacterAllocation;
  final String hostGuideIntro;
  final String hostGuideClues;
  final String hostGuideTips;
  final String hostGuideDiscussion;
  final String hostGuideFlow;

  Host({
    required this.hostGuideVoting,
    required this.hostGuideCharacterAllocation,
    required this.hostGuideIntro,
    required this.hostGuideClues,
    required this.hostGuideTips,
    required this.hostGuideDiscussion,
    required this.hostGuideFlow,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      hostGuideVoting: json['host_guide_voting'] ?? '',
      hostGuideCharacterAllocation:
          json['host_guide_character_allocation'] ?? '',
      hostGuideIntro: json['host_guide_intro'] ?? '',
      hostGuideClues: json['host_guide_clues'] ?? '',
      hostGuideTips: json['host_guide_tips'] ?? '',
      hostGuideDiscussion: json['host_guide_discussion'] ?? '',
      hostGuideFlow: json['host_guide_flow'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hostGuideVoting': hostGuideVoting,
      'hostGuideCharacterAllocation': hostGuideCharacterAllocation,
      'hostGuideIntro': hostGuideIntro,
      'hostGuideClues': hostGuideClues,
      'hostGuideTips': hostGuideTips,
      'hostGuideDiscussion': hostGuideDiscussion,
      'hostGuideFlow': hostGuideFlow,
    };
  }
}


// class ScriptGame {
//   final String scriptPlanner;
//   final String characterDesigner;
//   final String scriptWriter;
//   final String clueGenerator;
//   final String playerInstructionWriter;
//   final String title;
//   final String duration;
//   final String restaurantId;
//   final List<String> images;

//   ScriptGame({
//     required this.scriptPlanner,
//     required this.characterDesigner,
//     required this.scriptWriter,
//     required this.clueGenerator,
//     required this.playerInstructionWriter,
//     required this.title,
//     required this.duration,
//     required this.restaurantId,
//     required this.images,
//   });

//   // Factory constructor to create a ScriptGame from JSON
//   factory ScriptGame.fromJson(Map<String, dynamic> json) {
//     return ScriptGame(
//       scriptPlanner: json['Script Planner'],
//       characterDesigner: json['Character Designer'],
//       scriptWriter: json['Script Writer'],
//       clueGenerator: json['Clue Generator'],
//       playerInstructionWriter: json['Player Instruction Writer'],
//       title: json['Title'],
//       duration: json['Duration'],
//       restaurantId: json['restaurant'],
//       images: json['images'] != null
//           ? List<String>.from(json['images'].map((x) => (x)))
//           : [],
//     );
//   }

//   // Method to convert a ScriptGame to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'Script Planner': scriptPlanner,
//       'Character Designer': characterDesigner,
//       'Script Writer': scriptWriter,
//       'Clue Generator': clueGenerator,
//       'Player Instruction Writer': playerInstructionWriter,
//       'restaurant': restaurantId,
//       'Title': title,
//       'Duration': duration,
//       'images': images,
//     };
//   }
// }
