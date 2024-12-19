import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Mock API/user_list.dart';
import '../image_card.dart';

class NewProfileMobile extends StatefulWidget {
  final BuildContext bodyContext;
  const NewProfileMobile({super.key, required this.bodyContext});

  @override
  _NewProfileMobileState createState() => _NewProfileMobileState();
}

class _NewProfileMobileState extends State<NewProfileMobile> with TickerProviderStateMixin {
  Map<int, bool> _hovering = {};
  Map<int, AnimationController> _controllers = {};
  Map<int, Animation<Offset>> _animations = {};

  @override
  void dispose() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures it adapts to screen width
      height: 18.h, // Adjusted height for better display on mobile
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length > 5 ? 5 : userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];

          _controllers[index] ??= AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 300),
          );

          _animations[index] ??= Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _controllers[index]!,
            curve: Curves.easeInOut,
          ));

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _hovering[index] = true;
                  _controllers[index]?.forward();
                });
              },
              onExit: (_) {
                setState(() {
                  _hovering[index] = false;
                  _controllers[index]?.reverse();
                });
              },
              child: InkWell(
                onTap: () {
                  // Add action if needed
                },
                child: Container(
                  width: 30.w, // Scales properly for smaller devices
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      if (_hovering[index] ?? false)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Profile Image
                      SlideTransition(
                        position: _animations[index]!,
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ImageCard(imageUrl: user['image_url']),
                          ),
                        ),
                      ),
                      // Profile Info
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['full_name'],
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 1.5.t, // Adjusted for better readability
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '${user['address']}, Age: ${user['age']}',
                              style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 1.2.t,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
