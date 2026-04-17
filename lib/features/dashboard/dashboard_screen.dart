import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/mock_data.dart';
import '../../widgets/header.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (_selectedIndex) {
      case 0:
        content = const _MyCoursesTab();
        break;
      case 1:
        content = const _MyConsultingsTab();
        break;
      case 2:
        content = const _CertificatesTab();
        break;
      case 3:
        content = const _ProfileTab();
        break;
      default:
        content = const _MyCoursesTab();
    }

    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: const Header(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isWide)
            Container(
              width: 250,
              color: Theme.of(context).colorScheme.surface,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                children: [
                  _SidebarItem(
                    icon: Icons.school,
                    title: 'My Trainings',
                    isSelected: _selectedIndex == 0,
                    onTap: () => setState(() => _selectedIndex = 0),
                  ),
                  _SidebarItem(
                    icon: Icons.psychology,
                    title: 'My Consultings',
                    isSelected: _selectedIndex == 1,
                    onTap: () => setState(() => _selectedIndex = 1),
                  ),
                  _SidebarItem(
                    icon: Icons.workspace_premium,
                    title: 'Certificates',
                    isSelected: _selectedIndex == 2,
                    onTap: () => setState(() => _selectedIndex = 2),
                  ),
                  _SidebarItem(
                    icon: Icons.person,
                    title: 'Profile Settings',
                    isSelected: _selectedIndex == 3,
                    onTap: () => setState(() => _selectedIndex = 3),
                  ),
                  const Divider(height: 60),
                  _SidebarItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    isSelected: false,
                    onTap: () => context.go('/'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: content,
            ),
          ),
        ],
      ),
      drawer: isWide
          ? null
          : Drawer(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                children: [
                  _SidebarItem(
                    icon: Icons.school,
                    title: 'My Trainings',
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      setState(() => _selectedIndex = 0);
                      Navigator.pop(context);
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.psychology,
                    title: 'My Consultings',
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      setState(() => _selectedIndex = 1);
                      Navigator.pop(context);
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.workspace_premium,
                    title: 'Certificates',
                    isSelected: _selectedIndex == 2,
                    onTap: () {
                      setState(() => _selectedIndex = 2);
                      Navigator.pop(context);
                    },
                  ),
                  _SidebarItem(
                    icon: Icons.person,
                    title: 'Profile Settings',
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      setState(() => _selectedIndex = 3);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    );
  }
}

class _MyCoursesTab extends ConsumerWidget {
  const _MyCoursesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enrolledCourses = ref.watch(enrolledCoursesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Trainings', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 32),
        if (enrolledCourses.isEmpty)
          const Text('You have not enrolled in any trainings yet.')
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: enrolledCourses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final course = enrolledCourses[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          course.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course.title, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            const Text('Progress: 0% completed'),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 0.0,
                              backgroundColor: Colors.grey.shade200,
                              color: Theme.of(context).colorScheme.primary,
                              minHeight: 8,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Start Learning'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _MyConsultingsTab extends ConsumerWidget {
  const _MyConsultingsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookedServices = ref.watch(bookedConsultingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Consultings', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 32),
        if (bookedServices.isEmpty)
          const Text('You have not booked any consulting sessions yet.')
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bookedServices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final service = bookedServices[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
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
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(service.title, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            const Text('Status: Confirmed', style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Join Session'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _CertificatesTab extends StatelessWidget {
  const _CertificatesTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Certificates', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 0.8,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                      child: Icon(Icons.workspace_premium, size: 80, color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Course $index Certificate', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Download PDF'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Profile Settings', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 32),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=user'),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Change Avatar'),
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 24),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 24),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile Updated')),
                        );
                      },
                      child: const Text('Save Changes'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
