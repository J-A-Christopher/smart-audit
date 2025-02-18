import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: const Text('About page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: SfPdfViewer.asset(
                'assets/documents/ABOUT.pdf',
                canShowScrollHead: true,
                enableDoubleTapZooming: true,
                pageSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class DocumentLoadingWidget extends StatelessWidget {
  const DocumentLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading document...'),
        ],
      ),
    );
  }
}
