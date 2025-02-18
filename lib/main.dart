import 'package:flutter/material.dart';
import 'package:smart_audit/screens/hostel_k.dart';
import 'package:smart_audit/themes/app_theme.dart';

void main() {
  runApp(SmartAuditApp());
}

class SmartAuditApp extends StatelessWidget {
  const SmartAuditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HostelK(),
    );
  }
}
