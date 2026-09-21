import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
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
        title: const Text('My Works', style: TextStyle(color: Colors.black)),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/works.jpg',
                width: width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 25.0),
            const SansBold(30, "What I Do"),
            const SizedBox(height: 20.0),
            const AnimatedCardWeb(
              text: "Web Development",
              imagePath: 'assets/webL.png',
              fit: BoxFit.contain,
              reverse: true,
            ),
            const SizedBox(height: 25.0),
            const AnimatedCardWeb(
              text: "App Development",
              imagePath: 'assets/app.png',
              fit: BoxFit.contain,
              reverse: false,
            ),
            const SizedBox(height: 25.0),
            const AnimatedCardWeb(
              text: "Back-End Development",
              imagePath: 'assets/firebase.png',
              fit: BoxFit.contain,
              reverse: true,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
