import 'package:flutter/material.dart';
import 'package:jejom/utils/theme/app_theme.dart';
import 'package:jejom/modules/user/trip/components/get_photo_url.dart';

class BuildCarousel extends StatefulWidget {
  final List<String> photos;

  const BuildCarousel({
    super.key,
    required this.photos,
  });

  @override
  State<BuildCarousel> createState() => _BuildCarouselState();
}

class _BuildCarouselState extends State<BuildCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.photos.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text("No images available"),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingMedium),
      child: Column(
        children: [
          // Image carousel
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.photos.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildImage(widget.photos[index]);
                },
              ),
            ),
          ),
          
          // Page indicator dots
          if (widget.photos.length > 1)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.photos.length,
                  (index) => _buildDot(index),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index 
            ? Colors.black 
            : Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget _buildImage(String photo) {
    return Image.network(
      getPhotoUrl(photo),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
        );
      },
    );
  }
}
