import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:logger/logger.dart';
import 'package:nouman_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});
  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  List title = ["Who is Dash?", "Who is Dash 2?"];
  List body = [
    "Will we can all read about it in Google’s official blog post...",
    "Google Itself is a verb...",
  ];
  // void article() async {
  //   await FirebaseFirestore.instance.collection('articles').get().then((
  //     querySnapshot,
  //   ) {
  //     for (var element in querySnapshot.docs.reversed) {
  //       debugPrint(element.data()["body"].toString());
  //     }
  //   });
  // }

  // void streamArticle() async {
  //   var logger = Logger();
  //   await for (var snapShot
  //       in FirebaseFirestore.instance.collection("articles").snapshots()) {
  //     for (var title in snapShot.docs) {
  //       logger.d(title.data()['title'].toString());
  //     }
  //   }
  // }

  IconButton urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: imagePath.endsWith('.svg')
          ? SvgPicture.asset(imagePath, width: 30, height: 30)
          : Image.asset(imagePath, width: 30, height: 30),
      onPressed: () async =>
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
    );
  }

  // @override
  // void initState() {
  //   streamArticle();
  //   super.initState();
  // }

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
        title: const Text('Blogs', style: TextStyle(color: Colors.black)),
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
                'assets/blog.jpg',
                width: width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 25.0),
            const SansBold(28, "Articles & Blog Posts"),
            const SizedBox(height: 15.0),
            //  LISTVIEW.BUILDER
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('articles')
                  .snapshots(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: asyncSnapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot documentSnapshot =
                          asyncSnapshot.data!.docs[index];
                      return BlogPost(
                        title: documentSnapshot['title'],
                        body: documentSnapshot['body'],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),

            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  final dynamic title;
  final dynamic body;
  const BlogPost({super.key, required this.title, required this.body});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1.0,
            color: Colors.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: widget.title.toString(),
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(
                    expand
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7.0),
            Text(
              widget.body.toString(),
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
