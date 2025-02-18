import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/device_list.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';

class HostelK extends StatefulWidget {
  const HostelK({super.key});

  @override
  State<HostelK> createState() => _HostelKState();
}

class _HostelKState extends State<HostelK> {
  final List<Map<String, dynamic>> devices = [
    {
      'icon': Icons.headphones,
      'name': 'Sub-woofer',
      'rating': '60W',
      'hours': '3'
    },
    {'icon': Icons.phone, 'name': 'Phone', 'rating': '5W', 'hours': '3'},
    {'icon': Icons.computer, 'name': 'Laptop', 'rating': '65W', 'hours': '8'},
    {
      'icon': Icons.heat_pump,
      'name': 'Heater',
      'rating': '1200W',
      'hours': '1/2'
    },
    {
      'icon': Icons.local_cafe,
      'name': 'Electric Kettle',
      'rating': '2200W',
      'hours': '1/3'
    },
    {'icon': Icons.iron, 'name': 'Iron Box', 'rating': '1100W', 'hours': '1/4'},
    {'icon': Icons.compress, 'name': 'Coil', 'rating': '1700W', 'hours': '1'},
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('Hostel K'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                height: size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/pic.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .006,
              ),
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
              ),
              SizedBox(
                height: size.height * .006,
              ),
              DevicesList(devices: devices)
            ],
          ),
        ),
      ),
    );
  }
}
