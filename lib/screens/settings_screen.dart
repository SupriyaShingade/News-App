import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedCategory = 'Technology';

  final List<String> _categories = [
    'Technology',
    'Health',
    'General',
    'Entertainment',
    'Sports',
    'Travel',
    'Business'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                
                _notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Enable Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Select News Category'),
            trailing: DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          ListTile(
            title: Text('Terms of Service'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to terms of service page
            },
          ),
          ListTile(
            title: Text('About Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to about us page
            },
          ),
        ],
      ),
    );
  }
}
