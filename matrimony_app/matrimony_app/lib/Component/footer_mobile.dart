import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final padding = (screenWidth * 0.05).clamp(20.0, 40.0);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [footerColor, footerColor.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
              _buildSectionHeader("GET IN TOUCH", Icons.contact_mail),
              _buildContactDetails(),
              Divider(color: footerTextColor.withOpacity(0.5)),
              _buildSectionHeader("HELP & SUPPORT", Icons.help_center),
              _buildHelpSupport(),
              Divider(color: footerTextColor.withOpacity(0.5)),
              _buildSectionHeader("SOCIAL MEDIA", Icons.share),
              _buildSocialMedia(),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildContactColumn()),
              _buildVerticalDivider(),
              Expanded(child: _buildHelpSupportColumn()),
              _buildVerticalDivider(),
              Expanded(child: _buildSocialMediaColumn()),
            ],
          ),
        ),
        Positioned(
          top: -5.5.h,
          child: Container(
            width: 90.0.w,
            height: 4.0.h.clamp(50.0, 80.0),
            padding: EdgeInsets.symmetric(horizontal: padding),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: footerTitleColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              "Free Support: +91 1234567890 |  Email: it.team.instaict@gmail.com",
              style: GoogleFonts.poppins(
                fontSize: 1.5.t,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: footerTextColor, size: 20),
          SizedBox(width: 8.0),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 2.0.t,
              fontWeight: FontWeight.w600,
              color: footerTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextWithIcon(Icons.location_on, "Address: Imperial Plaza, Kothrud Pune"),
        _buildTextWithIcon(Icons.phone, "Phone: +91 1234567890"),
        _buildTextWithIcon(Icons.email, "Email: it.team.instaict@gmail.com"),
      ],
    );
  }

  Widget _buildTextWithIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12.0, color: footerTextColor),
        SizedBox(width: 8.0),
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 1.5.t, color: footerTextColor),
        ),
      ],
    );
  }

  Widget _buildHelpSupport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildClickableText("About company"),
        _buildClickableText("Feedback"),
        _buildClickableText("Testimonials"),
        _buildClickableText("Contact us"),
        _buildClickableText("FAQs"),
      ],
    );
  }

  Widget _buildClickableText(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 1.5.t, color: footerTextColor.withOpacity(0.9)),
        ),
      ),
    );
  }

  Widget _buildSocialMedia() {
    return Row(
      children: [
        _buildSocialMediaIcon(whatsapp, whatsappColor),
        _buildSocialMediaIcon(twitter, twitterColor),
        _buildSocialMediaIcon(facebook, facebookColor),
        _buildSocialMediaIcon(youtube, youtubeColor),
      ],
    );
  }

  Widget _buildSocialMediaIcon(String asset, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.8),
        radius: 15.0,
        child: SvgPicture.asset(
          asset,
          fit: BoxFit.scaleDown,
          width: 18.0,
          height: 18.0,
        ),
      ),
    );
  }

  Widget _buildContactColumn() => _buildContactDetails();

  Widget _buildHelpSupportColumn() => _buildHelpSupport();

  Widget _buildSocialMediaColumn() => _buildSocialMedia();

  Widget _buildVerticalDivider() {
    return Container(
      width: 1.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: footerTextColor.withOpacity(0.5),
    );
  }
}
