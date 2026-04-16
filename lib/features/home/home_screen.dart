import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_snippet.dart';
import 'widgets/services_overview.dart';
import 'widgets/why_choose_us.dart';
import 'widgets/testimonial_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            AboutSnippet(),
            ServicesOverview(),
            WhyChooseUs(),
            TestimonialSlider(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
