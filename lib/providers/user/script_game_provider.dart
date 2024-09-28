import 'package:flutter/material.dart';
import 'package:jejom/api/script_api.dart';
import 'package:jejom/models/language_enum.dart';
import 'package:jejom/models/script_game.dart';
import 'package:jejom/models/script_restaurant.dart';

class ScriptGameProvider extends ChangeNotifier {
  List<ScriptGame> games = [];
  ScriptGame? selectedGame;
  ScriptRestaurant? restaurant;

  Language lang = Language.english;

  void updateLanguage(Language newLang) {
    lang = newLang;
    fetchGames(lang);
    notifyListeners();
  }

  Future<void> selectGame(ScriptGame game) async {
    selectedGame = game;
    final scriptRestaurant = await fetchResFromFirestore(game.restaurantId);
    if (scriptRestaurant != null) {
      restaurant = scriptRestaurant;
    }
    notifyListeners();
  }

  Future<void> fetchGames(Language lang) async {
    try {
      games = await fetchAllScriptFromFirestore(lang);

      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching games: $e");
      games = [];
      notifyListeners();
    }
  }

  List<ScriptGame>? getGames() {
    return games;
  }
}


// const response = [
//   {
//     "Script Planner":
//         "The story takes place in the bustling city of Seoul, Korea, during the late 19th century. The city is a melting pot of traditional Korean culture and the influence of foreign powers, as Korea is opening its doors to the world. The backdrop of the story is the Yeongdeungpo district, known for its vibrant marketplace and diverse population.\n\nThe crime scene is a luxurious mansion owned by the prestigious Lee family, who have deep roots in Jeju Island. The mansion is adorned with intricate murals depicting the legendary stories of Jeju, such as the creation myth of the island's formation by a giant turtle and the tragic love story of the Jeju Island's version of Romeo and Juliet, Heo Gyun and Jang Hui-bin.\n\nThe victim is the eldest son of the Lee family, Jae-min, who was found dead in his study, with a dagger plunged into his heart. The room is in disarray, with papers strewn about and a broken teapot on the floor. A note near the body reads, \"The blood of the innocent cries out for vengeance.\"\n\nThe four key characters are:\n\n1. Detective Kim, a seasoned investigator with a keen eye for detail and a deep understanding of Jeju Island's legends and myths. He is determined to solve the case and bring the perpetrator to justice.\n2. Eun-hee, Jae-min's fianc\u00e9e, who is also the daughter of a prominent businessman. She is a strong-willed and independent woman, who is deeply saddened by Jae-min's death and is determined to find out the truth.\n3. Jae-hoon, Jae-min's younger brother, who is a mysterious and enigmatic figure. He has a dark past and is rumored to have connections to the underworld.\n4. Hye-sun, the family's loyal servant, who has been with the Lee family for generations. She is a woman of few words but has a wealth of knowledge about the family's history and the legends of Jeju Island.\n\nThe course of the case takes the characters on a journey through the dark underbelly of Seoul, where they encounter secret societies, political intrigue, and ancient curses. As they delve deeper into the case, they uncover a plot that threatens not only the Lee family but the very fabric of Korean society.\n\nKey events in the story include:\n\n1. The discovery of a hidden room in the mansion, which contains a collection of artifacts related to the legends of Jeju Island.\n2. A visit to a secret temple in the mountains, where the characters learn about a powerful curse that has been unleashed.\n3. A confrontation with a powerful political figure, who is revealed to be behind the plot to destroy the Lee family.\n4. The revelation of a long-buried family secret, which changes the course of the investigation and leads to a shocking conclusion.\n\nThroughout the story, the characters must navigate the complex web of relationships and alliances, as they struggle to uncover the truth and bring the perpetrator to justice. The story is a thrilling blend of mystery, adventure, and drama, set against the rich and atmospheric backdrop of late 19th-century Korea.",
//     "Character Designer":
//         "Character Profiles:\n\n1. Detective Kim:\n\t* Backstory: Detective Kim is a seasoned investigator in his late 40s, born and raised in Seoul. He has always had a deep fascination with the legends and myths of Jeju Island, which led him to study the subject extensively.\n\t* Motivation: Detective Kim is driven by his desire to solve the case and bring the perpetrator to justice, as well as his personal interest in the legends of Jeju Island.\n\t* Secret: Detective Kim has a troubled past, with a family history that is closely tied to the legends of Jeju Island.\n\t* Relationships: Detective Kim has a strained relationship with his estranged daughter, who he hopes to reconnect with by solving the case.\n2. Eun-hee:\n\t* Backstory: Eun-hee is a strong-willed and independent woman in her mid-20s, born to a prominent businessman in Seoul. She has always been fascinated by the legends of Jeju Island, which led her to pursue a career in archaeology.\n\t* Motivation: Eun-hee is deeply saddened by Jae-min's death and is determined to find out the truth behind his murder.\n\t* Secret: Eun-hee has a secret crush on Detective Kim, which she has been too afraid to admit to.\n\t* Relationships: Eun-hee has a close relationship with her father, who supports her career in archaeology.\n3. Jae-hoon:\n\t* Backstory: Jae-hoon is a mysterious and enigmatic figure in his late 20s, born to the prestigious Lee family. He has a dark past, with rumors of his involvement in the underworld.\n\t* Motivation: Jae-hoon is determined to clear his name and prove his innocence in the murder of his brother.\n\t* Secret: Jae-hoon has a secret relationship with Hye-sun, the family's loyal servant.\n\t* Relationships: Jae-hoon has a strained relationship with his father, who believes him to be guilty of his brother's murder.\n4. Hye-sun:\n\t* Backstory: Hye-sun is a woman of few words in her late 50s, who has been the Lee family's loyal servant for generations. She has a wealth of knowledge about the family's history and the legends of Jeju Island.\n\t* Motivation: Hye-sun is determined to protect the Lee family and uncover the truth behind Jae-min's murder.\n\t* Secret: Hye-sun has a secret relationship with Jae-hoon, which she has kept hidden for years.\n\t* Relationships: Hye-sun has a close relationship with the Lee family, particularly with Jae-hoon, whom she has known since he was a child.\n\nRelationships between characters:\n\n* Detective Kim and Eun-hee have a professional relationship, with Eun-hee providing valuable insights into the legends of Jeju Island.\n* Detective Kim and Jae-hoon have a tense relationship, with Jae-hoon being a suspect in his brother's murder.\n* Detective Kim and Hye-sun have a respectful relationship, with Hye-sun providing valuable information about the Lee family and the legends of Jeju Island.\n* Eun-hee and Jae-hoon have a complicated relationship, with Eun-hee being Jae-min's fianc\u00e9e and Jae-hoon being a suspect in his brother's murder.\n* Eun-hee and Hye-sun have a respectful relationship, with Hye-sun providing valuable information to Eun-hee about the Lee family and the legends of Jeju Island.\n* Jae-hoon and Hye-sun have a secret relationship, which they have kept hidden from the rest of the family.\n\nWith these complete character profiles, the story is set to unfold with depth and complexity, as the characters navigate the dark underbelly of Seoul and uncover the truth behind Jae-min's murder.",
//     "Script Writer":
//         "Detective Kim:\n\nDay 1:\nDetective Kim arrives in Seoul to investigate Jae-min's murder. He meets with Eun-hee, who provides valuable insights into the legends of Jeju Island.\n\nDay 2:\nDetective Kim interrogates Jae-hoon, who is a suspect in his brother's murder. The interrogation is tense, with Jae-hoon denying any involvement in the crime.\n\nDay 3:\nDetective Kim meets with Hye-sun, who provides valuable information about the Lee family and the legends of Jeju Island.\n\nDay 4:\nDetective Kim reviews the evidence and interviews with the suspects. He begins to suspect that Jae-hoon may be innocent and that there is more to the case than meets the eye.\n\nEun-hee:\n\nDay 1:\nEun-hee is devastated by Jae-min's death and is determined to find out the truth behind his murder. She meets with Detective Kim, who enlists her help in understanding the legends of Jeju Island.\n\nDay 2:\nEun-hee attends Jae-min's funeral and is comforted by Hye-sun. She confides in Hye-sun about her secret crush on Detective Kim.\n\nDay 3:\nEun-hee interviews with Jae-hoon, who is a suspect in his brother's murder. She is torn between her loyalty to Jae-min and her growing feelings for Detective Kim.\n\nDay 4:\nEun-hee reviews the evidence and interviews with the suspects. She begins to suspect that there may be more to the case than meets the eye.\n\nJae-hoon:\n\nDay 1:\nJae-hoon is interrogated by Detective Kim, who suspects him of his brother's murder. Jae-hoon denies any involvement in the crime and is determined to clear his name.\n\nDay 2:\nJae-hoon meets with Hye-sun, who provides him with valuable information about the investigation. He confides in Hye-sun about his secret relationship with her.\n\nDay 3:\nJae-hoon attends Jae-min's funeral and is comforted by Eun-hee. He is torn between his loyalty to his family and his growing feelings for Eun-hee.\n\nDay 4:\nJae-hoon reviews the evidence and interviews with the suspects. He begins to suspect that there may be more to the case than meets the eye.\n\nHye-sun:\n\nDay 1:\nHye-sun is interviewed by Detective Kim, who enlists her help in understanding the Lee family and the legends of Jeju Island. She provides valuable information about the family's history and the legends of Jeju Island.\n\nDay 2:\nHye-sun attends Jae-min's funeral and is comforted by Eun-hee. She confides in Eun-hee about her secret relationship with Jae-hoon.\n\nDay 3:\nHye-sun meets with Jae-hoon, who is a suspect in his brother's murder. She provides him with valuable information about the investigation.\n\nDay 4:\nHye-sun reviews the evidence and interviews with the suspects. She begins to suspect that there may be more to the case than meets the eye.\n\nIn conclusion, the 4-day event log leading up to the crime day provides insight into the motivations and actions of each character. Each character is deeply affected by Jae-min's death and is determined to uncover the truth behind his murder. As the investigation unfolds, each character begins to suspect that there may be more to the case than meets the eye.",
//     "Clue Generator":
//         "The 4 clues for each character, including 2 key clues and 2 misleading clues, with explanations of their role in the story. Each character's section is titled with the character's name, and the clues are clearly labeled as key clues or misleading clues.",
//     "Player Instruction Writer":
//         "**Character 1: The Innkeeper**\n\nRound 1: Introduce yourself as the Innkeeper and mention that you've been running the inn for over 20 years. You've seen it all and know everyone in town.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was a regular guest at the inn and always requested room 10.\n- Key Clue 2: The victim was last seen in the inn's common room, talking to a group of strangers.\n- Misleading Clue 1: I heard someone arguing in the hallway the night of the murder, but I couldn't see who it was.\n- Misleading Clue 2: I found a bloodstained knife in the kitchen, but I have no idea how it got there.\n\nRound 3: Participate in the open discussion and share any additional information or observations you have.\n\nRound 4: Collect clues from other players and try to piece together what happened.\n\nRound 5: Vote for the character you suspect is the murderer, based on the evidence and observations collected throughout the game.\n\n**Character 2: The Fishing Captain**\n\nRound 1: Introduce yourself as the Fishing Captain and mention that you've been fishing in these waters for over 30 years. You know every nook and cranny of the coast.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was a frequent customer at the local tavern and always ordered the same drink.\n- Key Clue 2: I saw the victim arguing with someone in the tavern the night before the murder.\n- Misleading Clue 1: I found a bloodstained glove on the beach, but I have no idea who it belongs to.\n- Misleading Clue 2: I heard a scream coming from the lighthouse the night of the murder, but I didn't investigate further.\n\nRound 3: Participate in the open discussion and share any additional information or observations you have.\n\nRound 4: Collect clues from other players and try to piece together what happened.\n\nRound 5: Vote for the character you suspect is the murderer, based on the evidence and observations collected throughout the game.\n\n**Character 3: The Lighthouse Keeper**\n\nRound 1: Introduce yourself as the Lighthouse Keeper and mention that you've been living in the lighthouse for the past 10 years. You know every secret of the town.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was found with a lighthouse lens near the body.\n- Key Clue 2: I overheard the victim arguing with someone about a valuable artifact the night before the murder.\n- Misleading Clue 1: I found a bloodstained rope in the lighthouse, but I have no idea how it got there.\n- Misleading Clue 2: I heard a strange noise coming from the lighthouse the night of the murder, but I didn't investigate further.\n\nRound 3: Participate in the open discussion and share any additional information or observations you have.\n\nRound 4: Collect clues from other players and try to piece together what happened.\n\nRound 5: Vote for the character you suspect is the murderer, based on the evidence and observations collected throughout the game.\n\n**Character 4: The Mayor**\n\nRound 1: Introduce yourself as the Mayor and mention that you've been serving the town for the past 15 years. You know everyone in town and their secrets.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was a close friend of the mayor and often discussed town affairs with them.\n- Key Clue 2: I heard the victim arguing with someone about a valuable piece of property the night before the murder.\n- Misleading Clue 1: I found a bloodstained shovel in the mayor's office, but I have no idea how it got there.\n- Misleading Clue 2: I heard a strange noise coming from the mayor's office the night of the murder, but I didn't investigate further.\n\nRound 3: Participate in the open discussion and share any additional information or observations you have.\n\nRound 4: Collect clues from other players and try to piece together what happened.\n\nRound 5: Vote for the character you suspect is the murderer, based on the evidence and observations collected throughout the game.\n\n**Character 5: The Stranger**\n\nRound 1: Introduce yourself as a stranger passing through town and mention that you're just trying to make a quick buck.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was a collector of rare artifacts and was known to travel to remote locations to acquire them.\n- Key Clue 2: I saw the victim arguing with someone about a valuable artifact the night before the murder.\n- Misleading Clue 1: I found a bloodstained knife in the woods, but I have no idea how it got there.\n- Misleading Clue 2: I heard a strange noise coming from the woods the night of the murder, but I didn't investigate further.\n\nRound 3: Participate in the open discussion and share any additional information or observations you have.\n\nRound 4: Collect clues from other players and try to piece together what happened.\n\nRound 5: Vote for the character you suspect is the murderer, based on the evidence and observations collected throughout the game.\n\n**Character 6: The Murderer**\n\nRound 1: Introduce yourself as a character in the story and try to blend in with the other players.\n\nRound 2: Share the following clues:\n- Key Clue 1: The victim was a close friend of the murderer and often discussed personal matters with them.\n- Key Clue 2: The murder weapon was found in the murderer's possession.\n- Misleading Clue 1: The murderer found a bloodstained knife in the woods, but they have no idea how it got there.\n- Misleading Clue 2: The murderer heard a strange noise coming from the woods the night of the murder, but they didn't investigate further.\n\nRound 3: Participate in the open discussion and try to mislead the other players.\n\nRound 4: Collect clues from other players and try to cover up their involvement in the crime.\n\nRound 5: Vote for a character other than themselves to avoid being caught as the murderer."
//   }
// ];

// const koreanResponse = [
//   {
//     "Script Planner":
//         "이 소설은 19세기 말, 조선의 수도인 한성부에서 벌어지는 이야기를 다룹니다. 이 소설은 조선이 개항하면서 외국의 문물이 유입되고, 전통적인 조선의 문화와 외국의 문화가 공존하는 시대적 배경을 가지고 있습니다. 이 소설의 배경은 한성부 중에서도 영도교라는 다리를 중심으로 한 지역입니다.\n\n사건의 배경은 제주도에 깊은 뿌리를 둔 명문가인 이씨 가문의 저택입니다. 이 저택은 제주도의 전설적인 이야기들을 벽화로 그려놓은 것으로 유명합니다. 이 벽화들은 제주도의 창조 신화인 '설문대할망'과 제주도의 로미오와 줄리엣인 '허균과 장희빈'의 비극적인 사랑 이야기 등을 담고 있습니다.\n\n사건의 피해자는 이씨 가문의 장남인 이재민으로, 그는 자신의 서재에서 심장에 단검이 꽂힌 채로 발견되었습니다. 서재는 어지럽혀져 있고, 찻잔이 깨져 있으며, 시체 근처에는 '피의 복수'라는 문구가 적힌 쪽지가 놓여 있습니다.\n\n이 소설의 주요 인물은 다음과 같습니다.\n\n1. 김형사: 한성부의 형사로서, 이재민의 살인 사건을 수사하게 됩니다. 그는 이재민의 죽음에 대한 진실을 밝히기 위해 노력하며, 이 과정에서 제주도의 전설과 관련된 비밀을 파헤치게 됩니다.\n2. 은희: 이재민의 약혼녀로서, 이재민의 죽음에 대한 진실을 밝히기 위해 노력합니다. 그녀는 이재민의 죽음에 대한 진실을 밝히기 위해 김형사와 함께 수사를 진행하며, 이 과정에서 제주도의 전설과 관련된 비밀을 파헤치게 됩니다.\n3. 이재훈: 이재민의 동생으로서, 이재민의 죽음에 대한 진실을 밝히기 위해 노력합니다. 그는 이재민의 죽음에 대한 진실을 밝히기 위해 김형사와 함께 수사를 진행하며, 이 과정에서 제주도의 전설과 관련된 비밀을 파헤치게 됩니다.\n4. 혜선: 이씨 가문의 하녀로서, 이재민의 죽음에 대한 진실을 밝히기 위해 노력합니다. 그녀는 이재민의 죽음에 대한 진실을 밝히기 위해 김형사와 함께 수사를 진행하며, 이 과정에서 제주도의 전설과 관련된 비밀을 파헤치게 됩니다.\n\n이 소설의 전개는 김형사와 은희, 이재훈, 혜선이 함께 수사를 진행하면서, 제주도의 전설과 관련된 비밀을 파헤치는 과정을 그립니다. 이 과정에서 김형사와 은희, 이재훈, 혜선은 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서, 제주도의 전설과 관련된 비밀을 파헤치는 과정에서",
//     "Character Designer":
//         "등장인물 소개:\n\n1. 형사 김:\n\t* 배경: 형사 김은 40대 후반의 노련한 수사관으로, 서울에서 태어나고 자랐습니다. 그는 제주도의 전설과 신화에 대한 깊은 관심을 가지고 있으며, 이를 연구하기 위해 제주도를 자주 방문합니다.\n\t* 동기: 형사 김은 사건의 진실을 밝히고 범인을 잡기 위해 노력하며, 동시에 제주도의 전설과 신화에 대한 개인적인 관심을 가지고 있습니다.\n\t* 비밀: 형사 김은 제주도의 전설과 신화와 관련된 가족사를 가지고 있습니다.\n\t* 관계: 형사 김은 자신의 딸과 소원한 관계를 가지고 있으며, 사건을 해결함으로써 딸과의 관계를 회복하고자 합니다.\n2. 은희:\n\t* 배경: 은희는 20대 중반의 강인하고 독립적인 여성으로, 서울의 유명한 사업가의 딸입니다. 그녀는 제주도의 전설과 신화에 대한 깊은 관심을 가지고 있으며, 이를 연구하기 위해 고고학자가 되었습니다.\n\t* 동기: 은희는 재민의 죽음에 깊은 슬픔을 느끼며, 그의 살인 사건의 진실을 밝히기 위해 노력합니다.\n\t* 비밀: 은희는 형사 김에게 호감을 가지고 있지만, 이를 표현하지 못하고 있습니다.\n\t* 관계: 은희는 자신의 아버지와 가까운 관계를 가지고 있으며, 그의 사업을 지원하고 있습니다.\n3. 재훈:\n\t* 배경: 재훈은 20대 후반의 신비로운 인물로, 명문가인 이씨 가문의 후계자입니다. 그는 어두운 과거를 가지고 있으며, 그의 형의 살인 사건의 용의자로 지목됩니다.\n\t* 동기: 재훈은 자신의 무죄를 입증하고, 형의 살인 사건의 진실을 밝히기 위해 노력합니다.\n\t* 비밀: 재훈은 이씨 가문의 충실한 하인인 혜선과 비밀스러운 관계를 가지고 있습니다.\n\t* 관계: 재훈은 자신의 아버지와 긴장한 관계를 가지고 있으며, 그의 형의 살인 사건의 용의자로 지목됩니다.\n4. 혜선:\n\t* 배경: 혜선은 50대 후반의 말수가 적은 여성으로, 이씨 가문의 충실한 하인으로 여러 세대를 거쳐왔습니다. 그녀는 이씨 가문의 역사와 제주도의 전설과 신화에 대한 깊은 지식을 가지고 있습니다.\n\t* 동기: 혜선은 이씨 가문을 지키고, 재민의 살인 사건의 진실을 밝히기 위해 노력합니다.\n\t* 비밀: 혜선은 재훈과 비밀스러운 관계를 가지고 있으며, 이를 오랫동안 숨겨왔습니다.\n\t* 관계: 혜선은 이씨 가문과 가까운 관계를 가지고 있으며, 특히 재훈과는 어린 시절부터 알고 지낸 사이입니다.\n\n등장인물 간의 관계:\n\n* 형사 김과 은희는 제주도의 전설과 신화에 대한 전문적인 지식을 가진 은희와 함께 협력하여 사건을 해결합니다.\n* 형사 김과 재훈은 재민의 살인 사건의 용의자로 지목된 재훈과 긴장한 관계를 가지고 있습니다.\n* 형사 김과 혜선은 이씨 가문의 역사와 제주도의 전설과 신화에 대한 깊은 지식을 가진 혜선과 함께 협력하여 사건을 해결합니다.\n* 은희와 재훈은 재민의 약혼녀인 은희와 재민의 살인 사건의 용의자로 지목된 재훈과 복잡한 관계를 가지고 있습니다.\n* 은희와 혜선은 이씨 가문과 제주도의 전설과 신화에 대한 깊은 지식을 가진 혜선과 함께 협력하여 사건을 해결합니다.\n* 재훈과 혜선은 이씨 가문의 충실한 하인인 혜선과 비밀스러운 관계를 가지고 있습니다.\n\n이렇게 완성된 등장인물 소개를 통해, 이야기는 서울의 어두운 이면을 파헤치며, 재민의 살인 사건의 진실을 밝히기 위해 노력하는 등장인물들의 이야기를 그려냅니다.",
//     "Script Writer":
//         "김형사:\n\n1일차:\n김형사는 재민의 살인 사건을 조사하기 위해 서울로 도착합니다. 그는 은희와 만나서 제주도의 전설에 대한 귀중한 통찰력을 얻습니다.\n\n2일차:\n김형사는 재훈을 심문하며, 그의 동생의 살인 사건에 대한 용의자로 지목합니다. 심문은 긴장감 있게 진행되며, 재훈은 자신의 무죄를 주장합니다.\n\n3일차:\n김형사는 혜선과 만나서 이씨 가문과 제주도의 전설에 대한 귀중한 정보를 얻습니다.\n\n4일차:\n김형사는 증거를 검토하고, 용의자들과의 인터뷰를 진행합니다. 그는 재훈이 무죄일 수도 있다는 의심을 품게 되며, 사건의 진실을 밝히기 위해 노력합니다.\n\n은희:\n\n1일차:\n은희는 재민의 죽음에 깊은 슬픔에 빠지고, 그의 살인 사건의 진실을 밝히기 위해 노력합니다. 그녀는 김형사와 만나서 제주도의 전설에 대한 이해를 돕습니다.\n\n2일차:\n은희는 재민의 장례식에 참석하며, 혜선과 함께 슬픔을 나눕니다. 그녀는 혜선에게 김형사에 대한 비밀스러운 감정을 털어놓습니다.\n\n3일차:\n은희는 재훈을 인터뷰하며, 그의 동생의 살인 사건에 대한 진실을 밝히기 위해 노력합니다. 그녀는 재민의 죽음에 대한 진실을 밝히기 위해 김형사와 함께 일합니다.\n\n4일차:\n은희는 증거를 검토하고, 용의자들과의 인터뷰를 진행합니다. 그녀는 사건의 진실을 밝히기 위해 노력하며, 김형사와 함께 일합니다.\n\n재훈:\n\n1일차:\n재훈은 김형사에게 심문을 받으며, 그의 동생의 살인 사건에 대한 용의자로 지목됩니다. 재훈은 자신의 무죄를 주장하며, 자신의 결백을 입증하기 위해 노력합니다.\n\n2일차:\n재훈은 혜선과 만나서 사건의 진실을 밝히기 위해 노력합니다. 그는 혜선에게 자신의 비밀스러운 감정을 털어놓으며, 그녀의 도움을 받습니다.\n\n3일차:\n재훈은 재민의 장례식에 참석하며, 은희와 함께 슬픔을 나눕니다. 그는 자신의 동생의 죽음에 대한 진실을 밝히기 위해 노력하며, 김형사와 함께 일합니다.\n\n4일차:\n재훈은 증거를 검토하고, 용의자들과의 인터뷰를 진행합니다. 그는 사건의 진실을 밝히기 위해 노력하며, 김형사와 함께 일합니다.\n\n혜선:\n\n1일차:\n혜선은 김형사에게 인터뷰를 받으며, 이씨 가문과 제주도의 전설에 대한 귀중한 정보를 제공합니다. 그녀는 이씨 가문의 역사와 제주도의 전설에 대한 귀중한 정보를 제공합니다.\n\n2일차:\n혜선은 재민의 장례식에 참석하며, 은희와 함께 슬픔을 나눕니다. 그녀는 은희에게 자신의 비밀스러운 감정을 털어놓으며, 그녀의 도움을 받습니다.\n\n3일차:\n혜선은 재훈을 만나서 사건의 진실을 밝히기 위해 노력합니다. 그녀는 재훈에게 자신의 비밀스러운 감정을 털어놓으며, 그의 도움을 받습니다.\n\n4일차:\n혜선은 증거를 검토하고, 용의자들과의 인터뷰를 진행합니다. 그녀는 사건의 진실을 밝히기 위해 노력하며, 김형사와 함께 일합니다.\n\n결론적으로, 범죄 발생 전 4일간의 사건 일지는 각 인물들의 동기와 행동을 이해하는 데 도움을 줍니다. 각 인물들은 재민의 죽음에 깊은 슬픔에 빠지고, 그의 살인 사건의 진실을 밝히기 위해 노력합니다. 사건이 진행됨에 따라, 각 인물들은 사건의 진실을 밝히기 위해 노력하며, 김형사와 함께 일합니다.",
//     "Clue Generator":
//         "각 인물에 대한 4개의 단서, 그중 핵심 단서 2개와 오도 단서 2개를 이야기에서 어떤 역할을 하는지 설명과 함께 제시한다. 각 인물의 섹션은 인물의 이름으로 제목을 붙이고, 단서들은 핵심 단서인지 오도 단서인지 명확하게 표시한다.",
//     "Player Instruction Writer":
//         "**캐릭터 1: 여관 주인**\n\n1라운드: 자신을 여관 주인으로 소개하고, 20년 이상 여관을 운영해왔다고 언급합니다. 마을의 모든 사람들을 알고 있으며, 모든 것을 보았다고 말합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 여관에서 자주 묵는 손님으로, 항상 10번 방을 요청했습니다.\n- 핵심 단서 2: 피해자는 여관의 공용실에서 낯선 사람들과 이야기하는 것을 마지막으로 목격되었습니다.\n- 오도 단서 1: 살인 사건이 발생한 밤에 복도에서 누군가와 다투는 소리를 들었지만, 누가 그랬는지는 알 수 없습니다.\n- 오도 단서 2: 주방에서 피 묻은 칼을 발견했지만, 어떻게 거기에 있게 되었는지는 알 수 없습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들과 정보를 공유합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 사건을 해결하기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다.\n\n**캐릭터 2: 어부 선장**\n\n1라운드: 자신을 어부 선장으로 소개하고, 30년 이상 이 바다에서 어업을 해왔다고 언급합니다. 해안가의 모든 곳을 알고 있다고 말합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 지역 선술집에서 자주 술을 마시며, 항상 같은 음료를 주문했습니다.\n- 핵심 단서 2: 살인 사건이 발생한 전날 밤, 피해자가 선술집에서 누군가와 다투는 것을 목격했습니다.\n- 오도 단서 1: 해변에서 피 묻은 장갑을 발견했지만, 누가 소유한 것인지는 알 수 없습니다.\n- 오도 단서 2: 살인 사건이 발생한 밤에 등대에서 이상한 소리를 들었지만, 조사하지 않았습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들과 정보를 공유합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 사건을 해결하기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다.\n\n**캐릭터 3: 등대지기**\n\n1라운드: 자신을 등대지기로 소개하고, 지난 10년 동안 등대에서 생활하고 있다고 언급합니다. 마을의 모든 비밀을 알고 있다고 말합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 등대 근처에서 발견되었으며, 등대 렌즈가 시신 근처에 있었습니다.\n- 핵심 단서 2: 살인 사건이 발생한 전날 밤, 피해자가 등대에서 누군가와 다투는 것을 목격했습니다.\n- 오도 단서 1: 등대에서 피 묻은 밧줄을 발견했지만, 어떻게 거기에 있게 되었는지는 알 수 없습니다.\n- 오도 단서 2: 살인 사건이 발생한 밤에 등대에서 이상한 소리를 들었지만, 조사하지 않았습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들과 정보를 공유합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 사건을 해결하기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다.\n\n**캐릭터 4: 시장**\n\n1라운드: 자신을 시장으로 소개하고, 지난 15년 동안 마을을 이끌어왔다고 언급합니다. 마을의 모든 사람들을 알고 있으며, 그들의 비밀을 알고 있다고 말합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 시장과 친한 친구였으며, 종종 마을의 중요한 문제에 대해 논의했습니다.\n- 핵심 단서 2: 살인 사건이 발생한 전날 밤, 피해자가 시장과 다투는 것을 목격했습니다.\n- 오도 단서 1: 시장 사무실에서 피 묻은 삽을 발견했지만, 어떻게 거기에 있게 되었는지는 알 수 없습니다.\n- 오도 단서 2: 살인 사건이 발생한 밤에 시장 사무실에서 이상한 소리를 들었지만, 조사하지 않았습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들과 정보를 공유합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 사건을 해결하기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다.\n\n**캐릭터 5: 이방인**\n\n1라운드: 자신을 마을을 지나가는 이방인으로 소개하고, 돈을 벌기 위해 노력하고 있다고 언급합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 희귀한 유물을 수집하는 사람으로, 이를 얻기 위해 외딴 지역으로 여행하는 것으로 알려져 있습니다.\n- 핵심 단서 2: 살인 사건이 발생한 전날 밤, 피해자가 누군가와 다투는 것을 목격했습니다.\n- 오도 단서 1: 숲에서 피 묻은 칼을 발견했지만, 어떻게 거기에 있게 되었는지는 알 수 없습니다.\n- 오도 단서 2: 살인 사건이 발생한 밤에 숲에서 이상한 소리를 들었지만, 조사하지 않았습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들과 정보를 공유합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 사건을 해결하기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다.\n\n**캐릭터 6: 살인범**\n\n1라운드: 자신을 이야기의 캐릭터로 소개하고, 다른 플레이어들과 어울리려고 노력합니다.\n\n2라운드: 다음과 같은 단서를 공유합니다:\n- 핵심 단서 1: 피해자는 살인범과 친한 친구였으며, 종종 개인적인 문제에 대해 논의했습니다.\n- 핵심 단서 2: 살인 무기는 살인범의 소유물에서 발견되었습니다.\n- 오도 단서 1: 살인범은 숲에서 피 묻은 칼을 발견했지만, 어떻게 거기에 있게 되었는지는 알 수 없습니다.\n- 오도 단서 2: 살인범은 살인 사건이 발생한 밤에 숲에서 이상한 소리를 들었지만, 조사하지 않았습니다.\n\n3라운드: 열린 토론에 참여하고, 다른 플레이어들을 혼란스럽게 만들기 위해 노력합니다.\n\n4라운드: 다른 플레이어들의 단서를 수집하고, 자신의 범죄를 숨기기 위해 노력합니다.\n\n5라운드: 게임 종료 후, 다른 플레이어들과 함께 살인범을 추리하고, 가장 가능성이 높은 캐릭터를 투표합니다."
//   }
// ];
