import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  Timer? _timer;

  final List<String> _backgroundImages = [
    'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1515162816999-a0c47dc192f7?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // The background slider
          PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              final imageIndex = index % _backgroundImages.length;
              return Image.network(
                _backgroundImages[imageIndex],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
              );
            },
          ),
          // Dark color overlay
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Empowering Minds,\nInspiring Futures',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'A legacy of excellence, guided by the vision of Nisar Ahmed Siddiqui.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go('/trainings'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
                      child: const Text('Explore Trainings', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(width: 24),
                    OutlinedButton(
                      onPressed: () => context.go('/consulting'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      child: const Text('Book Consulting'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
