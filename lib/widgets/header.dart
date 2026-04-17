import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/'),
              child: Text(
                'NASspire',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Row(
            children: [
              _HeaderLink(title: 'Home', path: '/'),
              const SizedBox(width: 24),
              _HeaderLink(title: 'Trainings', path: '/trainings'),
              const SizedBox(width: 24),
              _HeaderLink(title: 'Consulting', path: '/consulting'),
              const SizedBox(width: 24),
              _HeaderLink(title: 'About', path: '/about'),
              const SizedBox(width: 24),
              _HeaderLink(title: 'Contact', path: '/contact'),
              const SizedBox(width: 24),
              ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                child: const Text('Dashboard'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderLink extends StatelessWidget {
  final String title;
  final String path;

  const _HeaderLink({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();
    final bool isActive = (path == '/') ? currentRoute == '/' : currentRoute.startsWith(path);

    return TextButton(
      onPressed: () => context.go(path),
      style: TextButton.styleFrom(
        foregroundColor: isActive 
            ? Theme.of(context).colorScheme.primary 
            : Colors.grey.shade600,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.w600, 
          fontSize: 16,
        ),
      ),
    );
  }
}
