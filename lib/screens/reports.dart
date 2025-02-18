import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Center(
        child: Text('Report data goes here.'),
      ),
    );
  }
}
