import 'package:flutter/material.dart';
import 'package:jejom/modules/explore/explore.dart';
import 'package:jejom/modules/food/ocr.dart';
import 'package:jejom/modules/maps/map.dart';
import 'package:jejom/modules/script_game/game_list.dart';
import 'package:jejom/modules/travel_prompting/travel_wrapper.dart';
import 'package:jejom/providers/travel_provider.dart';
import 'package:jejom/providers/trip_provider.dart';
import 'package:jejom/providers/user_provider.dart';
import 'package:jejom/utils/glass_container.dart';
import 'package:provider/provider.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, 300),
              child: Image.asset(
                'assets/images/earth.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to Jejom",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.6),
                          )),
                  const SizedBox(height: 8),
                  Text("Plan The",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text("Best Trip To The",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Vacation",
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.background,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onChanged: (value) =>
                              travelProvider.updatePrompt(value),
                          onSubmitted: (value) {
                            travelProvider.sendPrompt();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TravelWrapper(),
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          travelProvider.sendPrompt();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TravelWrapper(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Spacer(),
                  _buildActionBar(),
                  const SizedBox(height: 16),
                  tripProvider.trips.isEmpty
                      ? const SizedBox()
                      : GlassContainer(
                          padding: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Current Trip",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge),
                                      const SizedBox(height: 8),
                                      Text(tripProvider.trips.first.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MapPage(),
              ),
            );
          },
          child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.map_rounded,
                color: Theme.of(context).colorScheme.background,
              )),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MenuOCRPage(),
              ),
            );
          },
          child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.restaurant_menu_rounded,
                color: Theme.of(context).colorScheme.background,
              )),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GameList(),
              ),
            );
          },
          child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.local_play_rounded,
                color: Theme.of(context).colorScheme.background,
              )),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Explore(),
              ),
            );
          },
          child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 2,
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.explore_rounded,
                color: Theme.of(context).colorScheme.background,
              )),
        ),
      ],
    );
  }
}
