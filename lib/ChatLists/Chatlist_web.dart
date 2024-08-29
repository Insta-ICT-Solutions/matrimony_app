import 'package:bright_weddings/ChatLists/chatscreen.dart';
import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ChatListWeb());
}

class ChatListWeb extends StatelessWidget {
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
    }
    // Add navigation logic for other menu items if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(), //use header.dart
      body: Row(
        children: [
          // Sidebar
          Sidebar(
            selectedMenuItem: _selectedMenuItem,
            onMenuItemClicked: _onMenuItemClicked,
          ),
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChatListContent(),
            ),
          ),
        ],
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
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CachedNetworkImage(
            imageUrl:
            "https://www.thegreatindianshop.com/wp-content/uploads/2021/12/Cliparts-27-600x420.png",
            height: 150,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(height: 20),
          SideMenuItem(
            title: 'Dashboard',
            isSelected: selectedMenuItem == 'Dashboard',
            onTap: () => onMenuItemClicked('Dashboard'),
          ),
          SideMenuItem(
            title: 'Profile',
            isSelected: selectedMenuItem == 'Profile',
            onTap: () => onMenuItemClicked('Profile'),
          ),
          SideMenuItem(
            title: 'Interest',
            isSelected: selectedMenuItem == 'Interest',
            onTap: () => onMenuItemClicked('Interest'),
          ),
          SideMenuItem(
            title: 'Chat List',
            isSelected: selectedMenuItem == 'Chat List',
            onTap: () => onMenuItemClicked('Chat List'),
          ),
          SideMenuItem(
            title: 'Help',
            isSelected: selectedMenuItem == 'Help',
            onTap: () => onMenuItemClicked('Help'),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Chat List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final name = names[index];
              final avatarUrl =
                  'https://randomuser.me/api/portraits/men/${index + 1}.jpg'; // Sample avatar URL
              return ChatListItem(
                name: name,
                message: 'New Message ${index + 1}',
                time: '${index + 1}:00 pm',
                avatarUrl: avatarUrl,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(contactName: name),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SideMenuItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          backgroundColor: Colors.pink[100], // Light pink background color
          foregroundColor: isSelected ? Colors.blue : Colors.black,
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

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final VoidCallback onTap;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(message),
                ],
              ),
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}
