import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jejom/models/language_enum.dart';
import 'package:jejom/providers/script_game_provider.dart';
import 'package:jejom/utils/glass_container.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ScriptGamePage extends StatefulWidget {
  const ScriptGamePage({super.key});

  @override
  State<ScriptGamePage> createState() => _ScriptGamePageState();
}

class _ScriptGamePageState extends State<ScriptGamePage> {
  final PageController _pageController = PageController();
  _SelectedTab selectedTab = _SelectedTab.restaurant;

  void handleIndexChanged(int i) {
    setState(() {
      selectedTab = _SelectedTab.values[i];
      _pageController.jumpToPage(i);
    });
  }

  Future<void> launchGoogleMaps(
      double destinationLatitude, double destinationLongitude) async {
    final uri = Uri(
        scheme: "google.navigation",
        // host: '"0,0"',  {here we can put host}
        queryParameters: {'q': '$destinationLatitude, $destinationLongitude'});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    final scriptGameProvider = Provider.of<ScriptGameProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                SegmentedButton<Language>(
                  segments: const <ButtonSegment<Language>>[
                    ButtonSegment<Language>(
                        value: Language.english, label: Text('Eng')),
                    ButtonSegment<Language>(
                        value: Language.korean, label: Text('Kor')),
                  ],
                  selected: <Language>{scriptGameProvider.lang},
                  onSelectionChanged: (Set<Language> newSelection) {
                    scriptGameProvider.updateLanguage(newSelection.first);
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          //Show divider when on scroll
          Container(
            height: 1,
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedTab = _SelectedTab.values[index];
                });
              },
              children: [
                _buildRestaurantTab(scriptGameProvider),
                _buildScriptTab(scriptGameProvider),
                // _buildCharacterTab(scriptGameProvider),
                // _buildAddTab(scriptGameProvider),
                // _buildClueTab(scriptGameProvider),
                // _buildPlayerTab(scriptGameProvider),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          marginR: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
          currentIndex: _SelectedTab.values.indexOf(selectedTab),
          unselectedItemColor: Colors.white70,
          selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: handleIndexChanged,
          enableFloatingNavBar: true,
          items: [
            CrystalNavigationBarItem(
              icon: Icons.restaurant_rounded,
              unselectedIcon: Icons.restaurant_outlined,
            ),
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
            ),
            // CrystalNavigationBarItem(
            //   icon: Icons.child_care_rounded,
            //   unselectedIcon: Icons.child_care_outlined,
            // ),
            // CrystalNavigationBarItem(
            //   icon: Icons.book_rounded,
            //   unselectedIcon: Icons.book_outlined,
            // ),
            // CrystalNavigationBarItem(
            //   icon: Icons.follow_the_signs_rounded,
            //   unselectedIcon: Icons.follow_the_signs_outlined,
            // ),
            // CrystalNavigationBarItem(
            //   icon: Icons.person_rounded,
            //   unselectedIcon: Icons.person_outline_rounded,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantTab(ScriptGameProvider scriptGameProvider) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              scriptGameProvider.selectedGame?.title ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Duration: ${scriptGameProvider.selectedGame?.duration ?? ""}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // const SizedBox(height: 32),
            // Text(
            //   "Offered Restaurants",
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            // const SizedBox(height: 16),
            MediaQuery.removePadding(
              context: context,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: scriptGameProvider.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = scriptGameProvider.restaurants[index];
                  return GlassContainer(
                    padding: 16,
                    marginBottom: 16,
                    width: double.infinity,
                    child: Column(
                      children: [
                        if (restaurant.imageUrl.isNotEmpty)
                          SizedBox(
                            height: 200,
                            child: CarouselView(
                              itemExtent: 300,
                              shrinkExtent: 200,
                              children: restaurant.imageUrl.map((url) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        child: const Center(
                                          child: Icon(Icons.image_not_supported),
                                        ),
                                      );
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    restaurant.description,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                launchGoogleMaps(
                                    restaurant.lat, restaurant.long);
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Transform.rotate(
                                  angle: 1.5708 / 2,
                                  child: const Icon(Icons.arrow_upward_rounded),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildScriptTab(ScriptGameProvider scriptGameProvider) {
    if (scriptGameProvider.games.isEmpty) {
      return Center(
        child: Text(
          "No script available",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Storyline",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              scriptGameProvider.games.first.scriptPlanner
                  .replaceAll(r'\n', '\n'),
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            Text("Visit the restaurant to know about the full story!",
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterTab(ScriptGameProvider scriptGameProvider) {
    if (scriptGameProvider.games.isEmpty) {
      return Center(
        child: Text(
          "No character data available",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Character Designer",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              scriptGameProvider.games.first.characterDesigner
                  .replaceAll(r'\n', '\n'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildAddTab(ScriptGameProvider scriptGameProvider) {
    if (scriptGameProvider.games.isEmpty) {
      return Center(
        child: Text(
          "No script data available",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Script Writer",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              scriptGameProvider.games.first.scriptWriter
                  .replaceAll(r'\n', '\n'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildClueTab(ScriptGameProvider scriptGameProvider) {
    if (scriptGameProvider.games.isEmpty) {
      return Center(
        child: Text(
          "No clue data available",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Clue Generator",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              scriptGameProvider.games.first.clueGenerator
                  .replaceAll(r'\n', '\n'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerTab(ScriptGameProvider scriptGameProvider) {
    if (scriptGameProvider.games.isEmpty) {
      return Center(
        child: Text(
          "No player data available",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Player Instruction Writer",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              scriptGameProvider.games.first.playerInstructionWriter
                  .replaceAll(r'\n', '\n'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { restaurant, storyline }
