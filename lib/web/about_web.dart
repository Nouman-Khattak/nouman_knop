import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
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
      child: Sans(16, label),
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
                  "assets/web.jpg",
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthDevice > 1000 ? 100.0 : 30.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SansBold(35, "About Me"),
                const SizedBox(height: 20),
                const Sans(
                  16,
                  "Hello! I'm Nouman Farooq, a passionate Flutter Developer who loves building high-performance, aesthetically pleasing, and responsive cross-platform applications for Android, iOS, and Web.",
                ),
                const SizedBox(height: 15),
                const Sans(
                  16,
                  "I strive to ensure that the art of security meets intelligence, bringing together modern architecture, clean code principles, and seamless user experiences.",
                ),
                const SizedBox(height: 35),
                const SansBold(25, "My Technical Skills"),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    _skillChip("Flutter"),
                    _skillChip("Dart"),
                    _skillChip("Firebase"),
                    _skillChip("REST APIs"),
                    _skillChip("C++"),
                    _skillChip("Git & GitHub"),
                    _skillChip("State Management"),
                    _skillChip("Responsive Web Design"),
                  ],
                ),
                const SizedBox(height: 40),
                const SansBold(25, "What Drives Me"),
                const SizedBox(height: 15),
                const Sans(
                  16,
                  "Technology is constantly evolving, and I thrive on learning new paradigms, optimizing application performance, and crafting interfaces that deliver unforgettable digital experiences.",
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
