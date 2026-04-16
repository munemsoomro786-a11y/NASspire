import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/mock_data.dart';

class TestimonialSlider extends ConsumerStatefulWidget {
  const TestimonialSlider({super.key});

  @override
  ConsumerState<TestimonialSlider> createState() => _TestimonialSliderState();
}

class _TestimonialSliderState extends ConsumerState<TestimonialSlider> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testimonials = ref.watch(testimonialsProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                'Student Success Stories',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: testimonials.length,
                        itemBuilder: (context, index) {
                          final t = testimonials[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.format_quote, size: 48, color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                                    const SizedBox(height: 16),
                                    Text(
                                      '"${t.feedback}"',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(t.avatarUrl),
                                          radius: 24,
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          t.name,
                                          style: Theme.of(context).textTheme.titleLarge,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
