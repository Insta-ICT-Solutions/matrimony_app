import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:bright_weddings/Component/AppBar/header.dart'; // Import the header
import 'package:bright_weddings/chatLists/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(ChatListMobileApp());
}

class ChatListMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedMenuItem = '';

  void _onMenuItemClicked(String title) {
    setState(() {
      _selectedMenuItem = title;
    });

    if (title == 'Dashboard') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else if (title == 'User List') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Navigation to the same user list ChatListWeb file
      );
    }
    // Add navigation logic for other menu items if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header(), // Use the Header widget here
        toolbarHeight: 100, // Adjust height as needed
      ),
      drawer: Sidebar(
        selectedMenuItem: _selectedMenuItem,
        onMenuItemClicked: _onMenuItemClicked,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChatListContent(),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  final String selectedMenuItem;
  final Function(String) onMenuItemClicked;

  const Sidebar({
    required this.selectedMenuItem,
    required this.onMenuItemClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16.0), // Add space between the top of the drawer and the image
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: CachedNetworkImage(
                imageUrl:
                "https://simg.nicepng.com/png/small/88-883746_clip-art-freeuse-library-christian-marriage-clipart-wedding.png", // Sidebar image
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Start items below the image
                crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to full width
                children: <Widget>[
                  _SideMenuItem(
                    title: 'Dashboard',
                    isSelected: selectedMenuItem == 'Dashboard',
                    onTap: () => onMenuItemClicked('Dashboard'),
                  ),
                  _SideMenuItem(
                    title: 'Profile',
                    isSelected: selectedMenuItem == 'Profile',
                    onTap: () => onMenuItemClicked('Profile'),
                  ),
                  _SideMenuItem(
                    title: 'Interest',
                    isSelected: selectedMenuItem == 'Interest',
                    onTap: () => onMenuItemClicked('Interest'),
                  ),
                  _SideMenuItem(
                    title: 'User List',
                    isSelected: selectedMenuItem == 'User List',
                    onTap: () => onMenuItemClicked('User List'),
                  ),
                  _SideMenuItem(
                    title: 'Help',
                    isSelected: selectedMenuItem == 'Help',
                    onTap: () => onMenuItemClicked('Help'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListContent extends StatelessWidget {
  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Robert Brown',
    'Linda Williams',
    'James Miller',
    'Elizabeth Garcia',
    'David Wilson',
    'Barbara Martinez',
  ];

  String _generateRandomPhoneNumber() {
    final random = Random();
    final number = List<int>.generate(10, (_) => random.nextInt(10));
    return number.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'User List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final name = names[index];
              final avatarUrl =
                  'https://randomuser.me/api/portraits/men/${index + 1}.jpg'; // Sample avatar URL
              final phoneNumber = _generateRandomPhoneNumber(); // Generate a random 10-digit phone number
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: _ChatListItem(
                  name: name,
                  message: phoneNumber,
                  avatarUrl: avatarUrl,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(contactName: name),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SideMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SideMenuItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust padding for better spacing
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Adjust padding according to text size
          backgroundColor: isSelected ? Colors.blueAccent : Colors.grey[100], // Active item background color
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String avatarUrl;
  final VoidCallback onTap;

  const _ChatListItem({
    required this.name,
    required this.message,
    required this.avatarUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
            radius: 20.0, // Adjust avatar size for mobile
          ),
          const SizedBox(width: 12), // Adjust space between avatar and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16, // Adjust font size for name
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12, // Adjust font size for message
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
