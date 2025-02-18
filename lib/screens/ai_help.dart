import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIHelp extends StatelessWidget {
  const AIHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('AI Assistant'),
      ),
      body:  LlmChatView(
        provider: GeminiProvider(
          model: GenerativeModel(
            model: 'gemini-1.5-flash',
            apiKey: '${dotenv.env['API_KEY']}',
          ),
        ),
      ),
    );
  }
}
