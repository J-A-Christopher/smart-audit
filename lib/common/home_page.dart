import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';

class SmartAuditHomePage extends StatelessWidget {
  const SmartAuditHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('Smart Audit'),
      ),
    );
  }
}
