import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});
  static const String routeName = 'contact-us';
  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String subject = '';
  String message = '';

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // You can send this data to Firebase, email, or API here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Message sent!')));

      // Reset fields
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "We’d love to hear from you!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your name'
                            : null,
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),

              // Subject
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter a subject'
                            : null,
                onSaved: (value) => subject = value!,
              ),
              const SizedBox(height: 16),

              // Message
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your message'
                            : null,
                onSaved: (value) => message = value!,
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: submitForm,
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: Text(
                    "Send Message",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
