import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
        border: Border.all(color: Colors.tealAccent, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Sans(15, label),
    );
  }

  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      //Drawer
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images.jpg"),
            ),
            const SizedBox(height: 30.0),
            const SansBold(25.0, "Nouman Farooq"),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher(
                  'assets/instagram.svg',
                  'https://instagram.com/tomcruise/',
                ),
                urlLauncher(
                  'assets/twitter.svg',
                  'https://twitter.com/tomcruise/',
                ),
                urlLauncher(
                  'assets/github.svg',
                  'https://github.com/tomcruise/',
                ),
                urlLauncher('assets/web.svg', 'https://web.com/tomcruise/'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Spacer(flex: 3),
            TabsWeb(title: "Home", route: "/"),
            Spacer(),
            TabsWeb(title: "Works", route: "/works"),
            Spacer(),
            TabsWeb(title: "Blog", route: "/blog"),
            Spacer(),
            TabsWeb(title: "About", route: "/about"),
            Spacer(),
            TabsWeb(title: "Contact", route: "/contact"),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Fisrt page
          SizedBox(
            height: heightDevice - 56,
            width: widthDevice,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent[100],
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 18.0,
                      ),
                      child: const SansBold(20, "Hello, I'm"),
                    ),
                    const SizedBox(height: 12),
                    const SansBold(45, "Nouman Farooq"),
                    const Sans(24, "Flutter Developer"),
                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Sans(18, "[EMAIL_ADDRESS]"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(
                          Icons.phone_android_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Sans(18, "+92 337 7092412"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Sans(18, "Rawalpindi, Pakistan"),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 130,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images.jpg'),
                  ),
                ),
              ],
            ),
          ),
          //second page
          SizedBox(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/web.jpg', height: widthDevice / 1.9),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SansBold(30, "About Me"),
                    const SizedBox(height: 13),
                    const Sans(
                      16,
                      "I am a passionate Flutter Developer crafting high-quality applications.",
                    ),
                    const SizedBox(height: 6),
                    const Sans(
                      16,
                      "I strive to ensure that the art of security meets intelligence.",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _skillChip("Flutter"),
                        const SizedBox(width: 10),
                        _skillChip("Firebase"),
                        const SizedBox(width: 10),
                        _skillChip("C++"),
                        const SizedBox(width: 10),
                        _skillChip("REST APIs"),
                        const SizedBox(width: 10),
                        _skillChip("Git"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // third page
          SizedBox(
            height: heightDevice / 1.3,
            child: Column(
              children: [
                const SansBold(35, "What I Do"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCardWeb(
                      imagePath: "assets/webL.png",
                      text: "Web Development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCardWeb(
                      imagePath: "assets/app.png",
                      text: "App Development",
                      fit: BoxFit.contain,
                      reverse: false,
                    ),
                    AnimatedCardWeb(
                      imagePath: "assets/firebase.png",
                      text: "Back-End Development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(35, "Contact Me"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextForm(
                          text: "First Name",
                          hintText: "Please type your first name",
                          containerWidth: 350,
                          controller: _firstNameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "First name is required";
                            }
                            return null;
                          },
                          maxlines: null,
                        ),
                        const SizedBox(height: 15),
                        TextForm(
                          text: "Email Address",
                          hintText: "Please type your email address",
                          containerWidth: 350,
                          controller: _emailController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          maxlines: null,
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          text: "Last Name",
                          hintText: "Please type your last name",
                          containerWidth: 350,
                          controller: _lastNameController,
                          maxlines: null,
                        ),
                        const SizedBox(height: 15),
                        TextForm(
                          text: "Phone Number",
                          hintText: "Please type your phone number",
                          containerWidth: 350,
                          controller: _phoneController,
                          maxlines: null,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextForm(
                  text: "Message",
                  hintText: "Please type your message",
                  containerWidth: widthDevice / 1.5,
                  controller: _messageController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Message is required";
                    }
                    return null;
                  },
                  maxlines: 10,
                ),
                const SizedBox(height: 20.0),
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
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
                  child: const SansBold(20.0, "Submit"),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
