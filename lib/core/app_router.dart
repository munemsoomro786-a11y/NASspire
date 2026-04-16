import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/courses/courses_screen.dart';
import '../features/counseling/counseling_screen.dart';
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
      path: '/courses',
      builder: (context, state) => const CoursesScreen(),
    ),
    GoRoute(
      path: '/counseling',
      builder: (context, state) => const CounselingScreen(),
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
