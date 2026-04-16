import '../models/course.dart';
import '../models/counseling_service.dart';
import '../models/testimonial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockData {
  static const List<Course> courses = [
    Course(
      id: 'c1',
      title: 'Advanced Web Development',
      description: 'Master modern frontend architectures with Flutter and React.',
      duration: '12 Weeks',
      price: 299.00,
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c2',
      title: 'Data Science & Machine Learning',
      description: 'Learn Python, Pandas, and build predictive models.',
      duration: '16 Weeks',
      price: 349.00,
      imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c3',
      title: 'Business Administration Fundamentals',
      description: 'Core concepts inspired by global business leaders.',
      duration: '8 Weeks',
      price: 199.00,
      imageUrl: 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c4',
      title: 'UI/UX Design Masterclass',
      description: 'Create stunning user interfaces with Figma and Material Design.',
      duration: '10 Weeks',
      price: 249.00,
      imageUrl: 'https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c5',
      title: 'Introduction to Artificial Intelligence',
      description: 'Understanding neural networks, natural language processing, and modern AI.',
      duration: '14 Weeks',
      price: 399.00,
      imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c6',
      title: 'Digital Marketing & SEO',
      description: 'Master online advertising, brand building, and growth hacking strategies.',
      duration: '6 Weeks',
      price: 149.00,
      imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c7',
      title: 'Financial Accounting',
      description: 'Learn the principles of bookkeeping, statements, and corporate finance.',
      duration: '8 Weeks',
      price: 199.00,
      imageUrl: 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c8',
      title: 'Mobile App Development with Flutter',
      description: 'Build native cross-platform apps from a single codebase seamlessly.',
      duration: '12 Weeks',
      price: 299.00,
      imageUrl: 'https://images.unsplash.com/photo-1617042375876-a13e36732a04?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c9',
      title: 'Introduction to Cybersecurity',
      description: 'Essential concepts to protect networks, data, and software against attacks.',
      duration: '10 Weeks',
      price: 249.00,
      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c10',
      title: 'Project Management Fundamentals',
      description: 'Agile methodologies, scrum principles, and effective leadership.',
      duration: '8 Weeks',
      price: 179.00,
      imageUrl: 'https://images.unsplash.com/photo-1531403009284-440f080d1e12?auto=format&fit=crop&w=400&q=80',
    ),
  ];

  static const List<CounselingService> services = [
    CounselingService(
      id: 's1',
      title: 'Career Counseling',
      description: 'One-on-one session to map out your career trajectory based on industry trends.',
      price: 50.00,
    ),
    CounselingService(
      id: 's2',
      title: 'Academic Advising',
      description: 'Guidance on course selection and educational planning for long-term success.',
      price: 40.00,
    ),
    CounselingService(
      id: 's3',
      title: 'Mental Wellness Coaching',
      description: 'Supportive sessions to manage academic stress and improve focus.',
      price: 60.00,
    ),
    CounselingService(
      id: 's4',
      title: 'Resume & Portfolio Review',
      description: 'Professional critique and enhancement of your CV and project portfolios.',
      price: 45.00,
    ),
    CounselingService(
      id: 's5',
      title: 'Financial Aid Consulting',
      description: 'Expert advice on securing scholarships, grants, and managing academic funding.',
      price: 35.00,
    ),
  ];

  static const List<Testimonial> testimonials = [
    Testimonial(
      id: 't1',
      name: 'Aisha Khan',
      feedback: 'NASspire transformed my perspective on what online learning could be. The quality is exceptional!',
      avatarUrl: 'https://i.pravatar.cc/150?u=aisha',
    ),
    Testimonial(
      id: 't2',
      name: 'Ali Raza',
      feedback: 'The counseling services were a game changer for my career path. I found clarity and direction.',
      avatarUrl: 'https://i.pravatar.cc/150?u=ali',
    ),
    Testimonial(
      id: 't3',
      name: 'Sarah Ahmed',
      feedback: 'Merit-based education was a core value here, and it shows in every course they deliver.',
      avatarUrl: 'https://i.pravatar.cc/150?u=sarah',
    ),
    Testimonial(
      id: 't4',
      name: 'Munem Soomro',
      feedback: 'NASspire completely altered my educational trajectory for the better. The detailed guidance and amazing courses set me up for true success.',
      avatarUrl: 'https://i.pravatar.cc/150?u=munem',
    ),
  ];
}

final coursesProvider = Provider<List<Course>>((ref) => MockData.courses);
final counselingProvider = Provider<List<CounselingService>>((ref) => MockData.services);
final testimonialsProvider = Provider<List<Testimonial>>((ref) => MockData.testimonials);

class EnrolledCoursesNotifier extends Notifier<List<Course>> {
  @override
  List<Course> build() => [];

  void enroll(Course course) {
    if (!state.any((c) => c.id == course.id)) {
      state = [...state, course];
    }
  }
}

final enrolledCoursesProvider = NotifierProvider<EnrolledCoursesNotifier, List<Course>>(() {
  return EnrolledCoursesNotifier();
});

class BookedCounselingNotifier extends Notifier<List<CounselingService>> {
  @override
  List<CounselingService> build() => [];

  void book(CounselingService service) {
    if (!state.any((s) => s.id == service.id)) {
      state = [...state, service];
    }
  }
}

final bookedCounselingProvider = NotifierProvider<BookedCounselingNotifier, List<CounselingService>>(() {
  return BookedCounselingNotifier();
});
