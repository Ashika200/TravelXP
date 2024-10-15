import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark =
      ValueNotifier<bool>(false); // Light mode as default

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _dark,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            appBar: AppBar(
              title: Text('Travel XP'),
              centerTitle: true, // Center the title in the app bar
              leading: Switch(
                value: _dark.value,
                onChanged: (value) {
                  _dark.value = value;
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Handle profile icon tap
                    print("Profile Icon Tapped");
                  },
                ),
              ],
            ),
            body: Center(
              child: Container(
                // Set width to 50% of the screen
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Current Location...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Homepage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildOption(context, 'TRAVEL', Icons.directions_car, Colors.blue),
        _buildOption(context, 'FOOD', Icons.fastfood, Colors.green),
        _buildOption(context, 'ATM', Icons.atm, Colors.red),
        _buildOption(context, 'HOSPITAL', Icons.local_hospital, Colors.orange),
      ],
    );
  }

  Widget _buildOption(
      BuildContext context, String label, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // Handle icon tap for the specific option
        print('$label tapped');
        // You can navigate to different pages or perform actions here
      },
      splashColor: color.withOpacity(0.3), // Visual feedback for tapping
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2), // Translucent background color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
