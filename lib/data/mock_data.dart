import '../models/course.dart';
import '../models/consulting_service.dart';
import '../models/testimonial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockData {
  static const List<Course> courses = [
    // Skill-Based Courses
    Course(
      id: 'c1',
      title: 'Communication and Soft Skills',
      description: 'Enhance your workplace communication, teamwork, and overall professional soft skills.',
      duration: '3 Weeks',
      price: 3500.00,
      type: 'Skill Based Course',
      imageUrl: 'https://images.unsplash.com/photo-1573164713714-d95e436ab8d6?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c2',
      title: 'CV Writing and Interview Preparation',
      description: 'Master the art of crafting a winning CV and ace your job interviews.',
      duration: '2 Weeks',
      price: 2500.00,
      type: 'Skill Based Course',
      imageUrl: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'c3',
      title: 'Digital Skills (MS Office+ Freelancing basics)',
      description: 'Gain essential digital literacy and kickstart an online freelancing career.',
      duration: '4 Weeks',
      price: 4000.00,
      type: 'Skill Based Course',
      imageUrl: 'https://images.unsplash.com/photo-1542744094-3a31f272c490?auto=format&fit=crop&w=400&q=80',
    ),

    // Workshops and Seminars
    Course(
      id: 'w1',
      title: 'Career Awareness Session',
      description: 'Guidance and insight into finding and following the right career trajectory.',
      duration: '1 Day',
      price: 1000.00,
      type: 'Workshop',
      pricingUnit: '/Participant',
      imageUrl: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'w2',
      title: 'Industry Trend Seminar',
      description: 'Keep up with the latest advancements moving the industry forward today.',
      duration: '1 Day',
      price: 1500.00,
      type: 'Seminar',
      pricingUnit: '/Participant',
      imageUrl: 'https://images.unsplash.com/photo-1554200876-56c2f25224fa?auto=format&fit=crop&w=400&q=80',
    ),
    Course(
      id: 'w3',
      title: 'Motivational and Growth Workshop',
      description: 'Build robust habits, discipline, and cultivate a growth mindset.',
      duration: '1 Day',
      price: 2000.00,
      type: 'Workshop',
      pricingUnit: '/Participant',
      imageUrl: 'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?auto=format&fit=crop&w=400&q=80',
    ),
  ];

  static const List<ConsultingService> services = [
    ConsultingService(
      id: 'cons1',
      title: 'Career Counselling Session',
      type: '1-on-1 Session',
      price: 2000.00,
      category: 'Student Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1573164713714-d95e436ab8d6?auto=format&fit=crop&w=400&q=80',
      description: 'Find your perfect career path through dedicated one-on-one professional guidance.',
    ),
    ConsultingService(
      id: 'cons2',
      title: 'Subject & University Selection',
      type: 'Guidance Session',
      price: 1500.00,
      category: 'Student Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?auto=format&fit=crop&w=400&q=80',
      description: 'Navigate the complexities of college admissions and academic majors with ease.',
    ),
    ConsultingService(
      id: 'cons3',
      title: 'Personalized Career Roadmap',
      type: 'Customized Plan',
      price: 2500.00,
      category: 'Student Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1542744094-3a31f272c490?auto=format&fit=crop&w=400&q=80',
      description: 'A comprehensive step-by-step strategy for long term professional success.',
    ),
    ConsultingService(
      id: 'cons4',
      title: 'Online Counselling Session',
      type: 'Virtual Session',
      price: 1500.00,
      category: 'Student Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=400&q=80',
      description: 'Convenient virtual advising from the comfort of your own home.',
    ),
    ConsultingService(
      id: 'cons5',
      title: 'Skill-Based Learning Plan',
      type: 'Customized Plan',
      price: 2000.00,
      category: 'Student Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1554200876-56c2f25224fa?auto=format&fit=crop&w=400&q=80',
      description: 'Target specific soft and technical skills required to land your dream job.',
    ),
    ConsultingService(
      id: 'corp1',
      title: 'Employee Skill Development',
      type: 'Training Session',
      price: 20000.00,
      pricingUnit: ' / session',
      category: 'Corporate Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?auto=format&fit=crop&w=400&q=80',
      description: 'Empower your workforce with modern tools and methodologies to increase efficiency.',
    ),
    ConsultingService(
      id: 'corp2',
      title: 'Leadership & Teamwork Training',
      type: 'Training Session',
      price: 25000.00,
      pricingUnit: ' / session',
      category: 'Corporate Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?auto=format&fit=crop&w=400&q=80',
      description: 'Cultivate strong leadership and cohesive teamwork dynamics within your organization.',
    ),
    ConsultingService(
      id: 'corp3',
      title: 'Customized Corporate Workshop',
      type: 'Workshop',
      price: 30000.00,
      pricingUnit: ' / workshop',
      category: 'Corporate Consulting',
      imageUrl: 'https://images.unsplash.com/photo-1573164574572-cb89e39749b4?auto=format&fit=crop&w=400&q=80',
      description: 'Tailor-made seminars addressing specific operational challenges in your company.',
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
final consultingProvider = Provider<List<ConsultingService>>((ref) => MockData.services);
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

class BookedConsultingNotifier extends Notifier<List<ConsultingService>> {
  @override
  List<ConsultingService> build() => [];

  void book(ConsultingService service) {
    if (!state.any((s) => s.id == service.id)) {
      state = [...state, service];
    }
  }
}

final bookedConsultingProvider = NotifierProvider<BookedConsultingNotifier, List<ConsultingService>>(() {
  return BookedConsultingNotifier();
});
