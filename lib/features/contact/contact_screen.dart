import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get in Touch',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Whether you have questions about our courses, need counseling guidance, or just want to say hello, we are here for you.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.6),
                            ),
                            const SizedBox(height: 48),
                            _ContactInfo(icon: Icons.email, title: 'Email', detail: 'contact@nasspire.edu.pk'),
                            const SizedBox(height: 24),
                            _ContactInfo(icon: Icons.location_on, title: 'Location', detail: 'Sukkur, Sindh, Pakistan'),
                            const SizedBox(height: 24),
                            _ContactInfo(icon: Icons.phone, title: 'Phone', detail: '+92 300 0000000'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Send a Message', style: Theme.of(context).textTheme.displayMedium),
                                  const SizedBox(height: 24),
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                                    validator: (val) => val == null || val.isEmpty ? 'Please enter your name' : null,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) return 'Please enter your email';
                                      if (!val.contains('@')) return 'Please enter a valid email';
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _messageController,
                                    maxLines: 5,
                                    decoration: const InputDecoration(labelText: 'Message', border: OutlineInputBorder()),
                                    validator: (val) => val == null || val.isEmpty ? 'Please enter your message' : null,
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _submit,
                                      child: const Text('Send Message'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _ContactInfo({required this.icon, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(detail, style: const TextStyle(color: Colors.black54, fontSize: 16)),
          ],
        )
      ],
    );
  }
}
