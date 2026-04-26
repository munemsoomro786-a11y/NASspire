import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
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
  bool _isSubmitting = false;

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      try {
        final response = await http.post(
          Uri.parse('https://formsubmit.co/ajax/nasspire@gmail.com'),
          headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
          body: jsonEncode({
            'name': name,
            'email': email,
            'message': message,
            '_replyto': email,
            '_subject': 'New NASspire Contact Form Submission'
          }),
        );

        if (mounted) {
          setState(() => _isSubmitting = false);
          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Message sent successfully! We will get back to you soon.'), backgroundColor: Colors.green),
            );
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
          } else {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to send message. Please try again.'), backgroundColor: Colors.red),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isSubmitting = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Network error. Please check your connection.'), backgroundColor: Colors.red),
          );
        }
      }
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
                            _ContactInfo(
                              icon: Icons.email, 
                              title: 'Email', 
                              detail: 'nasspire@gmail.com',
                              onTap: () async {
                                final Uri emailUri = Uri.parse('https://mail.google.com/mail/?view=cm&fs=1&to=nasspire@gmail.com');
                                if (await canLaunchUrl(emailUri)) {
                                  await launchUrl(emailUri);
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            _ContactInfo(
                              icon: Icons.location_on, 
                              title: 'Location', 
                              detail: 'Sukkur, Sindh, Pakistan',
                              onTap: () async {
                                final Uri mapsUri = Uri.parse('https://maps.google.com/?q=Sukkur,Sindh,Pakistan');
                                if (await canLaunchUrl(mapsUri)) {
                                  await launchUrl(mapsUri);
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            _ContactInfo(
                              icon: Icons.chat, 
                              title: 'WhatsApp', 
                              detail: '+92 311 3418134',
                              onTap: () async {
                                final Uri waUri = Uri.parse('https://wa.me/923113418134');
                                if (await canLaunchUrl(waUri)) {
                                  await launchUrl(waUri);
                                }
                              },
                            ),
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
                              child: AutofillGroup(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Send a Message', style: Theme.of(context).textTheme.displayMedium),
                                    const SizedBox(height: 24),
                                    TextFormField(
                                      controller: _nameController,
                                      autofillHints: const [AutofillHints.name],
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                                      validator: (val) => val == null || val.isEmpty ? 'Please enter your name' : null,
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: _emailController,
                                      autofillHints: const [AutofillHints.email],
                                      keyboardType: TextInputType.emailAddress,
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
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: _isSubmitting ? null : _submit,
                                        child: _isSubmitting
                                            ? const SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 2,
                                                ),
                                              )
                                            : const Text('Send Message', style: TextStyle(fontSize: 16)),
                                      ),
                                    )
                                  ],
                                ),
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
  final VoidCallback? onTap;

  const _ContactInfo({required this.icon, required this.title, required this.detail, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
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
                Text(
                  detail, 
                  style: TextStyle(
                    color: onTap != null ? Theme.of(context).colorScheme.primary : Colors.black54, 
                    fontSize: 16,
                    decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
