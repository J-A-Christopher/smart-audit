import 'package:flutter/material.dart';

class WashroomCorridor extends StatelessWidget {
  final List<Map<String, dynamic>> devices;

  const WashroomCorridor({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: devices.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final device = devices[index];
        return DeviceCard(device: device, index: index);
      },
    );
  }
}

class DeviceCard extends StatelessWidget {
  final Map<String, dynamic> device;
  final int index;

  const DeviceCard({
    super.key,
    required this.device,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = _getGradientColors(device['name'] as String);
final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      device['icon'] as IconData,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Middle section with device details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device['name'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Flexible(
                            child: _buildDetailChip(
                              device.containsKey('Quantity')
                                  ? Icons.numbers
                                  : Icons.electric_bolt,
                              device.containsKey('Quantity')
                                  ? 'Qty: ${device['Quantity']}'
                                  : (device['energyConsumed'] as String),
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildDetailChip(
                            Icons.calendar_today,
                            device['energyConsumedPerDay'] as String,
                            isSmall: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildDetailChip(
                            Icons.flash_on,
                            device['rating'] as String,
                            isSmall: true,
                          ),
                          const SizedBox(width: 8),
                          _buildDetailChip(
                            Icons.access_time,
                            '${device['hours']} hrs',
                            isSmall: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Right side with users count in a badge, only if users property exists
                if (device.containsKey('users'))
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              device['users'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                    'Total Consumption Per day :',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '62 kWh',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20),
                  )
                ],
              ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String label, {bool isSmall = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 10,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              icon,
              size: isSmall ? 14 : 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmall ? 12 : 14,
                fontWeight: isSmall ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors(String deviceName) {
    // Return different gradients based on device type or name
    final deviceNameLower = deviceName.toLowerCase();

    if (deviceNameLower.contains('led') ||
        deviceNameLower.contains('light') ||
        deviceNameLower.contains('flourescent')) {
      return [
        const Color(0xFFFFA000),
        const Color(0xFFFF6D00)
      ]; // Amber to orange
    } else if (deviceNameLower.contains('kettle') ||
        deviceNameLower.contains('iron')) {
      return [const Color(0xFFE53935), const Color(0xFFB71C1C)]; // Red gradient
    } else if (deviceNameLower.contains('router') ||
        deviceNameLower.contains('wifi')) {
      return [
        const Color(0xFF1E88E5),
        const Color(0xFF0D47A1)
      ]; // Blue gradient
    } else if (deviceNameLower.contains('speaker') ||
        deviceNameLower.contains('music') ||
        deviceNameLower.contains('sub-woofer')) {
      return [
        const Color(0xFF7B1FA2),
        const Color(0xFF4A148C)
      ]; // Purple gradient
    } else if (deviceNameLower.contains('phone') ||
        deviceNameLower.contains('laptop')) {
      return [
        const Color(0xFF00897B),
        const Color(0xFF004D40)
      ]; // Teal gradient
    } else if (deviceNameLower.contains('heater') ||
        deviceNameLower.contains('coil')) {
      return [
        const Color(0xFFFF5722),
        const Color(0xFFBF360C)
      ]; // Deep orange gradient
    } else {
      // Default gradient
      return [
        const Color(0xFF546E7A),
        const Color(0xFF263238)
      ]; // Blue-grey gradient
    }
  }
}
