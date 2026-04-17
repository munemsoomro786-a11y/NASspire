import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../data/mock_data.dart';

class TrainingsScreen extends ConsumerStatefulWidget {
  const TrainingsScreen({super.key});

  @override
  ConsumerState<TrainingsScreen> createState() => _TrainingsScreenState();
}

class _TrainingsScreenState extends ConsumerState<TrainingsScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(coursesProvider);
    final skillCourses = courses.where((c) => c.type == 'Skill Based Course').toList();
    final workshops = courses.where((c) => c.type == 'Workshop' || c.type == 'Seminar').toList();

    final displayedItems = _selectedTab == 0 ? skillCourses : workshops;

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
                      'Our Trainings',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 48),
                    ToggleButtons(
                      isSelected: [_selectedTab == 0, _selectedTab == 1],
                      onPressed: (index) {
                        setState(() => _selectedTab = index);
                      },
                      borderRadius: BorderRadius.circular(30),
                      fillColor: Theme.of(context).colorScheme.primary,
                      selectedColor: Colors.white,
                      color: Theme.of(context).colorScheme.primary,
                      constraints: const BoxConstraints(minHeight: 50, minWidth: 200),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text('Skill Based Courses', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text('Workshops & Seminars', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: displayedItems.length,
                    itemBuilder: (context, index) {
                      final course = displayedItems[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network(
                                course.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.title,
                                      style: Theme.of(context).textTheme.titleLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      course.description,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.timer, size: 16, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(course.duration, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                        Text(
                                          '${course.price.toStringAsFixed(0)} PKR${course.pricingUnit ?? ''}',
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ref.read(enrolledCoursesProvider.notifier).enroll(course);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Enrolled in ${course.title}!')),
                                          );
                                        },
                                        child: const Text('Enroll Now'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
