import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';

class HostelL extends StatelessWidget {
  const HostelL({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('Hostel L'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'No of users :',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '760',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .006,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'KPLC Charge per kwh :',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Ksh.13.74',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
