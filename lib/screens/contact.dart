import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  Future<void> _sendEmail() async {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'georgewagwa@gmail.com');

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email client';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _sendEmail,
              icon: const Icon(Icons.email),
              label: const Text('Contact Us'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Click the button above to send us an email',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
