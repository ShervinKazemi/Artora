import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StoryCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> titles;

  const StoryCarousel({super.key, required this.images, required this.titles});

  @override
  StoryCarouselState createState() => StoryCarouselState();
}

class StoryCarouselState extends State<StoryCarousel> {
  int _currentIndex = 0;
  late Timer _timer;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < widget.images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _carouselController.animateToPage(_currentIndex);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty || widget.titles.isEmpty) {
      return const Center(
        child: Text(
          'No stories available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.85,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items:
                widget.images.map((imageUrl) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(imageUrl, fit: BoxFit.cover),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.75),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              widget.titles[_currentIndex],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
