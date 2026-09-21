import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
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
          ];
        },
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                const SansBold(35, "Contact Me"),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
