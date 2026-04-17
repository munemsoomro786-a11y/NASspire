import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          image: const NetworkImage('https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Center(
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
    );
  }
}
