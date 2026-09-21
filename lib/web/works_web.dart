import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
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
                  "assets/works.jpg",
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
              horizontal: widthDevice > 1000 ? 80.0 : 25.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                const SansBold(35, "What I Do & Featured Works"),
                const SizedBox(height: 20),
                const Sans(
                  16,
                  "Here is a showcase of my specializations and project developments.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
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
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
