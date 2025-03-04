import 'package:flutter/material.dart';
import 'package:smart_audit/widgets/smart_audit_drawer.dart';

import 'package:smart_audit/widgets/device_list.dart';
import 'package:smart_audit/widgets/washroom_corridor.dart';

class HostelL extends StatefulWidget {
  const HostelL({super.key});

  @override
  State<HostelL> createState() => _HostelLState();
}

class _HostelLState extends State<HostelL> {
  final List<Map<String, dynamic>> devices = [
    {
      'icon': Icons.headphones,
      'name': 'Sub-woofer',
      'rating': '60W',
      'hours': '3',
      'energyConsumed': '0.18 kWh',
      'users': '190',
      'energyConsumedPerDay': '34 kWh'
    },
    {
      'icon': Icons.phone,
      'name': 'Phone',
      'rating': '5W',
      'hours': '3',
      'energyConsumed': '0.015 kWh',
      'users': '773',
      'energyConsumedPerDay': '24 kWh'
    },
    {
      'icon': Icons.computer,
      'name': 'Laptop',
      'rating': '65W',
      'hours': '8',
      'energyConsumed': '0.52 kWh',
      'users': '182',
      'energyConsumedPerDay': '95 kWh'
    },
    {
      'icon': Icons.heat_pump,
      'name': 'Heater',
      'rating': '1200W',
      'hours': '1/2',
      'energyConsumed': '0.6 kWh',
      'users': '190',
      'energyConsumedPerDay': '114 kWh'
    },
    {
      'icon': Icons.local_cafe,
      'name': 'Electric Kettle',
      'rating': '2200W',
      'hours': '1/3',
      'energyConsumed': '0.733 kWh',
      'users': '259',
      'energyConsumedPerDay': '190 kWh'
    },
    {
      'icon': Icons.iron,
      'name': 'Iron Box',
      'rating': '1100W',
      'hours': '1/4',
      'energyConsumed': '0.275 kWh',
      'users': '87',
      'energyConsumedPerDay': '24 kWh'
    },
    {
      'icon': Icons.compress,
      'name': 'Coil',
      'rating': '1700W',
      'hours': '1',
      'energyConsumed': '1.7 kWh',
      'users': '18',
      'energyConsumedPerDay': '30 kWh'
    },
    {
      'icon': Icons.light,
      'name': '4ft Flourescent Tubes',
      'rating': '36W',
      'hours': '10',
      'Quantity': '372',
      'energyConsumedPerDay': '134 kWh'
    },
    {
      'icon': Icons.light,
      'name': '5ft Flourescent Tubes',
      'rating': '58W',
      'hours': '10',
      'Quantity': '137',
      'energyConsumedPerDay': '80 kWh'
    },
    {
      'icon': Icons.light,
      'name': '2ft Flourescent Tubes',
      'rating': '18W',
      'hours': '10',
      'Quantity': '311',
      'energyConsumedPerDay': '56 kWh'
    },
  ];

  final List<Map<String, dynamic>> devices2 = [
    {
      'icon': Icons.light,
      'name': '4ft Flourescent Tubes',
      'rating': '36W',
      'hours': '24',
      'Quantity': '34',
      'energyConsumedPerDay': '30 kWh'
    },
    {
      'icon': Icons.light,
      'name': '5ft Flourescent Tubes',
      'rating': '58W',
      'hours': '24',
      'Quantity': '20',
      'energyConsumedPerDay': '28 kWh'
    },
    {
      'icon': Icons.light,
      'name': '2ft Flourescent Tubes',
      'rating': '18W',
      'hours': '24',
      'Quantity': '8',
      'energyConsumedPerDay': '4 kWh'
    },
  ];
  String selectedItems = 'rooms';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SmartAuditDrawer(),
      appBar: AppBar(
        title: Text('Hostel L'),
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
                height: size.height * .01,
              ),
              Center(
                  child: Text(
                'Key Metrics Hostel L',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: size.height * .01,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    children: [
                      _buildStatsRow(
                        context,
                        'No of students:',
                        '760',
                        Icons.people,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'No of students Per Room:',
                        '2',
                        Icons.person,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'Total Number of Rooms:',
                        '380',
                        Icons.door_front_door,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'Energy Consumed per day:',
                        '511 kWh',
                        Icons.flash_on,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'Energy Consumed per month:',
                        '15,330 kWh',
                        Icons.calendar_month,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'KPLC Charge per kwh:',
                        'Ksh.13.74',
                        Icons.payments,
                      ),
                      Divider(height: 20, thickness: 1),
                      _buildStatsRow(
                        context,
                        'Bill per month:',
                        'Ksh.322,752',
                        Icons.payments,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .006,
              ),
              SizedBox(
                height: size.height * .006,
              ),
              Center(
                child: DropdownButton(
                    value: selectedItems,
                    items: [
                      DropdownMenuItem(
                          value: 'rooms',
                          child: Text('Individual Room Consumption')),
                      DropdownMenuItem(
                          value: 'washroom',
                          child: Text('Corridor and Washroom Consumption')),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedItems = value!;
                      });
                    }),
              ),
              selectedItems == 'rooms'
                  ? DevicesList(devices: devices)
                  : WashroomCorridor(devices: devices2)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
