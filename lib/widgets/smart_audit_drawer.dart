import 'package:flutter/material.dart';
import 'package:smart_audit/screens/about.dart';
import 'package:smart_audit/screens/ai_help.dart';
import 'package:smart_audit/screens/contact.dart';
import 'package:smart_audit/screens/hostel_k.dart';
import 'package:smart_audit/screens/hostel_l.dart';
import 'package:smart_audit/screens/reports.dart';

class SmartAuditDrawer extends StatelessWidget {
  const SmartAuditDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.gite,
                    size: 35,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Hostel K and L',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Hostel K'),
                // selected: true,
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HostelK())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Hostel L'),
                // selected: true,
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HostelL())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.assistant_sharp),
                title: Text('AI Help'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AIHelp())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.report),
                title: Text('Reports'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Reports())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Contact'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ContactPage())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.mediation),
                title: Text('About'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AboutPage())),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
