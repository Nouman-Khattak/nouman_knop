import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  IconButton urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: imagePath.endsWith('.svg')
          ? SvgPicture.asset(imagePath, width: 30, height: 30)
          : Image.asset(imagePath, width: 30, height: 30),
      onPressed: () async =>
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: const Text('Contact Me', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black),
                    image: const DecorationImage(
                      image: AssetImage("assets/images.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const TabsMobile(text: "Home", route: "/"),
              const SizedBox(height: 20.0),
              const TabsMobile(text: "Works", route: "/works"),
              const SizedBox(height: 20.0),
              const TabsMobile(text: "Blog", route: "/blog"),
              const SizedBox(height: 20.0),
              const TabsMobile(text: "About", route: "/about"),
              const SizedBox(height: 20.0),
              const TabsMobile(text: "Contact", route: "/contact"),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  urlLauncher(
                    'assets/instagram.svg',
                    'https://www.instagram.com/tomcruise',
                  ),
                  urlLauncher(
                    'assets/twitter.svg',
                    'https://www.twitter.com/tomcruise',
                  ),
                  urlLauncher(
                    'assets/github.svg',
                    'https://www.github.com/tomcruise',
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/contact_image.jpg',
                width: width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 25.0),
            const SansBold(30, "Contact Me"),
            const SizedBox(height: 20.0),
            TextForm(
              text: "First Name",
              hintText: "Please enter your first name",
              containerWidth: width * 0.88,
              controller: _firstNameController,
            ),
            const SizedBox(height: 15.0),
            TextForm(
              text: "Last Name",
              hintText: "Please enter your last name",
              containerWidth: width * 0.88,
              controller: _lastNameController,
            ),
            const SizedBox(height: 15.0),
            TextForm(
              text: "Email Address",
              hintText: "Please enter your email",
              containerWidth: width * 0.88,
              controller: _emailController,
            ),
            const SizedBox(height: 15.0),
            TextForm(
              text: "Phone Number",
              hintText: "Please enter your phone number",
              containerWidth: width * 0.88,
              controller: _phoneController,
            ),
            const SizedBox(height: 15.0),
            TextForm(
              text: "Message",
              hintText: "Please enter your message",
              containerWidth: width * 0.88,
              controller: _messageController,
              maxlines: 5,
            ),
            const SizedBox(height: 25.0),
            MaterialButton(
              onPressed: () async {
                final addData = AddDatafirestore();
                final isSuccess = await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                );
                if (isSuccess && mounted) {
                  _firstNameController.clear();
                  _lastNameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                  _messageController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.tealAccent,
                      content: Text(
                        "Message sent successfully!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }
              },
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 55.0,
              minWidth: 200,
              color: Colors.tealAccent,
              child: const SansBold(20, "Submit"),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
