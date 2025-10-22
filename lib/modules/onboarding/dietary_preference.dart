import 'package:flutter/material.dart';
import 'package:jejom/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';

class DietaryPreferences extends StatelessWidget {
  const DietaryPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnboardingProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            IconButton(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              iconSize: 80,
              onPressed: () => onBoardingProvider.previousPage(),
              icon: const Icon(Icons.arrow_back, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              "Food Preferences & Allergies",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Text("Type of food", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            RadioGroup<String>(
              onChanged: (value) => onBoardingProvider.setDietary(value!),
              child: Column(
                children: _buildFoodTypeRadioButtons(context, onBoardingProvider.dietary),
              ),
            ),
            const SizedBox(height: 32),
            Text("Allergens", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text(
              "Enter your allergens (separated by commas)",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'egg, milk, peanuts',
              ),
              onChanged: (value) => onBoardingProvider.setAllergies(value),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Spacer(),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primaryContainer,
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  onPressed: onBoardingProvider.isLoading
                      ? null // Disable the button when loading
                      : () => onBoardingProvider.updateUser(),
                  child: onBoardingProvider.isLoading
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "Loading...",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer,
                                  ),
                            ),
                          ],
                        )
                      : Text(
                          "Let's Go!",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                        ),
                ),
              ],
            ),
          const SizedBox(height: 16),
        ],
        ),
      ),
      ),
    );
  }
}

List<Widget> _buildFoodTypeRadioButtons(BuildContext context, String? selectedValue) {
  return [
    _buildFoodTypeRadioButton(context, "Everything", selectedValue),
    _buildFoodTypeRadioButton(context, "Vegetarian", selectedValue),
    _buildFoodTypeRadioButton(context, "Vegan", selectedValue),
    _buildFoodTypeRadioButton(context, "Halal", selectedValue),
  ];
}

Widget _buildFoodTypeRadioButton(BuildContext context, String value, String? selectedValue) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: RadioListTile<String>(
      title: Text(value),
      value: value.toLowerCase(),
    ),
  );
}

  // void _submitPreferences() {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final allergies =
  //       _allergyController.text.split(',').map((e) => e.trim()).toList();

  //   userProvider.updateUserAllergies(allergies);
  //   userProvider.updateUserDietary(_selectedFoodType);

  //   Navigator.pop(context);
  //   // widget.onPreferencesUpdated();
  // }