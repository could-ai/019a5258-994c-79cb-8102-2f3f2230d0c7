import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Mechanical Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _selectedVehicle = 'None';

  void _selectVehicle(String vehicle) {
    setState(() {
      _selectedVehicle = vehicle;
    });
    // Placeholder for game logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car, Bike, and Train Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select a vehicle to start:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VehicleIcon(
                  icon: Icons.directions_car,
                  label: 'Car',
                  onTap: () => _selectVehicle('Car'),
                  isSelected: _selectedVehicle == 'Car',
                ),
                VehicleIcon(
                  icon: Icons.directions_bike,
                  label: 'Bike',
                  onTap: () => _selectVehicle('Bike'),
                  isSelected: _selectedVehicle == 'Bike',
                ),
                VehicleIcon(
                  icon: Icons.train,
                  label: 'Train',
                  onTap: () => _selectVehicle('Train'),
                  isSelected: _selectedVehicle == 'Train',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'You selected: $_selectedVehicle',
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const VehicleIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 60, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
