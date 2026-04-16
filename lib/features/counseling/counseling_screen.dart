import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../data/mock_data.dart';

class CounselingScreen extends ConsumerWidget {
  const CounselingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(counselingProvider);

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Counseling Services',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Guidance for your academic and professional journey.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 32),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.people, size: 40, color: Theme.of(context).colorScheme.primary),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(service.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22)),
                                    const SizedBox(height: 8),
                                    Text(service.description, style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 32),
                              Column(
                                children: [
                                  Text(
                                    '\$${service.price}',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      ref.read(bookedCounselingProvider.notifier).book(service);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Booked ${service.title}!')),
                                      );
                                    },
                                    child: const Text('Book Now'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
