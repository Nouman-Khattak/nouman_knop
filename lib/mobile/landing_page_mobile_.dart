import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  var logger = Logger();
  final formKey = GlobalKey<FormState>();
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

  Widget _skillChip(String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.tealAccent, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
      child: Sans(14.0, label),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,

        title: const Text('Home', style: TextStyle(color: Colors.black)),
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
              const TabsMobile(text: "Blogs", route: "/blogs"),
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

      body: ListView(
        children: [
          // INTRO FISRT SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 110.0,
                    backgroundImage: AssetImage("assets/images.jpg"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 14.0,
                      ),
                      child: const SansBold(14, "Hello, I'm"),
                    ),
                    const SizedBox(height: 6.0),
                    const SansBold(30, "Nouman Farooq"),
                    const Sans(20, "Flutter Developer"),
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.email_outlined, size: 20),
                        SizedBox(width: 10.0),
                        Sans(15.0, "[EMAIL_ADDRESS]"),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.phone_android_outlined, size: 20),
                        SizedBox(width: 10.0),
                        Sans(15.0, "+92 337 7092412"),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on_outlined, size: 20),
                        SizedBox(width: 10.0),
                        Sans(15.0, "Rawalpindi, Pakistan"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          // ABOUT ME
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SansBold(35, "About Me"),
                const SizedBox(height: 20.0),
                Image.asset(
                  'assets/web.jpg',
                  width: width * 0.85,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20.0),
                const Sans(
                  15,
                  "I am Nouman Farooq, a Flutter Developer from Rawalpindi.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                const Sans(
                  15,
                  "Looking for a Developer? Feel free to contact me.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    _skillChip("Flutter"),
                    _skillChip("Firebase"),
                    _skillChip("C++"),
                    _skillChip("REST APIs"),
                    _skillChip("Git"),
                  ],
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
          // THIRD SECTION What I Do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SansBold(35, "What I Do"),
              const SizedBox(height: 20.0),
              AnimatedCardWeb(
                text: "Web Development",
                imagePath: 'assets/webL.png',
                fit: BoxFit.contain,
                reverse: true,
              ),
              const SizedBox(height: 20.0),
              AnimatedCardWeb(
                text: "App Development",
                imagePath: 'assets/app.png',
                fit: BoxFit.contain,
                reverse: false,
              ),
              const SizedBox(height: 20.0),
              AnimatedCardWeb(
                text: "Back-End Development",
                imagePath: 'assets/firebase.png',
                fit: BoxFit.contain,
                reverse: true,
              ),
              const SizedBox(height: 40.0),
              // Contact Section
              Form(
                key: formKey,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    SansBold(35.0, "CONTACT PAGE"),
                    TextForm(
                      text: "First Name",
                      hintText: "please enter your name",
                      containerWidth: 300,
                      controller: _firstNameController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "First name is required";
                        }
                        return null;
                      },
                    ),
                    TextForm(
                      text: "Last Name",
                      hintText: "please enter your last name",
                      containerWidth: 300,
                      controller: _lastNameController,
                    ),
                    TextForm(
                      text: "Email",
                      hintText: "please enter your email",
                      containerWidth: 300,
                      controller: _emailController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    TextForm(
                      text: "Phone Number",
                      hintText: "please enter your Phone Number",
                      containerWidth: 300,
                      controller: _phoneController,
                    ),
                    TextForm(
                      text: "Messages",
                      hintText: "Messages",
                      containerWidth: 300,
                      controller: _messageController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "Message is required";
                        }
                        return null;
                      },
                      maxlines: 5,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final addData = AddDatafirestore();
                          final isSuccess = await addData.addResponse(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneController.text,
                            _messageController.text,
                          );
                          if (isSuccess && mounted) {
                            formKey.currentState!.reset();
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
                        }
                      },
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 60.0,
                      minWidth: 200,
                      color: Colors.tealAccent,
                      child: const SansBold(20, "Submit"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
