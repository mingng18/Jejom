import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jejom/models/interest_destination.dart';
import 'package:jejom/utils/constants/curve.dart';
import 'package:jejom/utils/glass_container.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jejom/providers/user/interest_provider.dart';
import 'package:http/http.dart' as http;
import 'package:jejom/utils/loading_screen.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchController = TextEditingController();
  final String _googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            "Explore Top Destinations",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search for a place (e.g., Korea)",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      setState(() {
                        _isLoading = true;
                        Provider.of<InterestProvider>(context, listen: false)
                            .clearInterests();
                      });
                      // Get place coordinates searched by user
                      final coordinates = await getPlaceCoordinates(value);
                      if (coordinates != null) {
                        Provider.of<InterestProvider>(context, listen: false)
                            .fetchTrendingInterests(
                          latitude: coordinates['lat'],
                          longitude: coordinates['lng'],
                        );
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (_searchController.text.isNotEmpty) {
                    setState(() {
                      _isLoading = true;
                      Provider.of<InterestProvider>(context, listen: false)
                          .clearInterests();
                    });
                    final coordinates =
                        await getPlaceCoordinates(_searchController.text);
                    if (coordinates != null) {
                      Provider.of<InterestProvider>(context, listen: false)
                          .fetchTrendingInterests(
                        latitude: coordinates['lat'],
                        longitude: coordinates['lng'],
                      );
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? const LoadingWidget()
                : Consumer<InterestProvider>(
                    builder: (context, interestProvider, child) {
                      if (interestProvider.interests == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final filteredInterests = interestProvider.interests!
                          .where((destination) =>
                              destination.llmDescription != null &&
                              destination.llmDescription!.isNotEmpty)
                          .toList();

                      if (filteredInterests.isEmpty) {
                        return const Center(
                            child: Text(
                                "No destinations with recommendations found"));
                      }

                      return AnimationLimiter(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: filteredInterests.length,
                            itemBuilder: (context, index) {
                              final destination = filteredInterests[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  curve: EMPHASIZED_DECELERATE,
                                  child: FadeInAnimation(
                                    curve: EMPHASIZED_DECELERATE,
                                    child: GlassContainer(
                                      padding: 0,
                                      marginBottom: 16,
                                      width: double.infinity,
                                      child: destinationCard(
                                          destination: destination,
                                          isSelected: false),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, double>?> getPlaceCoordinates(String placeName) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?address=$placeName&key=$_googleApiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['results'] != null &&
          jsonResponse['results'].isNotEmpty) {
        final location = jsonResponse['results'][0]['geometry']['location'];
        return {
          'lat': location['lat'],
          'lng': location['lng'],
        };
      }
    }
    return null;
  }

  Future<void> launchGoogleMaps(
      double destinationLatitude, double destinationLongitude) async {
    final uri = Uri(
        scheme: "google.navigation",
        queryParameters: {'q': '$destinationLatitude, $destinationLongitude'});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }

  Widget destinationCard({
    required InterestDestination destination,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        print(
            'Destination: ${destination.name}, LLM Description: ${destination.llmDescription}');
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      destination.imageUrl.isNotEmpty
                          ? destination.imageUrl[0]
                          : 'assets/images/image1.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/image1.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          destination.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          destination.address,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.7),
                                  ),
                        ),
                        const SizedBox(height: 8),
                        if (destination.llmDescription != null &&
                            destination.llmDescription!.isNotEmpty)
                          Text(
                            destination.llmDescription!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1)
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                destination.imageUrl.isNotEmpty
                    ? destination.imageUrl[0]
                    : 'assets/images/image1.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/image1.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    destination.description,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.8),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () =>
                      launchGoogleMaps(destination.lat, destination.long),
                  child: Container(
                    width: 64,
                    height: 64,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: isSelected
                          ? null
                          : Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              width: 2,
                            ),
                      color: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isSelected
                          ? const Icon(Icons.check)
                          : Transform.rotate(
                              angle: 1.5708 / 2,
                              child: const Icon(Icons.arrow_upward_rounded),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
