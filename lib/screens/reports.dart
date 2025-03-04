import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

import 'package:smart_audit/widgets/smart_audit_drawer.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});
  @override
  State<Reports> createState() => _ReportsState();
}
class _ReportsState extends State<Reports> {
  bool _isLoading = true;
  String _selectedTimeframe = 'Daily';
  final List<String> _timeframes = ['Daily', 'Weekly', 'Monthly'];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  List<Map<String, dynamic>> getChartData() {
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
    Map<String, Map<String, dynamic>> consolidatedDevices = {};
    for (var device in devices) {
      String name = device['name'];
      double dailyConsumption = double.parse(
          device['energyConsumedPerDay'].toString().replaceAll(' kWh', ''));
      if (consolidatedDevices.containsKey(name)) {
        consolidatedDevices[name]!['value'] += dailyConsumption;
      } else {
        consolidatedDevices[name] = {
          'name': name,
          'value': dailyConsumption,
          'icon': device['icon'],
        };
      }
    }

    for (var device in devices2) {
      String name = device['name'];
      double dailyConsumption = double.parse(
          device['energyConsumedPerDay'].toString().replaceAll(' kWh', ''));

      if (consolidatedDevices.containsKey(name)) {
        consolidatedDevices[name]!['value'] += dailyConsumption;
      } else {
        consolidatedDevices[name] = {
          'name': name,
          'value': dailyConsumption,
          'icon': device['icon'],
        };
      }
    }
    List<Map<String, dynamic>> chartData =
        consolidatedDevices.values.map((device) {
      double value = device['value'];
      switch (_selectedTimeframe) {
        case 'Weekly':
          value *= 7;
          break;
        case 'Monthly':
          value *= 30;
          break;
        default:
          break;
      }

      return {
        'name': device['name'],
        'value': value,
        'icon': device['icon'],
      };
    }).toList();
    chartData
        .sort((a, b) => (b['value'] as double).compareTo(a['value'] as double));

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    final chartData = getChartData();
    final double totalConsumption =
        chartData.fold(0, (sum, item) => sum + (item['value'] as double));
    final List<Color> colorList = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.amber,
      Colors.cyan,
    ];

    return Scaffold(
      drawer: const SmartAuditDrawer(),
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedTimeframe,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: _timeframes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _isLoading = true;
                      _selectedTimeframe = newValue!;
                      Timer(const Duration(seconds: 3), () {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "$_selectedTimeframe Energy Consumption: ${totalConsumption.toStringAsFixed(2)} kWh",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                              sections:
                                  List.generate(chartData.length, (index) {
                                return PieChartSectionData(
                                  color: colorList[index % colorList.length],
                                  value: chartData[index]['value'],
                                  title:
                                      "${((chartData[index]['value'] / totalConsumption) * 100).toStringAsFixed(1)}%",
                                  radius: 100,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),

                        // Legend
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: Column(
                              children:
                                  List.generate(chartData.length, (index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color:
                                            colorList[index % colorList.length],
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                          chartData[index]['icon'] as IconData),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(chartData[index]['name']),
                                      ),
                                      Text(
                                        "${chartData[index]['value'].toStringAsFixed(2)} kWh",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
