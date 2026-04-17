import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/trainings/trainings_screen.dart';
import '../features/consulting/consulting_screen.dart';
import '../features/about/about_screen.dart';
import '../features/contact/contact_screen.dart';
import '../features/dashboard/dashboard_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/trainings',
      builder: (context, state) => const TrainingsScreen(),
    ),
    GoRoute(
      path: '/consulting',
      builder: (context, state) => const ConsultingScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
