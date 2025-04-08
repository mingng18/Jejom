import 'package:flutter/material.dart';
import 'package:jejom/api/script_api.dart';
import 'package:jejom/modules/user/explore/explore_wrapper.dart';
import 'package:jejom/modules/user/food/ocr.dart';
import 'package:jejom/modules/user/script_game/game_list.dart';
import 'package:jejom/modules/user/travel_prompting/travel_wrapper.dart';
import 'package:jejom/modules/user/trip/trip_details.dart';
import 'package:jejom/modules/user/trip/trip_list.dart';
import 'package:jejom/providers/user/travel_provider.dart';
import 'package:jejom/providers/user/trip_provider.dart';
import 'package:jejom/providers/user/user_provider.dart';
import 'package:jejom/utils/clean_text.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripProvider>(context);
    final travelProvider = Provider.of<TravelProvider>(context);

    final eng_script = {
      "characters": [
        {
          "name": "Ye Ming",
          "act_4":
              "Ye Ming stood under the statue of the Divine Dragon in front of the temple, the moment of judgment finally arrived. His heart was like a turbulent sea, with a myriad of complex emotions swirling within. Ye Ming deeply breathed in the fragrance of incense that permeated the temple, his eyes flashing with conflict and struggle. On one hand, he wanted to uphold the dignity and protection of the Divine Dragon, defending the traditions and beliefs of the Azure Dragon Temple; on the other hand, he was acutely aware of the ancient prophecy he carried, and the heavy secret he learned in Tibet. Sweat soaked Ye Ming's clothes, his hands trembling slightly, as if bearing the weight of the world.\n\nThe voice of the judge echoed through the temple, forcing Ye Ming to make a crucial choice. He could choose to uphold his faith and innocence, continue to defend the Divine Dragon, but this would mean possibly concealing the truth and evading responsibility; or, he could choose to honestly admit everything he knew, including the ancient prophecy, face judgment, but this would mean he would lose everything, including the chance to protect the villagers.\n\nThe inner struggle in Ye Ming's heart reached its peak, he closed his eyes, trying to calm the storm within. Finally, he opened his eyes, gazing at the judge, and walked resolutely towards the truth. He spoke slowly, his voice seeming to be carried away by the wind: \"I choose...\"\n\nAt that moment, Ye Ming's choice would completely alter his destiny. Regardless of which path he ultimately chose, he would confront the depths of his heart, facing scrutiny and making decisions for the past and the future. This was the most difficult moment in his life, as well as the crucial turning point towards redemption and freedom.",
          "act_2":
              "In this scene, Ye Ming feels a looming sense of danger inside the Green Dragon Temple, causing him to feel anxious and uneasy. He begins to doubt whether his previous judgments were correct and if they have a deeper connection to the case. The emergence of new clues makes him realize that he holds crucial information that could reveal the connection between the ancient prophecy in the temple and the case. Ye Ming faces a decision: should he proactively reveal the clues he knows or choose to remain silent to maintain the status quo. During this process, Ye Ming's conflict with Lin Zhengyi intensifies, and the choice between friendship and truth leaves him mentally exhausted. His decision will greatly impact the course of the story – whether to uphold his faith or uncover hidden secrets. Ye Ming's inner struggle and conflicting emotions will be crucial, as whether he exposes his vulnerability or continues to disguise his composed and rational exterior will determine his fate and the development of the case.",
          "act_3":
              "In this scene, Ye Ming faces the gradual unveiling of the truth behind the Qinglong Temple case, as deep-seated fear and guilt well up within him. His emotions reach a climax as anger, regret, and panic intertwine, causing intense fluctuations in his mood. Ye Ming is confronted with a significant psychological dilemma - whether to continue hiding his wrongdoing or bravely expose all truths. In the process of revelation, the conflicts between him, Lin Zhengyi, and Chen Wanru intensify. The transformation of Ye Ming's inner self is crucial - will he repent and make amends, or persist in his delusion? During the crucial confrontation, Ye Ming's emotional turmoil will be fully displayed.\n\nReflecting on the prophecy he learned during his practice in Tibet, Ye Ming realizes its possible connection to the case, and begins to unveil the link between this ancient prophecy and the case. Confronted with the ominous premonitions before the case unfolded, Ye Ming starts to feel anxious, but he still holds onto his faith, praying for the protection of the Divine Dragon. As the truth gradually unfolds, Ye Ming's inner struggles and conflicts will drive him towards facing his mistakes bravely, salvaging his faith, ultimately influencing the course and outcome of the entire case.",
          "act_1":
              "In this ancient temple case, Ye Ming, as a devout Taoist, carries the responsibility of upholding tradition and the protection of the divine dragon. Deep within his heart lies a belief in and fear of the power of the divine dragon. Four days before the case occurred, his state of mind was gradually overshadowed by unease and doubt. Ye Ming felt a sense of impending evil approaching each day, causing internal anxiety, yet he had to maintain a calm and sacred exterior. While interacting with the villagers, he exudes an aura of devoutness and divine protection, but he faintly senses that a storm is coming and begins to pray for the safety of the temple.\n\nYe Ming's key clues are the ancient prophecy he learned during his training in Tibet and the premonition of evil approaching Qinglong Temple. These clues will guide players to delve deeper into the connection between Ye Ming and the case, challenging their reasoning and puzzle-solving abilities.\n\nIn his interactions with Lin Zhengyi and Chen Wanru, Ye Ming will demonstrate his appreciation for friendship and trust, while also facing conflicts and confrontations with them. His decisions and actions will directly influence the course of the entire case, while also revealing his inner secrets and true motives.\n\nBy embodying Ye Ming in the five rounds of discussions, players will experience his internal conflicts and struggles, as well as his steadfast commitment to the protection of the divine dragon and traditional beliefs. Ye Ming's character will inject more drama and tension into the entire story, guiding players to explore the deeper secrets and mysteries behind the temple case. Wishing the game success, and hoping that players can fully immerse themselves in this immersive script kill, uncovering the truth behind the Qinglong Temple case together!"
        },
        {
          "name": "Chen Wanru",
          "act_1":
              "In the early morning, Ye Ming bathed in the sunlight at the Qinglong Temple, feeling the blessing of the divine dragon. In his heart, he thought about how the temple had been thriving with incense burning and strong local faith recently, but he also faintly sensed an impending storm. He planned to strengthen his connection with the divine dragon during this time to protect the safety of the villagers. The next day, Ye Ming heard about Lin Zhengyi's frequent visits to the temple recently and felt a hint of confusion in his heart, but he did not delve deeper. As he interacted with the villagers about their faith, he felt their sincere devotion to the divine dragon's blessings, which reaffirmed his own mission. On the third day, a mysterious man came to the front of the temple requesting to see Ye Ming, claiming to have important information about the Qinglong Temple. Ye Ming's heart was in turmoil, but he remained calm and tried to understand the man's true intentions. He decided to observe the man discreetly to prevent any danger to the temple. On the fourth day, Ye Ming was suddenly awakened at night by an ominous premonition, feeling a sinister presence approaching the Qinglong Temple. Anxious and uneasy, he began to pray for the divine dragon's protection, preparing to face the upcoming challenge. In summary, as the caretaker of the Qinglong Temple, Ye Ming bears the responsibility of upholding tradition and culture. Deep within his heart, he harbors both faith and fear of the power of the divine dragon. In the four days leading up to the incident, his heart was gradually shrouded in uneasiness and doubt, yet he continued to strive for the safety of the temple and the divine dragon's protection.",
          "act_3":
              "In this scene, Chen Wanru faces the pressure and challenges of the truth behind the case gradually coming to light. Inside the Qinglong Temple, she examines the body of the murdered man, feeling a surge of complex emotions: anger, regret, fear, and various emotions intertwining within her. She knows that revealing the truth may involve more conflicts and secrets, but she firmly believes in the importance of justice and fairness.\n\nAs the investigation deepens, Chen Wanru uncovers some key clues that reveal a mysterious connection between the murdered man and the dragon statue inside the temple. These discoveries make her realize that the case is far more complicated than it seems on the surface, and every corner of the temple seems to hide unknown secrets. At this moment, she faces a major psychological dilemma: whether to continue pursuing the truth or choose to conceal what she knows to maintain the safety of the temple and the villagers.\n\nIn the confrontation with Ye Ming and Lin Zhengyi, Chen Wanru's emotions reach a climax. She realizes that everyone carries a heavy burden of the past and responsibilities, and this case will completely change the fate of each person involved. Confronted with the secrets and mysteries within the temple, Chen Wanru ultimately makes a brave decision—she chooses to expose all truths, regardless of the consequences.\n\nThis scene reveals Chen Wanru's inner struggle and growth. By facing her fears and hesitations, she ultimately chooses justice and truth. Her decision not only influences the direction of the case but also allows each character to find a new way out in this complex puzzle. The Qinglong Temple case will take an unexpected turn due to Chen Wanru's courage and persistence, making the story even more gripping.",
          "act_2":
              "Through the five-day inner journey of Ye Ming, Lin Zhenyi, and Chen Wanru in the case of the Blue Dragon Temple, players will witness the emotional fluctuations, inner struggles, and decision-making processes of each character when faced with challenges. Ye Ming, as a devout believer, is guided by his inner faith and fear, leading him to a state of firmness and anxiety under the protection of the divine dragon. Lin Zhenyi, as a scholar who values traditional culture and friendship, is caught in a dilemma due to his conflicting inner desires and curiosity. Chen Wanru, as a young detective pursuing justice, is driven by her inner desire for the truth and the struggle with her past experiences to bravely face the complexity of the case.\n\nIn this case full of mysteries and crises, the emotional fluctuations and decisions of each character will gradually be revealed in five rounds of discussions, driving the plot towards its climax. They will face choices to uncover hidden secrets or to remain silent, while intense conflicts and cooperation will arise among the characters. Players will feel the tension and driving force of the plot in the characters' psychological changes and decisions, ultimately witnessing how their choices influence the direction of the entire story. Best wishes for a smooth game and an exciting storyline!",
          "act_4":
              "At the crucial moment of the trial, Chen Wanru stood in the courtroom, facing the scrutiny and questioning of everyone. Her heart was in turmoil, recalling the various experiences and discoveries during the investigation of the case, her thoughts in chaos. On one hand, she yearned to uncover the truth, to bring justice to the victims, and to reveal the secrets within the temple. On the other hand, the secrets in her heart and the connections to the case made her hesitant, fearing that her past would be exposed.\n\nWith a determined yet bewildered look in her eyes, Chen Wanru eventually made a decision—under the judge's questioning, she chose to confess the special bond she had with the male victim, revealing the secrets buried deep within her heart. She accepted her past, acknowledged its complexity, and let go of the burden in her heart. This decision brought her a sense of inexplicable liberation and relief, as well as the courage and determination to face the future.\n\nAs the trial came to a close, tears glistened in Chen Wanru's eyes, but they were tears of acceptance and consolation. She might face punishment, but she chose to confront her past, to accept the shadows within herself. This courage and honesty brought her inner redemption. As the bell of judgment rang, Chen Wanru turned and left the courtroom, a smile on her face, ready to embrace a new beginning and future."
        },
        {
          "name": "Lin Zhengyi",
          "act_1":
              "In the case of the Green Dragon Temple, Ye Ming, as a devout host, harbors a belief in and fear of the power of the divine dragon deep in his heart. In the four days leading up to the case, his heart was gradually shrouded in unrest and doubt, while he also struggled to ensure the safety of the temple and the protection of the divine dragon. At the same time, Lin Zhengyi, a renowned archaeologist, was drawn into the vortex of the case due to his reverence for ancient artifacts and traditions. In the four days before the incident, his heart underwent a struggle between tradition and friendship, while also facing the dilemma of concealment and disclosure. As a young female detective, Chen Wanru's passion for the case and sense of justice drive her to continuously pursue the truth. In the four days leading up to the case, her heart experienced an understanding of the complexity of the case and worries about the secrets within the temple, while also facing the shadows and challenges of her past experiences. The inner journeys of these three characters will intertwine in the case of the Green Dragon Temple, uncovering a deep mystery related to myths, legends, and culture, adding more drama and tension to the entire story. I wish the game a smooth progress, allowing each player to deeply experience the emotional fluctuations and complex relationships of the characters.",
          "act_3":
              "In this scene, Lin Zhengyi finally faces the truth of the case, deeply trapped in fear and guilt within himself. In a corner of the temple, he discovers a special record about the statue of the Divine Dragon, revealing important clues related to the case. Lin Zhengyi is filled with conflicting emotions: on one hand, his reverence and protection of ancient artifacts, and on the other, his loyalty to Ye Ming and the temple. As his emotions reach their peak, anger, regret, and panic intertwine within him.\n\nFaced with a significant psychological dilemma, Lin Zhengyi must decide whether to continue concealing this crucial information or bravely expose everything. This choice will directly impact the development of the case and his relationship with Ye Ming. Lin Zhengyi begins to realize that the information he holds might change everything, but it also means betraying his friend and faith. In this internal struggle, Lin Zhengyi's transformation becomes a crucial turning point in the entire story.\n\nAs Lin Zhengyi's emotional turmoil reaches its peak, he decides to step forward and reveal the truth. A fierce confrontation ensues between him and Ye Ming as the two former friends experience a serious divergence between morality and self-interest. In this moment, Lin Zhengyi's regret and courage intertwine as he chooses to confront his own mistakes and honestly disclose long-hidden secrets. This decision not only changes the course of the case but also brings a sense of relief to Lin Zhengyi's heart. Despite facing unknown consequences, he bravely chooses to confront them.",
          "act_2":
              "In this scene, Lin Zhengyi began to feel the increasing internal conflict and struggle within himself. Faced with the complexity of the case and the emergence of new clues, he started to realize that the ancient records he knew about the Dragon Temple could be a crucial lead. However, after Lin Zhengyi obtained this information, he became deeply conflicted internally about whether he should reveal this secret and expose the hidden truth within the temple. He started to doubt his choices and also questioned whether Ye Ming was aware of the situation. This internal turmoil and struggle gradually led to conflicts between him and Ye Ming, making the choice between friendship and truth increasingly difficult. Lin Zhengyi suffered psychological torment, and his decision would determine the unfolding of the entire story - whether to maintain the status quo and keep the secret or to unveil the hidden truth in pursuit of the real story. Lin Zhengyi's internal changes and decisions will greatly influence the climax and direction of the plot.",
          "act_4":
              "In the final trial of the Qinglong Temple case, Lin Zhengyi stood in front of the judgment seat, facing the scrutiny of the crowd and the crucial choice in the case. His heart was turbulent like a storm, torn between his appreciation for traditional culture, loyalty to his friend Ye Ming, and the ancient documents he had discovered about the statue of the divine dragon. These conflicting emotions intertwined, leaving him in an inexplicable struggle.\n\nLin Zhengyi's eyes flickered with hesitation and confusion. He knew he held the key information that could change everything, but he also realized that revealing the truth might ruin his friendship with Ye Ming and shake the foundation of Qinglong Temple's belief. Under the questioning of the judge, Lin Zhengyi's voice trembled slightly, \"I... I have found some special records about the divine dragon statue, which may unlock the mystery of the case.\"\n\nHis words caused a commotion. The courtroom suddenly fell silent, with everyone's gaze fixed on him. Lin Zhengyi's heart felt like it was burning in flames at that moment. He knew his choice would change everything. Would he choose to conceal the truth to preserve the purity of ancient culture, or reveal the truth and face the test of friendship and responsibility?\n\nFinally, in a solemn atmosphere, Lin Zhengyi struggled to make a decision, \"I choose... to reveal everything.\" This sentence seemed to detonate like a thunderclap in the courtroom, moving everyone with his courage and honesty. Determination shone in Lin Zhengyi's eyes. He knew this choice might change everything, but he was willing to bear all consequences for justice and truth.\n\nAt that moment, Lin Zhengyi's heart was liberated. He felt a sense of inexplicable relief and liberation. Regardless of the final outcome, he chose to bravely confront his past and present, to pursue the justice and honesty of his heart, as well as the eternal continuation of friendship and traditional culture. In the end of this trial, Lin Zhengyi showed his sincerity and courage, leaving an unforgettable mark on the whole Qinglong Temple case."
        }
      ],
      "host": {
        "host_guide_voting":
            "Voting Stage Guidelines:\n\n1. Voting Rules Explanation:\nIn the case of the Green Dragon Temple, players will vote for the character they believe is the real culprit after the final round of discussion. Each player must privately choose their voting target and simultaneously reveal the voting results with the guidance of the host.\n\n2. How to Guide Players in Making Choices:\nThe host can remind players before the vote to review the motives, secrets, and behaviors of each character throughout the case to help them make a more informed choice. Players should consider the relationships between characters, gather clues, and evaluate the characters' behaviors to make a comprehensive judgment.\n\n3. Trigger Conditions for Different Endings:\n- If the majority of players vote for the correct killer, the truth will be revealed, the case will be solved, and the Green Dragon Temple will be restored to peace.\n- If the voting results show a division, it may lead to an incorrect ending, and the host needs to provide an appropriate explanation based on the voting outcome.\n- If players fail to select the correct killer, it may result in the case remaining unsolved, creating suspense, or leading to alternative developments.\n\n4. Dramatic Presentation of the Revelation of Endings:\nDuring the announcement of the voting results, the host can enhance the atmosphere through dramatic descriptions and interactions between characters. The identity of the real culprit should be revealed based on the voting results, showcasing the reactions of other characters and creating a tense and thrilling atmosphere. Subsequently, the final outcome of the case and the fates of each character can be presented, concluding the game on a satisfying note.\n\nIt is hoped that the above voting and ending explanations can help the host smoothly guide the game and present players with a gripping conclusion. Wishing for a successful game for all players to enjoy this murder mystery game!",
        "host_guide_character_allocation":
            "Ye Ming:\nYe Ming is a devout Taoist, born into an ancient Taoist family. Before presiding over the Qinglong Temple, he spent many years practicing in Tibet. His motivation lies in upholding traditional culture and Taoist traditions, fervently believing in the existence and power of the divine dragon. Ye Ming's secret is his knowledge of an ancient prophecy related to the Qinglong Temple, which may be connected to the case. Player personality type: adept at keeping secrets, interested in mysterious forces. Character assignment suggestion: suitable for players passionate about traditional culture and religion, skilled at exploring mysterious secrets. Special considerations: demonstrate devotion and faith in performance, while maintaining reverence for the divine dragon, guiding players to discover Ye Ming's inner struggles and sense of duty.\n\nLin Zhengyi:\nLin Zhengyi is a renowned archaeologist with a strong interest in the history and legends of the Qinglong Temple. His motivation is to protect antiquities and traditions, but he faces a dilemma between concealing and revealing information in the case. Lin Zhengyi's secret lies in his discovery of a special record about the dragon statue, which may be crucial to uncovering the truth of the case. Player personality type: adept at handling conflicts, passionate about historical culture. Character assignment suggestion: suitable for players who enjoy exploring historical culture and facing moral dilemmas. Special considerations: showcase the conflict between love for antiquities and protection of tradition, guiding players to discover Lin Zhengyi's inner struggles and friendships.\n\nChen Wanru:\nChen Wanru is a female detective from a fishing village, with a special emotional connection to the ocean and mythological legends. Her motivation is to uncover the truth, pursue justice, but she harbors a secret connection to the murdered man. Player personality type: skilled at investigation and exploration, driven by pursuit of justice. Character assignment suggestion: suitable for players who enjoy revealing the truth, possess detective skills. Special considerations: exhibit a professional attitude and a sense of justice, while maintaining dedication to uncovering the truth of the case, guiding players to discover Chen Wanru's internal conflicts and pursuit.\n\nSummary: Ye Ming, Lin Zhengyi, and Chen Wanru are key characters in the Qinglong Temple case, each with a unique background story, motivation, and secret. With the strategic character assignment suggestions, players can better embody their respective roles, explore the complex relationships and truths behind the case. In the game, pay special attention to guiding players to deeply understand the inner world of each character, propelling the storyline forward, and ensuring the smooth progression of the game.",
        "host_guide_intro":
            "The story takes place in the ancient Qinglong Temple in Taiwan, where a statue of the legendary dragon deity who guards the seas is enshrined. A mysterious murder case plunges the temple into chaos, intertwining the fates of the host Ye Ming, archaeologist Lin Zhengyi, and female detective Chen Wanru. They not only have to unravel the complex truth behind the case but also confront their own secrets and contradictions. Players will immerse themselves in uncovering deep mysteries related to ancient myths, legends, and cultures, experiencing the emotional entanglements and psychological changes between the characters.\n\nThis murder mystery script is suitable for players who enjoy deduction and puzzle-solving. Each character has a unique background story, motive, and secrets, and players need to deduce the truth by collecting key clues and identifying misleading ones. Through five rounds of discussion, players will take on the roles of Ye Ming, Lin Zhengyi, and Chen Wanru, experiencing each character's development and inner journey in the case.\n\nWe hope players will enjoy the pleasure of deduction in the game, feel the intricate relationships between the characters, and ultimately uncover the truth behind the Qinglong Temple case. Wishing you a smooth gaming experience and lively role-playing!",
        "host_guide_clues":
            "Clue Distribution Guide:\n\n1. Timing and sequence of clue distribution:\n- Day 1: Introduce the culture of the Blue Dragon Temple and the legend of the Divine Dragon, hinting at the peaceful and unsettling atmosphere within the temple.\n- Day 2: Share special legends or historical records related to the Divine Dragon, sparking discussions about the secrets within the temple.\n- Day 3: Introduce mysterious characters or events, hinting at the emergence of crucial clues, making players start to suspect the complexity of the case.\n- Day 4: Deepen the inner anxieties and conflicts of the characters, creating a tense atmosphere as players sense that the truth is about to be revealed.\n\n2. Different ways of distributing clues:\n- Key clues: Revealed gradually through dialogues, actions, and inner monologues of characters, guiding players towards deeper reasoning.\n- Misleading clues: Created through character actions or descriptions by others, causing confusion and challenges to guide players to be cautious of the authenticity of information.\n\n3. How to control the pace of information disclosure:\n- By characters' daily interactions, discoveries, suspicions, and decisions, gradually reveal clues to maintain players' attention and speculation.\n- Disclose important clues at crucial moments to make players feel the climax and turning points of the story.\n\n4. Handling special clues:\n- For key clues, design events or dialogues that trigger specific actions, guiding players to pay attention to important details and drive the story forward.\n- For misleading clues, set up plots or information contradicting the truth to make players consider multiple possibilities, increasing the difficulty and fun of solving puzzles.\n\nWith the above clue distribution guide, the host can accurately control the disclosure of information, guiding players to immerse themselves in the emotions and reasoning of the characters, ensuring the smooth progression of the game and achieving the desired effect. Wishing the game a successful completion!",
        "host_guide_tips":
            "Providing detailed character backgrounds, clue designs, and five-round discussion role-playing guides, offering rich and specific directing advice for hosting the Qinglong Temple case. In terms of setting the atmosphere, the host should focus on each character's emotional expression and inner struggles, guiding players to immerse themselves in their roles and enhance the immersion. In handling player conflicts, the host needs to flexibly employ the motivations and secrets between characters to guide discussions and reasoning, resolving conflicts. Mastering pacing control techniques, the host should set discussion focuses based on case development, timely advancing the story clues, maintaining a compact and tense game pace. In response to emergencies, the host should be prepared to deal with players' unexpected actions or questions at any time to ensure smooth gameplay. Techniques to enhance immersion include detailed character emotional descriptions, setting key clues, and guiding players to think deeply about the case, increasing the fun and challenge of role-playing. In conclusion, the host should flexibly apply the above techniques and guidance to ensure the smooth progress of the Qinglong Temple case gameplay, creating an immersive experience full of suspense and challenge for players.",
        "host_guide_discussion":
            "Detailed guidelines for each round of discussion:\n\nFirst Round Discussion:\n\n1. Expected goals for each round of discussion\n   - Introduce the background and motivations of the characters to create a story atmosphere.\n\n2. Directions the host should guide:\n   - Guide the characters to show concern and doubts about the case, while also demonstrating their connection to the Green Dragon Temple and traditional culture.\n\n3. Possible issues and response strategies:\n   - If a character deviates from their role's set characteristics, the host can remind them during the discussion to return to their role traits to maintain story coherence.\n\n4. Time control techniques:\n   - Control the discussion time within 5-10 minutes per round to ensure each character has ample opportunity to perform.\n\nSecond Round Discussion:\n\n1. Expected goals for each round of discussion\n   - Deepen interactions between characters, introduce more key clues and red herrings.\n\n2. Directions the host should guide:\n   - Guide the characters to share important clues, showing their understanding and doubts about the case's development.\n\n3. Possible issues and response strategies:\n   - If a character is too silent or deviates from discussing clues, the host can remind or guide them appropriately.\n\n4. Time control techniques:\n   - Control each character's speaking time to ensure a smooth discussion without deviating from the topic.\n\nThird Round Discussion:\n\n1. Expected goals for each round of discussion\n   - Guide the characters to discuss the connection between the case and traditional culture, deepening their understanding of the protection of the Divine Dragon and ancient prophecies.\n\n2. Directions the host should guide:\n   - Encourage discussion on the possible links between ancient legends and real cases, showing reverence and exploration of the power of the Divine Dragon.\n\n3. Possible issues and response strategies:\n   - If the discussion becomes too one-sided or chaotic, the host can ask questions to guide the characters to think deeper about the case's meaning.\n\n4. Time control techniques:\n   - Control the discussion duration to ensure that each character has the opportunity to express their viewpoints and deductions.\n\nFourth Round Discussion:\n\n1. Expected goals for each round of discussion\n   - Guide the characters to show inner struggles and anxieties while preparing for the climax of the case.\n\n2. Directions the host should guide:\n   - Guide the characters to show inner anxieties and struggles, as well as present their understanding and reflections on the case's development.\n\n3. Possible issues and response strategies:\n   - If the characters' emotions are too excited or chaotic, the host should timely calm the atmosphere and guide the discussion back to rationality.\n\n4. Time control techniques:\n   - Ensure the discussion stays on track, control each character's speaking time, and maintain the discussion's pace.\n\nFifth Round Discussion:\n\n1. Expected goals for each round of discussion\n   - Guide the characters to make the final decision, demonstrating their understanding of the case's truth and sense of justice.\n\n2. Directions the host should guide:\n   - Encourage the characters to show pursuit of protection and justice, while also showing determination and attitude in the final voting.\n\n3. Possible issues and response strategies:\n   - If the discussion becomes too rigid or fails to reach a consensus, the host can propose discussion focal points timely to prompt the characters to make a decision.\n\n4. Time control techniques:\n   - Control the time for the final round of discussion, ensure each character has the opportunity to express their final viewpoints and attitudes, and smoothly conduct the voting decision.\n\nThese detailed guidelines for the five rounds of discussion will help the host smoothly guide the game while maintaining the coherence of the storyline and the depth of character performance. Best wishes for the smooth progress of the game, allowing each player to fully immerse themselves in the investigative atmosphere of the Green Dragon Temple case!",
        "host_guide_flow":
            "Game Process and Schedule:\n\n1. Time Allocation:\n   - Self-introduction and Background Setting: 30 minutes\n   - First Round of Discussion: 20 minutes\n   - Second Round of Discussion: 20 minutes\n   - Third Round of Discussion: 20 minutes\n   - Fourth Round of Discussion: 20 minutes\n   - Fifth Round of Discussion: 20 minutes\n   - Revelation of Ending and Conclusion: 20 minutes\n\n2. Specific Content for Each Segment:\n   - Self-introduction and Background Setting: Each character introduces themselves based on the background setting, showcasing their motives, secrets, and characteristics.\n   - First to Fifth Round of Discussion: Each character acts according to the role-play guidelines to demonstrate their attitude, actions, and deduction process regarding the case. Players discuss and reason based on clues and character performances, ultimately voting to determine the culprit.\n   - Revelation of Ending and Conclusion: The host reveals the true identity of the culprit and summarizes the game process, emphasizing the relationships and emotional entanglements among the characters.\n\n3. Possible Time Adjustment Plans:\n   - If the discussion segments run short on time, the self-introduction time can be reduced or the time for ending revelation and conclusion can be compressed.\n   - If players' enthusiasm for discussion is high, discussion time can be extended slightly, but it should not exceed the overall game duration.\n\n4. Key Time Point Reminders:\n   - The host should remind players of the time at the end of each segment to ensure a compact and orderly game flow.\n   - Before the end of the fourth round of discussion, remind players to prepare for voting to determine the culprit.\n   - During the ending revelation and conclusion segment, maintain time control and avoid excessive extension to prevent impacting the overall game experience.\n\nWith the provided game process table, which includes time allocation for each stage, specific content for each segment, possible time adjustment plans, and key time point reminders, it can effectively guide the host in smoothly conducting the game, ensuring a smooth flow throughout the game process. Players will be able to fully immerse themselves in the joy of role-playing and deductive puzzling. Wishing for a successful game and enjoyable time for all players!"
      },
      "Character Designer":
          "Ye Ming:\nBackground Story: Ye Ming was born into an ancient Taoist family and received strict spiritual and traditional education from a young age. Before taking charge of the Qinglong Temple, he went to Tibet for many years to practice, gaining profound insights into mysterious powers and the mysteries of the universe. Upon returning to Taiwan, he chose to take on the responsibility of the Qinglong Temple, hoping to protect the local people through religious beliefs and cultural traditions.\n\nMotivation: Ye Ming's motivation lies in upholding traditional culture and the Taoist lineage. He firmly believes in the existence and power of the Dragon God, seeing it as a blessing for the local people. Faced with the tragedy that occurred in the temple, he is driven not only to uncover the truth but also to uphold the dignity and protection of the Dragon God.\n\nSecret: Ye Ming's secret lies in the ancient prophecy about the Qinglong Temple that he learned during his practice in Tibet. This prophecy may have intricate connections to the case happening in the temple, and it is a heavy burden that he alone bears.\n\nLin Zhengyi:\nBackground Story: Lin Zhengyi is a renowned archaeologist in Taiwan, who discovered important relics near the Qinglong Temple, showing a strong interest in local history and legends. He was a senior to Ye Ming and the two formed a deep friendship through their research on ancient cultures.\n\nMotivation: Lin Zhengyi's motivation is to protect ancient relics and traditions. However, the secrets he becomes entangled in during the temple incident may lead him to difficult choices, which also involve his friendship with Ye Ming.\n\nSecret: Lin Zhengyi's secret is that he found special mentions of a Dragon God statue in some ancient documents. These records may be crucial for revealing the truth behind the case, but he chooses to conceal this information.\n\nChen Wanru:\nBackground Story: Chen Wanru grew up in a local fishing village, with her family having a generational connection to the sea, which gives her a special emotional bond to the ocean and mythical legends. She once experienced a maritime accident, which further deepened her focus on maritime safety.\n\nMotivation: Chen Wanru's motivation is to uncover the truth, seek justice for the victims, and also hopes to reveal the hidden secrets within the temple through this case, allowing justice to prevail.\n\nSecret: Chen Wanru's secret is that she has a special connection with the male victim, which may relate to her past experiences and influence her investigation and judgment of the case.",
      "Title":
          "Divine Dragon's Protection: The mystery of the Azure Dragon Temple",
      "Script Writer":
          "Ye Ming:\nDay 1: Ye Ming bathed in the morning sun at the Green Dragon Temple, feeling the blessing of the divine dragon. He thought about the thriving incense and strong faith of the villagers in the temple recently, but also felt a hint of unease, as if a storm was brewing. He planned to strengthen his connection with the divine dragon during this time to protect the villagers' safety.\nDay 2: Ye Ming learned about Lin Zhengyi's frequent visits to the temple recently and felt a sense of suspicion, but did not delve deeper. As he interacted with the villagers about their faith, he felt their sincere devotion to the divine dragon's blessing, reaffirming his own mission.\nDay 3: A mysterious man came to the temple and requested to see Ye Ming, claiming to have important information about the Green Dragon Temple. Ye Ming's emotions fluctuated, but he calmly received the man, trying to understand his true intentions. He decided to secretly observe the man to prevent any danger to the temple.\nDay 4: Ye Ming was suddenly awakened at night by an ominous premonition, feeling a menacing presence approaching the Green Dragon Temple. Anxiously, he prayed for the divine dragon's protection, preparing for the upcoming challenge.\n\nSummary: As the caretaker of the Green Dragon Temple, Ye Ming bears the responsibility of upholding tradition and culture. He harbors a belief in and fear of the power of the divine dragon. In the four days leading up to the incident, his heart was gradually shrouded in unease and doubt, as he strived for the safety of the temple and the divine dragon's protection.\n\nLin Zhengyi:\nDay 1: Lin Zhengyi conducted archaeological exploration near the temple in the sea and discovered an ancient inscription describing legends related to the divine dragon. He was excited and felt that this information might shed light on the history of the Green Dragon Temple.\nDay 2: Lin Zhengyi conversed with Ye Ming in the temple, sharing their mutual love and faith in traditional culture. He admired Ye Ming's sense of responsibility but also sensed a different atmosphere in the temple, hinting at an ominous premonition.\nDay 3: Lin Zhengyi received a letter from a mysterious person mentioning special records about the dragon statue. Conflicted, he pondered whether to inform Ye Ming of this information or handle the secret related to the case alone.\nDay 4: Lin Zhengyi came to the temple alone at night to study the special symbols on the dragon statue. Anxiously, he began to doubt the intricate connections between the case and the ancient legends of the temple.\n\nSummary: As an expert in ancient artifacts, Lin Zhengyi's love and desire to explore the history of the Green Dragon Temple entwined him in the whirlpool of the case. In the four days leading up to the incident, he experienced a struggle between tradition and friendship, facing the decision of concealment or disclosure.\n\nChen Wanru:\nDay 1: Chen Wanru took over the Green Dragon Temple case, carefully studying the case files and realizing the victim's identity was unknown, making the case complex and mysterious. She was filled with a desire for the truth of the case while sensing its complexity and sensitivity.\nDay 2: Chen Wanru visited the residents near the Green Dragon Temple, trying to understand the situation on the day of the incident. She felt the villagers' reverence and faith in the temple but also noticed that crucial clues seemed to be hidden. She decided to investigate further to uncover the truth of the case.\nDay 3: Chen Wanru unexpectedly discovered that the victim's identity was not simple and he seemed to harbor many unknown secrets. She began to suspect whether the case involved deeper conspiracies, also worrying about the safety of the temple and the mystery of the dragon statue.\nDay 4: During the case investigation, Chen Wanru unexpectedly found some clues related to the victim, feeling uneasy and conflicted. She decided to continue her in-depth investigation to uncover the hidden truth behind the case, also worrying about the safety of the Green Dragon Temple.\n\nSummary: As a young female detective, Chen Wanru's passion and sense of justice drove her to relentlessly seek the truth of the case. In the four days leading up to the incident, she experienced an understanding of the complexity of the case and concerns about the temple's secrets, while facing shadows and challenges from her past.",
      "Clue Generator":
          "Ye Ming:\n- Key Clue 1: Ye Ming learned a segment of an ancient prophecy about the Blue Dragon Temple while practicing in Tibet, and the content of the prophecy may be related to the case.\n- Key Clue 2: Four days before the case occurred, Ye Ming felt an imminent evil aura approaching the Blue Dragon Temple, causing anxiety and restlessness within.\n\n- Misleading Clue 1: Ye Ming entertained a mysterious man on the third day, which could mistakenly suggest a connection to the case.\n- Misleading Clue 2: On the first day, Ye Ming planned to strengthen contact with the Divine Dragon, potentially misinterpreted as having ulterior motives.\n\nLin Zhengyi:\n- Key Clue 1: Lin Zhengyi discovered special records about a statue of the Divine Dragon in ancient documents, which could be crucial to uncovering the truth behind the case.\n- Key Clue 2: Four days before the case occurred, Lin Zhengyi began to suspect a deep connection between the case and the ancient legends within the temple.\n\n- Misleading Clue 1: Lin Zhengyi conversed with Ye Ming on the second day, which could be mistakenly seen as a conversation related to the case.\n- Misleading Clue 2: On the fourth night, Lin Zhengyi researched the Divine Dragon statue alone, potentially misinterpreted as having alternative motives.\n\nChen Wanru:\n- Key Clue 1: Chen Wanru discovered that the identity and secrets of the victim were not simple, which may be crucial to understanding the truth behind the case.\n- Key Clue 2: During investigations on the fourth day, Chen Wanru found clues related to the victim that made her feel uneasy and conflicted.\n\n- Misleading Clue 1: Chen Wanru noticed key clues being concealed on the second day, possibly misconstrued as an intention to hide the truth.\n- Misleading Clue 2: On the third day, Chen Wanru suspected deeper conspiracies related to the case, potentially misinterpreted as unfounded speculation.\n\nBy considering these key clues and misleading clues, players will need to integrate the motives, secrets, and actions of each character to deduce the truth behind the case. The design of each character's clues aims to guide players to delve deeper into the complex relationships behind the case, increasing the challenge and enjoyment of solving the mystery.",
      "Duration": "The game will take 3-4 hours to complete.",
      "Script Planner":
          "Located on the east coast of Taiwan, there is an ancient temple called \"Dragon Temple,\" which is the center of worship for local residents. Inside the temple is a statue of a legendary dragon, believed to be the guardian of the seas. It is said that the dragon will only awaken to protect the people when the coast is in danger. The caretaker of the Dragon Temple is a devout young Taoist priest named Ye Ming, who sees it as his duty to uphold ancient traditions and culture.\n\nOne morning, a tragedy occurred in the Dragon Temple when an unidentified man was found murdered in front of the dragon statue. Ye Ming arrived at the scene to find the case shrouded in mystery, while the temple's manager, Lin Zhengyi, appeared nervous. Lin Zhengyi was originally an archaeologist specializing in ancient artifacts, with deep knowledge of the history of the Dragon Temple. He seemed to have a secret related to the case.\n\nAt the same time, a young female detective named Chen Wanru took over the case. Chen Wanru was born in a local fishing village and was well acquainted with the legends surrounding the Dragon Temple and the seas. She understood the sensitivity of this case. During the investigation, Chen Wanru discovered that the murdered man was not innocent, and his identity and motives were murky. It seemed that the dragon statue in the temple also harbored deeper secrets, intricately linked to ancient legends.\n\nAs the truth slowly unravels, the destinies of Ye Ming, Lin Zhengyi, and Chen Wanru become intertwined. They not only have to face the complexity of the case itself but also confront their own past secrets and contradictions. The case of the Dragon Temple will uncover a deep mystery involving ancient Taiwanese myths, legends, and culture. The emotional entanglements and psychological changes among the characters will add more drama and tension to the whole story.",
      "Player Instruction Writer":
          "Here are detailed role-playing guidelines for each character in the five rounds of discussions:\n\nYe Ming:\nRound One: Ye Ming should exude a sense of piety and blessing, introduce the culture of the Azure Dragon Temple and the legend of the Divine Dragon, while expressing shock and concern about the case.\nRound Two: Ye Ming needs to demonstrate keen perception and understanding of other clues, while maintaining faith and connection to the Divine Dragon.\nRound Three: Ye Ming can guide discussions on the case's connection to tradition through contemplation of ancient prophecies, showing reverence for the power of the Divine Dragon.\nRound Four: After collecting more clues, Ye Ming should display inner anxiety and struggle, while praying for the safety of the temple.\nRound Five: When voting for the killer, Ye Ming should show confidence in the Divine Dragon's protection and appeal for justice to prevail.\n\nLin Zhengyi:\nRound One: Lin Zhengyi should show a love for ancient artifacts and understanding of the temple's history while expressing concern and doubt about the case.\nRound Two: Lin Zhengyi can lead discussions by sharing special records, hinting at the connection to the Divine Dragon statue, showing the value placed on tradition.\nRound Three: Lin Zhengyi should display internal conflicts and struggles while attempting to balance friendship and the pursuit of truth.\nRound Four: While researching the Divine Dragon statue, Lin Zhengyi should show awareness of the complexity of the case and inner anxiety.\nRound Five: When voting, Lin Zhengyi needs to demonstrate the protection and respect for the temple and traditional culture.\n\nChen Wanru:\nRound One: Chen Wanru needs to show a professional attitude towards the case and a sense of justice while guiding discussions on the complexity and sensitivity of the case.\nRound Two: Chen Wanru can collect clues through interviews with residents, showing sympathy for the victims and persistence in uncovering the truth of the case.\nRound Three: Chen Wanru needs to show suspicion and exploration of deeper secrets of the case while urging everyone to solve the mysteries within the temple together.\nRound Four: After finding key clues in the investigation, Chen Wanru should show inner unease and contradictions while remaining vigilant of the case's developments.\nRound Five: When voting, Chen Wanru needs to demonstrate a commitment to justice and the pursuit of truth while calling for a fair and just judgment.\n\nThese are detailed role-playing guidelines for Ye Ming, Lin Zhengyi, and Chen Wanru in the five rounds of discussions on the Azure Dragon Temple case, aiming to provide players with a more immersive role-playing experience. Wishing the game goes smoothly, and may the truth of the case be revealed!"
    };

    final madarin_Script = {
      "characters": [
        {
          "name": "叶明",
          "act_1":
              "在这个古老庙宇案件中，叶明作为虔诚的道士，承载着维护传统与神龙庇佑的责任。他的内心深处隐藏着对神龙力量的信仰与畏惧，在案件发生前四天，他的心境逐渐被不安与疑虑所笼罩。叶明每天都在感受到一种险恶的气息逼近，内心开始焦虑不安，但又要保持表面的镇定与神圣。他与乡民交流时展现出虔诚与庇佑之气息，但心中隐隐感觉到风雨欲来，对庙宇的安全开始祈祷。\n\n叶明的关键线索是他在西藏修行时得知的古老预言，以及感受到险恶气息逼近青龙庙的预感。这些线索将引导玩家深入探究叶明与案件之间的联系，挑战他们的推理与解谜能力。\n\n在与林正义和陈婉如的互动中，叶明将展现出对友谊与信任的珍视，同时也面临着与他们之间的矛盾和对抗。他的决定与行动将直接影响整个案件的走向，同时也揭示出他内心的秘密与真实动机。\n\n通过叶明在五轮讨论中的扮演，玩家将深入体验到他内心的矛盾与挣扎，以及对神龙庇护与传统信仰的坚守。叶明的角色将为整个故事注入更多的戏剧性和张力，引导玩家探索庙宇案件背后的深层秘密和谜团。祝游戏顺利，期待玩家能够全身投入到这场沉浸式剧本杀中，共同揭开青龙庙案件的真相！",
          "act_2":
              "在这一幕中，叶明在青龙庙内感受到一股险恶气息逼近，内心焦虑不安。他开始怀疑自己之前的判断是否正确，是否与案件有更深的联系。新线索的出现让他意识到自己掌握着关键情报，可能揭示庙内古老预言与案件之间的联系。叶明面临选择，是选择主动揭示自己知道的线索，还是选择保持沉默以维持现状。在这一过程中，叶明与林正义的冲突日益激烈，友情与真相之间的抉择让他心力交瘁。他的决定将极大影响剧情走向，是继续坚守信仰，还是揭开隐藏的秘密？叶明的内心挣扎和矛盾情感将尤为关键，他是否暴露脆弱，或继续伪装成冷静理智的外表，将决定他的命运与案件的发展。",
          "act_3":
              "在这幕中，叶明面对青龙庙案件的真相逐渐揭开，内心深处的恐惧与罪恶感逐渐升腾。他的情绪达到高潮，愤怒、悔恨、恐慌交织，心情剧烈波动。叶明面临着重大的心理抉择，是选择继续隐藏自己的过错，还是勇敢地揭露所有真相？在揭露过程中，他与林正义和陈婉如之间的矛盾进一步加剧。叶明的内心转变至关重要，他是否会做出悔改，还是继续执迷不悟？在关键对抗时刻，叶明的情感波动将得到充分展现。\n\n叶明回顾自己在西藏修行得知的预言，意识到其中可能与案件有关，他开始揭示这段古老预言与案件之间的联系。在面对案件发生前的险恶气息时，叶明的内心开始焦虑不安，但他仍坚守信仰，为神龙的庇护祈祷。随着真相的逐渐揭晓，叶明的内心挣扎和矛盾将推动他朝着勇敢面对过错、挽救信仰的方向发展，最终影响整个案件的走向和结局。",
          "act_4":
              "叶明站在庙前神龙雕像下，审判的时刻终于来临。他的内心如同风起云涌，纷繁复杂的情绪在心头翻腾。叶明深深地呼吸着庙宇中弥漫的香火气息，他的眼神中闪烁着矛盾与挣扎。一方面，他想要维护神龙的尊严与庇护，为青龙庙的传统与信仰辩护；另一方面，他心知肚明自己所背负的古老预言，以及自己曾在西藏得知的那段沉重秘密。汗水渗透了叶明的衣衫，他的双手微微颤抖，仿佛在承受着整个世界的压力。\n\n审判者的声音响彻庙宇，叶明被迫做出关键的选择。他可以选择坚持自己的信仰与无辜，继续为神龙辩护，但这意味着可能会隐瞒事实，逃避责任；又或者，他可以选择坦诚承认自己所知道的一切，包括那段古老预言，接受审判，但这将意味着他将失去一切，包括庇佑乡民的机会。\n\n叶明的内心挣扎激烈到极点，他闭上双眼，试图平复内心的波涛。最终，他睁开眼，凝望着审判者，坚定地走向真相的一端。他缓缓开口，声音仿佛随风而去：“我选择……”\n\n在这一刻，叶明的选择将彻底改变他的命运。无论他最终选择的是哪一条道路，都将直面自己的内心深处，承受着对过去与未来的审视与抉择。这是他人生中最艰难的时刻，也是他最终走向救赎与自由的关键转折点。"
        },
        {
          "name": "陈婉如",
          "act_1":
              "叶明清晨在青龙庙内沐浴日光，感受着神龙的庇佑。内心想着近来庙内香火鼎盛，乡民信仰浓厚，但也隐隐感觉到一丝不安，似乎有风雨欲来。他计划在这段时间加强与神龙的联系，以守护乡民平安。第二天，叶明得知林正义最近频繁出入庙内的动向，心中隐隐感到疑惑，但仍未深究。他与乡民交流信仰之事，感受到了乡民对于神龙庇佑的真诚虔诚，也更坚定了自己的使命。第三天，一位神秘男子来到庙前请求见叶明，声称有关青龙庙的重要消息。叶明内心波澜起伏，但仍平静接待，试图了解对方的真实目的。他决定暗中观察这名男子，以防止庙宇遭受任何危险。第四天，叶明在夜晚突然被一阵不详预感惊醒，他感觉到一股险恶气息逐渐逼近青龙庙。内心焦虑不安的他，开始祈祷神龙保佑，准备迎接即将到来的挑战。总结：叶明作为青龙庙的主持者，承载着维护传统与文化的责任，他的内心深处隐藏着对神龙力量的信仰与畏惧。在案件发生前四天，他的内心逐渐被不安与疑虑所笼罩，同时也在为庙宇的安全与神龙的庇护而努力奋斗。",
          "act_2":
              "通过叶明、林正义和陈婉如在青龙庙案件中的五天内心旅程，玩家将见证每位角色面对挑战时的情感波动、内心挣扎和决策过程。叶明作为虔诚的主持者，内心的信仰与畏惧引领他在神龙庇佑下的坚定与焦虑；林正义作为对传统文化与友情珍视的学者，内心的矛盾与探索欲望使他陷入难以抉择的境地；陈婉如作为追求正义的年轻警探，内心的渴望真相与对过去经历的挣扎推动她勇敢面对案件的复杂性。\n\n在这场充满谜团与危机的案件中，每位角色的情感波动与决策将在五轮讨论中逐渐展现，推动剧情向着高潮发展。他们将面临抉择，揭开隐藏的秘密或继续保持沉默，同时角色之间的关系与互动也将产生激烈的冲突与合作。玩家将在角色的心理变化与抉择中感受到剧情的张力与推动力，最终见证他们的决定如何影响整个故事的走向。祝游戏顺利，剧情精彩纷呈！",
          "act_3":
              "在这一幕中，陈婉如面对着案件真相逐渐浮出水面的压力与挑战。在青龙庙内，她审视着被害男子的尸体，心中涌现出复杂的情绪：愤怒、悔恨、恐惧，种种情感交织在一起。她深知揭露真相可能会牵扯到更多的矛盾与秘密，但她坚信正义与公平的重要性。\n\n随着调查的深入，陈婉如发现了一些关键线索，揭示出被害男子与庙内神龙雕像之间的神秘联系。这些发现让她意识到案件远比表面看起来复杂，而庙内的每个角落似乎都隐藏着不为人知的秘密。在这一刻，她面临着重大的心理抉择：是继续追寻真相，还是选择隐瞒所知，为了维护庙宇和乡民的平安而选择沉默？\n\n在与叶明和林正义的交锋中，陈婉如的情感波动达到顶峰。她意识到每个人都背负着沉重的过去与责任，而这起案件将彻底改变每个人的命运。面对着庙内的秘密与谜团，陈婉如最终做出了勇敢的决定——她选择揭露所有的真相，无论这意味着什么样的后果。\n\n这一幕展现了陈婉如内心的挣扎与成长，她通过面对恐惧与犹豫，最终选择了正义与真相。她的决定不仅影响着案件的走向，也让每位角色在这场纷繁复杂的谜团中找到了新的出口。青龙庙的案件将因为陈婉如的勇气与坚持而迎来一场意想不到的转折，故事也将因此而变得更加扣人心弦。",
          "act_4":
              "在审判的关键时刻，陈婉如站在法庭上，面对着所有人的审视和质问。她的内心波涛汹涌，回想起调查案件的种种经历和发现，思绪纷乱。一方面，她渴望还原真相，让受害者得到公正，让庙内的秘密浮出水面。另一方面，她心中的秘密和与案件有关的联系让她犹豫不决，恐惧着自己的过去会被揭露。\n\n陈婉如的眼神坚定而又迷茫，她最终做出了选择——在法官的质询下，她选择坦白自己与被害男子之间的特殊联系，揭开了自己心底的秘密。她接受了自己的过去，承认了曾经的错综复杂，放下了心中的负担。这个决定，让她感到一种莫名的解脱与轻松，同时也带来了面对未来的勇气与决心。\n\n在庭审的最后，陈婉如的眼中闪烁着泪光，但是那是一种释然与宽慰。她或许会面临惩罚，但她选择了正视自己的过去，接受自己的内心阴影，这种勇气和坦诚让她获得了内心的救赎。审判的钟声响起，陈婉如转身离开法庭，脸上带着微笑，迎接着新的起点与未来。"
        },
        {
          "name": "林正义",
          "act_1":
              "在青龙庙案件中，叶明作为虔诚的主持者，内心深藏着对神龙力量的信仰与畏惧。在案件发生前四天，他的内心逐渐被不安与疑虑所笼罩，同时也在为庙宇的安全与神龙的庇护而努力奋斗。与此同时，林正义作为著名考古学家，对古文物与传统的珍视使他卷入了案件的漩涡中。在案发前四天，他的内心经历了对传统与友谊的挣扎，同时也面临着隐瞒与揭露之间的抉择。而陈婉如作为年轻女警探，对于案件的热情与正义感驱使着她不断追寻真相。在案发前四天，她的内心经历了对案件复杂性的认知与对庙内秘密的担忧，同时也在面对过去经历的阴影与挑战。这三位角色的心路历程将会在青龙庙案件中交织在一起，共同揭开一个关乎神话、传说和文化的深层谜团，为整个故事增添更多戏剧性和张力。祝游戏顺利进行，让每位玩家都能深度体验角色的情感波动与复杂关系。",
          "act_2":
              "在这一幕中，林正义感受到内心的矛盾与挣扎逐渐升温。面对案件的复杂性和新线索的涌现，他开始意识到自己所知的关于神龙庙的古老文献记载可能是关键线索。然而，林正义掌握这一信息后，内心却陷入了深深的纠结，是否应该揭示这一秘密，披露庙内隐藏的真相？他开始怀疑自己的选择，同时也开始怀疑叶明是否知情。这种内心的疑虑和挣扎逐渐引发了他与叶明之间的冲突，友情与真相之间的选择愈发艰难。林正义在心理上备受折磨，他的决定将决定着整个故事的发展走向，是维持现状保守秘密，还是选择揭开隐藏的秘密以追求真相？林正义的内心变化和决策将极大影响着剧情的高潮和走向。",
          "act_3":
              "在这一幕中，林正义终于面对着案件的真相，他深陷内心的恐惧与罪恶感之中。在庙内的角落，他发现了一份关于神龙雕像的特殊记录，揭示了与案件有关的重要线索。林正义心中矛盾重重，一方面是对古文物的珍视与保护，另一方面是对叶明与庙宇的忠诚。在情绪达到高潮的时刻，愤怒、悔恨、恐慌交织在他的内心。\n\n面对重大的心理抉择，林正义需要决定是继续隐瞒这份关键信息，还是勇敢地揭露一切。这一选择将直接影响案件的发展和他与叶明之间的关系。林正义开始意识到，他所掌握的信息可能会改变一切，但同时也意味着他将背叛自己的朋友和信仰。在这种内心挣扎中，林正义的转变将成为整个故事的关键转折点。\n\n随着林正义的情感波动达到顶峰，他决定站出来，揭露真相。他与叶明展开激烈的对抗，两位曾经的朋友在道义与利益之间产生严重分歧。林正义的悔恨与勇气在这一刻交织，他选择了面对自己的过错，并坦诚地揭露了隐藏多年的秘密。这个决定不仅改变了案件的走向，也让林正义的内心得到了某种解脱，尽管面临着未知的后果，他选择了勇敢地面对。",
          "act_4":
              "在青龙庙案件的最终审判中，林正义站在审判台前，面对着众人的审视和案件的关键选择。他的内心如同暴风骤雨般波涛汹涌，既有对传统文化的珍视，也有对朋友叶明的忠诚，更有自己曾发现的古老文献中关于神龙雕像的记载。这些矛盾情感交织在一起，让他陷入了一种无法言喻的挣扎。\n\n林正义的眼神闪烁着犹豫和迷茫，他知道自己掌握着能够改变一切的关键信息，但同时也意识到揭露真相可能会毁掉与叶明的友情，动摇青龙庙的信仰基石。在审判官的追问下，林正义的声音略显颤抖：“我……我发现了一些关于神龙雕像的特殊记载，这或许能够解开案件的谜团。”\n\n他的话语引起了一阵骚动，庭审现场顿时沉寂下来，所有人的目光都聚集在他身上。林正义的内心此刻如同被火焰烧灼，他知道自己的选择将会改变一切。是坚持隐瞒，维护古老文化的纯洁，还是揭开真相，面对友情和责任的考验？\n\n最终，在一片肃穆的氛围中，林正义挣扎着做出了决定：“我选择……揭露一切。” 这句话仿佛炸雷般在庭审现场响起，所有人都被他的勇气和诚实所打动。林正义的眼中闪烁着坚定的光芒，他知道这一选择或许会让一切改变，但他愿意为了正义和真相承担一切后果。\n\n林正义的内心在这一刻得到了解放，他感到一种莫名的轻松和解脱。无论最终的结局如何，他选择了勇敢地面对自己的过去和现在，为了追寻内心的正义与坦荡，也为了友情和传统文化的永恒延续。在这场审判的终结中，林正义展现出了内心的真诚与勇气，也为整个青龙庙案件画上了一个令人难忘的句号。"
        }
      ],
      "host": {
        "host_guide_voting":
            "投票环节指南：\n\n1. 投票规则说明：\n在青龙庙案件中，玩家将在最后一轮讨论结束后进行投票，选出他们认为是真凶的角色。每位玩家需私下选择自己的投票对象，并在主持人指导下同时公布投票结果。\n\n2. 如何引导玩家做出选择：\n主持人可以在投票前再次提醒玩家回顾各角色的动机、秘密以及在案件过程中的表现，帮助他们做出更明智的选择。玩家应该考虑角色之间的关联、线索的收集以及角色的行为举止来综合判断。\n\n3. 不同结局的触发条件：\n- 如果大多数玩家投票给了正确的凶手，将揭露真相，案件得以解决，青龙庙恢复宁静。\n- 如果投票结果出现分歧，可能导致错误的结局，需要主持人根据投票结果进行相应的结局解释。\n- 若玩家未能选出正确的凶手，可能导致案件悬而未决，留下悬念，或者选择另一种结局发展。\n\n4. 结局揭晓的戏剧化呈现方式：\n在揭晓投票结果时，主持人可以通过戏剧化的描述和角色互动来增加氛围。根据投票结果，揭露真凶的身份，同时展示其他角色对此的反应，营造出紧张和惊悚的氛围。随后可以展示案件的最终结局，以及各角色的命运走向，为整个游戏画上圆满的句号。\n\n希望以上投票与结局说明能够帮助主持人顺利引导游戏的进行，并为玩家呈现出一个扣人心弦的结局。祝游戏顺利进行，各位玩家都能享受到这场剧本杀游戏的乐趣！",
        "host_guide_character_allocation":
            "叶明：\n叶明是一位虔诚的道士，出生于古老道家世家，在青龙庙主持之前曾在西藏修行多年。他的动机在于维护传统文化与道统，深信神龙的存在与力量。叶明的秘密在于他了解有关青龙庙的一段古老预言，或许与案件有关。玩家性格类型：善于保守秘密、对神秘力量有兴趣。角色分配建议：适合对传统文化与宗教有热情的玩家，善于探索神秘秘密。特殊注意事项：在表现中展现虔诚与信仰，同时保持对神龙的敬畏，引导玩家发现叶明的内心挣扎与使命感。\n\n林正义：\n林正义是著名考古学家，对青龙庙历史与传说有浓厚兴趣。他的动机在于保护古文物与传统，但在案件中面临着隐瞒与揭露之间的抉择。林正义的秘密在于他发现了关于神龙雕像的特殊记载，可能对案件真相至关重要。玩家性格类型：善于处理矛盾、对历史文化有热情。角色分配建议：适合喜欢探讨历史文化、面临道德抉择的玩家。特殊注意事项：展现对古文物的热爱与庇护传统的冲突，引导玩家发现林正义的内心挣扎与朋友情谊。\n\n陈婉如：\n陈婉如是来自渔村的女警探，对海洋与神话传说有特殊情感连接。她的动机在于还原真相、追求正义，但有着与被害男子某种特殊联系的秘密。玩家性格类型：善于调查探索、追求正义。角色分配建议：适合喜欢揭露真相、有侦探天赋的玩家。特殊注意事项：展现专业态度与正义感，同时保持对案件真相的执着，引导玩家发现陈婉如的内心矛盾与追求。\n\n总结：叶明、林正义和陈婉如是青龙庙案件中的关键角色，每位都有独特的背景故事、动机和秘密。通过角色分配的建议策略，玩家可以更好地扮演各自的角色，探索案件背后的复杂关系与真相。在游戏中，特别注意引导玩家深入理解每位角色的内心世界，推动剧情的发展，确保游戏流程顺利进行。",
        "host_guide_intro":
            "故事发生在古老的台湾青龙庙，庙内供奉着传说中守护海域的神龙雕像。一起神秘的凶杀案让庙内陷入混乱，主持者叶明、考古学家林正义和女警探陈婉如三人的命运交织在一起。他们不仅要解开案件的复杂真相，还要直面自身的秘密和矛盾。玩家将沉浸在揭开涉及古老神话、传说和文化的深层谜团中，体验角色之间的情感纠葛和心理变化。\n\n这个剧本杀适合喜欢推理与解谜的玩家群体。每位角色有着独特的背景故事、动机和秘密，玩家需要通过收集关键线索和辨识误导线索来推断真相。通过五轮讨论，玩家将扮演叶明、林正义和陈婉如，体验每位角色在案件中的角色发展和心路历程。\n\n希望玩家们在游戏中享受推理的乐趣，感受角色之间错综复杂的关系，最终揭开青龙庙案件的真相。祝游戏顺利进行，角色扮演生动有趣！",
        "host_guide_clues":
            "线索发放指南：\n\n1. 线索发放的时机和顺序：\n- 第一天：介绍青龙庙的文化与神龙传说，暗示庙内气氛的安宁与不安。\n- 第二天：分享与神龙相关的特殊传说或历史记载，引发对庙内秘密的探讨。\n- 第三天：引入神秘人物或事件，暗示关键线索的出现，让玩家开始怀疑案情的复杂性。\n- 第四天：加深角色内心的焦虑与矛盾，让玩家感受到真相即将浮出水面的紧张氛围。\n\n2. 不同线索的发放方式：\n- 关键线索：通过角色间的对话、行动和内心独白逐步揭示，引导玩家深入推理。\n- 误导线索：通过角色的行为或他人描述，制造混淆与挑战，引导玩家警惕信息的真实性。\n\n3. 如何控制信息揭露节奏：\n- 通过角色每日的互动、发现、怀疑和决定，逐步揭露线索，保持玩家的关注和猜测。\n- 在关键时刻适时揭露重要线索，让玩家感受到剧情的高潮和转折。\n\n4. 特殊线索的处理方法：\n- 对于关键线索，可设计触发特定事件或对话，引导玩家关注重要细节，推动故事发展。\n- 对于误导线索，应设置与真相相悖的情节或信息，让玩家思考多方可能性，增加解谜的难度与趣味。\n\n通过以上线索发放指南，主持人可以精确控制信息的揭露，引导玩家沉浸在角色的情感与推理中，确保游戏的流程顺畅并达到预期的效果。祝游戏圆满成功！",
        "host_guide_tips":
            "通过详细的角色背景设定、线索设计和五轮讨论扮演指引，为青龙庙案件的主持提供了丰富而具体的执导建议。在氛围营造方面，主持人应注重每位角色的情感表达与内心挣扎，引导玩家投入角色，增强沉浸感。在玩家冲突处理上，主持人需灵活运用角色之间的动机与秘密，引导讨论与推理，化解矛盾。掌握节奏控制技巧，主持人应根据案件发展设定讨论焦点，适时推进故事线索，保持游戏节奏紧凑而紧张。应对紧急情况，主持人需随时准备处理玩家的意外行动或提问，保持游戏进行顺畅无阻。提升沉浸感的技巧包括细致的角色情感描写、关键线索设置以及引导玩家深入思考案情，增加角色扮演的乐趣与挑战性。综上所述，主持人应灵活运用以上技巧与指引，确保青龙庙案件的游戏流程顺利进行，为玩家营造一个充满悬疑与挑战的沉浸式体验。",
        "host_guide_discussion":
            "第一轮讨论的详细指引：\n\n1. 每轮讨论的预期目标\n   - 引入角色的背景与动机，营造故事氛围。\n   \n2. 主持人应引导的方向\n   - 引导角色展现对案件的关切与疑虑，同时展示其与青龙庙以及传统文化的联系。\n   \n3. 可能出现的问题及应对方案\n   - 若角色偏离角色设定，主持人可在讨论中提醒其回归角色特性，保持故事连贯性。\n   \n4. 时间控制技巧\n   - 每轮讨论时间控制在5-10分钟内，确保每位角色有充分表现机会。\n\n第二轮讨论的详细指引：\n\n1. 每轮讨论的预期目标\n   - 加深角色之间的互动，引入更多关键线索与误导线索。\n   \n2. 主持人应引导的方向\n   - 引导角色分享重要线索，展现对案件发展的理解与疑虑。\n   \n3. 可能出现的问题及应对方案\n   - 若角色过于沉默或偏离线索讨论，主持人可适时提醒或引导。\n   \n4. 时间控制技巧\n   - 控制每位角色发言时间，确保讨论流畅并不偏离主题。\n\n第三轮讨论的详细指引：\n\n1. 每轮讨论的预期目标\n   - 引导角色探讨案件与传统文化的关联，加深对神龙庇护与古老预言的理解。\n   \n2. 主持人应引导的方向\n   - 鼓励角色深入讨论古老传说与现实案件之间的可能联系，展现对神龙力量的敬畏与探索。\n   \n3. 可能出现的问题及应对方案\n   - 若讨论过于片面或混乱，主持人可提出问题引导角色思考案件更深层次含义。\n   \n4. 时间控制技巧\n   - 控制讨论时长，确保每位角色有机会表达自己的观点与推断。\n\n第四轮讨论的详细指引：\n\n1. 每轮讨论的预期目标\n   - 引导角色展示内心挣扎与焦虑，同时准备迎接案件发展的高潮。\n   \n2. 主持人应引导的方向\n   - 引导角色表现内心的焦虑与挣扎，同时呈现对案件发展的理解与反思。\n   \n3. 可能出现的问题及应对方案\n   - 若角色情绪过于激动或混乱，主持人应适时平息气氛，引导讨论回归理性。\n   \n4. 时间控制技巧\n   - 确保讨论不偏离主题，控制每位角色表达时间，保持讨论节奏。\n\n第五轮讨论的详细指引：\n\n1. 每轮讨论的预期目标\n   - 引导角色做出最终决定，表现对案件真相的认知与正义感。\n   \n2. 主持人应引导的方向\n   - 鼓励角色表现对庇护与正义的追求，同时展现最终投票的决心与态度。\n   \n3. 可能出现的问题及应对方案\n   - 若讨论过于僵化或无法达成共识，主持人可适时提出讨论重点，促使角色做出决定。\n   \n4. 时间控制技巧\n   - 控制最后一轮讨论时间，确保每位角色有机会表达最终观点与态度，顺利进行投票决定。\n\n这些详细的五轮讨论指引将帮助主持人顺利引导游戏进行，保持故事情节的连贯性与角色表现的深度。祝游戏进行顺利，让每位玩家都能充分沉浸在青龙庙案件的推理氛围中！",
        "host_guide_flow":
            "游戏流程与时间安排：\n\n1. 时间分配：\n   - 自我介绍与背景设定：30分钟\n   - 第一轮讨论：20分钟\n   - 第二轮讨论：20分钟\n   - 第三轮讨论：20分钟\n   - 第四轮讨论：20分钟\n   - 第五轮讨论：20分钟\n   - 结局揭晓与总结：20分钟\n\n2. 每个环节具体内容：\n   - 自我介绍与背景设定：每位角色按照设定背景介绍自己的角色，展示动机、秘密和特点。\n   - 第一轮至第五轮讨论：每位角色按照扮演指引展示对案件的态度、行动以及推理过程。玩家根据线索和角色表现进行讨论和推理，最终投票选出凶手。\n   - 结局揭晓与总结：主持人揭露真凶身份，并对游戏过程进行总结，强调角色之间的关系和情感纠葛。\n\n3. 可能的时间调整方案：\n   - 如果讨论环节时间不够，可以适当减少自我介绍时间或压缩结局揭晓与总结时间。\n   - 若玩家讨论热情高涨，可适当延长讨论时间，但需确保不超出整体游戏时长。\n\n4. 关键时间节点提醒：\n   - 主持人需在每个环节结束时提醒玩家时间，确保游戏流程紧凑有序。\n   - 在第四轮讨论结束前，提醒玩家准备投票选出凶手。\n   - 在结局揭晓与总结环节，保持时间控制，不要延长过多，以免影响整体游戏体验。\n\n通过以上游戏流程表，包含了各阶段时间分配、每个环节具体内容、可能的时间调整方案以及关键时间节点提醒，可以有效引导主持人顺利开展游戏，确保整个游戏流程顺畅进行，玩家们能够充分沉浸在角色扮演和推理解谜的乐趣中。祝游戏进行顺利，玩家们玩得愉快！"
      },
      "Character Designer":
          "叶明：\n背景故事：叶明出生于一个古老道家世家，自幼便接受严格的修道与传统教育。在青龙庙主持之前，他曾远赴西藏修行多年，对于神秘力量与宇宙奥秘有着深刻领悟。回到台湾后，他选择承担起青龙庙的责任，希望通过宗教信仰与文化传统来守护乡民。\n\n动机：叶明的动机在于维护传统文化与道统，他深信神龙的存在与力量，视之为对当地人民的庇佑。面对庙内发生的惨剧，他不仅是为了还原真相，更是为了维护神龙的尊严与庇护。\n\n秘密：叶明的秘密在于他曾在西藏修行时得知了有关青龙庙的一段古老预言，而这段预言或许与庙内发生的案件有着千丝万缕的联系，这也是他独自承受的沉重负担。\n\n林正义：\n背景故事：林正义是台湾著名的考古学家，曾在青龙庙附近海域发现重要古文物，对于当地历史与传说有着浓厚兴趣。他曾是叶明的学长，两人在研究古老文化时结下深厚的情谊。\n\n动机：林正义的动机在于保护古文物与传统，但在庙内发生的案件中，他卷入其中的秘密或许会让他面临艰难抉择，同时也牵扯到他与叶明之间的友谊。\n\n秘密：林正义的秘密在于他曾发现一些古老文献中关于神龙雕像的特殊记载，这些记录或许对于案件真相的揭露至关重要，但他却选择隐瞒这部分信息。\n\n陈婉如：\n背景故事：陈婉如成长在当地渔村，家庭世代与海相关，对于海洋与神话传说有着特殊的情感连接。她曾经历过一起海难事故，这经历也加深了她对海域安全的重视。\n\n动机：陈婉如的动机在于还原真相，为受害者讨回公道，同时也希望通过这起案件揭开庙内隐藏的秘密，让正义得以伸张。\n\n秘密：陈婉如的秘密在于她与被害男子有着某种特殊的联系，这种联系或许牵扯到她过去的经历，也可能影响她对案件的调查和判断。",
      "Title": "神龙庇护：青龙庙谜案",
      "Script Writer":
          "叶明：\n第一天：叶明清晨在青龙庙内沐浴日光，感受着神龙的庇佑。内心想着近来庙内香火鼎盛，乡民信仰浓厚，但也隐隐感觉到一丝不安，似乎有风雨欲来。他计划在这段时间加强与神龙的联系，以守护乡民平安。\n第二天：叶明得知林正义最近频繁出入庙内的动向，心中隐隐感到疑惑，但仍未深究。他与乡民交流信仰之事，感受到了乡民对于神龙庇佑的真诚虔诚，也更坚定了自己的使命。\n第三天：一位神秘男子来到庙前请求见叶明，声称有关青龙庙的重要消息。叶明内心波澜起伏，但仍平静接待，试图了解对方的真实目的。他决定暗中观察这名男子，以防止庙宇遭受任何危险。\n第四天：叶明在夜晚突然被一阵不详预感惊醒，他感觉到一股险恶气息逐渐逼近青龙庙。内心焦虑不安的他，开始祈祷神龙保佑，准备迎接即将到来的挑战。\n\n总结：叶明作为青龙庙的主持者，承载着维护传统与文化的责任，他的内心深处隐藏着对神龙力量的信仰与畏惧。在案件发生前四天，他的内心逐渐被不安与疑虑所笼罩，同时也在为庙宇的安全与神龙的庇护而努力奋斗。\n\n林正义：\n第一天：林正义在庙附近海域进行考古勘探，发现了一块古老碑文，上面描述着与神龙有关的传说。他内心兴奋不已，同时也觉得这些资料可能会对青龙庙的历史有所启示。\n第二天：林正义在庙内与叶明交谈，两人分享了彼此对于传统文化的热爱与信仰。他心中暗自为叶明的责任感而感到敬佩，但也开始觉得庙内的氛围有所不同，似乎隐藏着某种不详的预兆。\n第三天：林正义接到了一位神秘人士的来信，信中提到了关于神龙雕像的特殊记载，他内心矛盾不已。他开始思考是否应该将这份信息告知叶明，或者选择独自处理这段与案件有关的秘密。\n第四天：林正义在夜晚独自来到庙内，试图研究神龙雕像的特殊符号。内心焦虑不安的他，开始怀疑这起案件是否与庙内的古老传说有着千丝万缕的联系。\n\n总结：林正义作为古文物研究专家，对于青龙庙历史的热爱与探索欲望使他卷入了这起案件的漩涡中。在案发前四天，他的内心经历了对传统与友谊的挣扎，同时也面临着隐瞒与揭露之间的抉择。\n\n陈婉如：\n第一天：陈婉如接手青龙庙案件，仔细研究案情资料，了解到被害男子身份不明且案情扑朔迷离。她内心充满了对案件真相的渴望，同时也感受到了案件的复杂性与敏感性。\n第二天：陈婉如走访了青龙庙周边的居民，试图了解案发当日的情况。她感受到了乡民对于青龙庙的敬畏与信仰，但也察觉到一些关键线索似乎被掩盖。她决定深入调查，还原案件真相。\n第三天：陈婉如意外发现被害男子的身份并非简单，他似乎隐藏着许多不为人知的秘密。她内心开始怀疑这起案件是否牵涉更深的阴谋，同时也开始担心庙内的安全和神龙雕像的神秘。\n第四天：陈婉如在案件调查中意外发现了与被害男子有关的某些线索，内心开始感到不安与矛盾。她决定继续深入调查，寻找案件背后隐藏的真相，同时也为青龙庙的安全感到担忧。\n\n总结：作为年轻女警探，陈婉如对于案件的热情与正义感驱使着她不断追寻真相。在案发前四天，她的内心经历了对案件复杂性的认知与对庙内秘密的担忧，同时也在面对过去经历的阴影与挑战。",
      "Clue Generator":
          "叶明：\n- 关键线索1：叶明曾在西藏修行时得知有关青龙庙的一段古老预言，预言内容可能与案件有关。\n- 关键线索2：叶明在案件发生前四天，感受到一股险恶气息逼近青龙庙，内心开始焦虑不安。\n\n- 误导线索1：叶明第三天接待神秘男子，可能被误认为与案件有关。\n- 误导线索2：叶明第一天计划加强与神龙的联系，可能被误解为有着其他动机。\n\n林正义：\n- 关键线索1：林正义发现古老文献中关于神龙雕像的特殊记载，这份信息可能对案件真相至关重要。\n- 关键线索2：林正义在案件发生前四天，开始怀疑案件与庙内古老传说有着千丝万缕的联系。\n\n- 误导线索1：林正义第二天与叶明交谈，可能被误解为与案件有关的对话。\n- 误导线索2：林正义在第四天夜晚独自研究神龙雕像，可能被误认为有其他目的。\n\n陈婉如：\n- 关键线索1：陈婉如发现被害男子身份与秘密并非简单，这或许关乎案件的真相。\n- 关键线索2：陈婉如在第四天调查中发现与被害男子有关的线索，内心开始感到不安与矛盾。\n\n- 误导线索1：陈婉如第二天察觉到关键线索被掩盖，可能被误解为意图掩盖真相。\n- 误导线索2：陈婉如在第三天怀疑案件牵涉更深阴谋，可能被误认为有着不实猜测。\n\n通过这些关键线索和误导线索，玩家将需要综合各角色的动机、秘密和行动来推断案件真相。每位角色的线索设计旨在引导玩家深入探究案件背后的复杂关系，增加解谜的挑战和趣味性。",
      "Duration": "游戏所需时长为3-4小时。",
      "Script Planner":
          "位于台湾东部海岸的一座古老庙宇，名为“青龙庙”，是当地居民信仰的中心。庙内供奉着一尊传说中守护海域的神龙雕像，传说只有当海岸陷入危机时，神龙才会苏醒保护人民。青龙庙的主持者是一位虔诚的年轻道士叶明，他以维护古老传统与文化为己任。\n\n一天清晨，青龙庙内发生一起惨剧，被发现有一名身份不明的男子被杀害在神龙雕像前。叶明赶到现场，发现案情扑朔迷离，而庙内的寺务主管林正义却神色慌张。林正义原是一名研究古文物的考古学家，对于青龙庙的历史颇有研究，他似乎有着与案件相关的秘密。\n\n与此同时，一位年轻女警探陈婉如接手此案。陈婉如出生在当地渔村，对于青龙庙和海域的传说耳熟能详，她深知这起案件的敏感性。在调查过程中，陈婉如发现被害男子并非无辜，其身份和动机都扑朔迷离。而庙内的青龙雕像似乎也隐藏着更深的秘密，与古老传说有着千丝万缕的联系。\n\n在真相逐渐揭晓的过程中，叶明、林正义和陈婉如三人的命运交织在一起，他们不仅要面对案件本身的复杂性，还要直面自身过往的秘密与矛盾。青龙庙的案件将揭开一个涉及台湾古老神话、传说和文化的深层谜团，角色之间的情感纠葛和心理变化将为整个故事增添更多戏剧性和张力。",
      "Player Instruction Writer":
          "以下是每位角色在五轮讨论中的详细扮演指引：\n\n叶明：\n第一轮：叶明应展现虔诚与庇佑之气息，介绍青龙庙的文化与神龙传说，同时对案件表示震惊与忧虑。\n第二轮：叶明需表现出对其他线索的敏锐感知与理解，同时保持对神龙的信仰与联系。\n第三轮：叶明可以通过对古老预言的思考，引导讨论案件与传统的关联，展现出对神龙力量的敬畏。\n第四轮：叶明在收集到更多线索后，应展现出内心的焦虑与挣扎，同时为庙宇的安全祈祷。\n第五轮：叶明在投票选出凶手时，应表现出对神龙庇佑的信心，并呼吁正义得以伸张。\n\n林正义：\n第一轮：林正义需展现对古文物的热爱与庙宇历史的了解，同时对案件表示关切与疑虑。\n第二轮：林正义可以通过分享特殊记载引导讨论，同时暗示与神龙雕像的联系，展现对传统的珍视。\n第三轮：林正义应展现内心的矛盾与纠结，同时试图平衡友谊与真相之间的抉择。\n第四轮：林正义在研究神龙雕像时，应展现出对案件复杂性的认知与内心的焦虑。\n第五轮：林正义在投票时，需展现出对庙宇与传统文化的保护与尊重。\n\n陈婉如：\n第一轮：陈婉如需展现对案件的专业态度与正义感，同时引导讨论案情的复杂性与敏感性。\n第二轮：陈婉如可以通过走访居民引导线索的收集，展现出对受害者的同情与对案件真相的执着。\n第三轮：陈婉如需展现对案件更深层次秘密的怀疑与探索，同时呼吁大家共同揭开庙内的谜团。\n第四轮：陈婉如在调查中发现关键线索后，应展现内心的不安与矛盾，同时对案件发展保持警惕。\n第五轮：陈婉如在投票时，需展现对正义的坚守与对案件真相的追求，同时呼吁公平公正的裁决。\n\n以上是叶明、林正义和陈婉如在青龙庙案件五轮讨论中的详细扮演指引，希望能够为玩家们提供更加沉浸式的角色体验。祝游戏顺利进行，案件真相揭晓！"
    };

    // uploadScriptToFirestore(
    //     "0106e80b-9234-4494-8f78-2d7357779de8", madarin_Script, eng_script);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE0E6FF),
                  Color(0xFFD5E6F3),
                ],
              ),
            ),
          ),

          // Abstract design elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.1),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.1),
              ),
            ),
          ),

          // Earth image background
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 0,
          //   child: Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     // opacity: 0.6,
          //     child: Image.asset(
          //       'assets/images/earth.png',
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //       height: double.infinity,
          //     ),
          //   ),
          // ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome text
                  const Text(
                    "Welcome to Jejom",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Main heading
                  const Text(
                    "Plan The",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const Text(
                    "Best Trip To The",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Destination input field
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                autofocus: false,
                                decoration: const InputDecoration(
                                  hintText: "Vacation",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(color: Colors.black87),
                                textInputAction: TextInputAction.send,
                                onChanged: (value) =>
                                    travelProvider.updatePrompt(value),
                                onSubmitted: (value) {
                                  travelProvider.sendPrompt();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TravelWrapper(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: () {
                                  travelProvider.sendPrompt();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TravelWrapper(),
                                    ),
                                  );
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Action buttons
                  _buildActionBar(),

                  const SizedBox(height: 24),

                  // Current trip card
                  if (tripProvider.trips.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Current Trip",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      cleanText(tripProvider.trips.first.title),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TripDetails(
                                        trip: tripProvider.trips.first,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          // decoration: BoxDecoration(
          //   color: Colors.white.withOpacity(0.15),
          //   borderRadius: BorderRadius.circular(20),
          //   border: Border.all(
          //     color: Colors.white.withOpacity(0.2),
          //     width: 1.5,
          //   ),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(
                icon: Icons.travel_explore_rounded,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TripList(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                icon: Icons.restaurant_menu_rounded,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuOCRPage(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                icon: Icons.local_play_rounded,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GameList(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                icon: Icons.explore_rounded,
                isHighlighted: true,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ExploreWrapper(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isHighlighted = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isHighlighted ? Colors.black87 : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isHighlighted ? Colors.black87 : Colors.white.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: isHighlighted ? Colors.white : Colors.black87,
          size: 24,
        ),
      ),
    );
  }
}
