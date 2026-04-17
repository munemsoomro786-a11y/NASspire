import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      Text(
                        'About NASspire',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Bridging aspirations and opportunities through unwavering commitment to quality and merit.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/nisar.jpg',
                            fit: BoxFit.cover,
                            height: 450,
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inspired by Nisar Ahmed Siddiqui',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'NASspire is rooted in the philosophy of providing quality education that relies solely on merit. Our platform brings the ethos of a renowned educator into the digital realm, expanding access to rigorous training, personalized counseling, and a community dedicated to leadership and success.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Icon(Icons.visibility, size: 60, color: Theme.of(context).colorScheme.primary),
                                const SizedBox(height: 24),
                                Text('Our Vision', style: Theme.of(context).textTheme.displayMedium),
                                const SizedBox(height: 16),
                                Text(
                                  'To create a global platform that democratizes top-tier education, equipping every driven individual with the tools they need to achieve greatness, irrespective of their background.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Icon(Icons.rocket_launch, size: 60, color: Theme.of(context).colorScheme.primary),
                                const SizedBox(height: 24),
                                Text('Our Mission', style: Theme.of(context).textTheme.displayMedium),
                                const SizedBox(height: 16),
                                Text(
                                  'To deliver meticulously crafted courses and empathetic counseling that instills critical thinking, professional prowess, and a relentless pursuit of excellence in our learners.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
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
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
