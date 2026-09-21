import 'package:flutter/material.dart';
import 'package:nouman_knop/mobile/about_mobile.dart';
import 'package:nouman_knop/mobile/blog_mobile.dart';
import 'package:nouman_knop/mobile/contact_mobile.dart';
import 'package:nouman_knop/mobile/landing_page_mobile_.dart';
import 'package:nouman_knop/mobile/works_mobile.dart';
import 'package:nouman_knop/web/about_web.dart';
import 'package:nouman_knop/web/blog_web.dart';
import 'package:nouman_knop/web/contact_web.dart';
import 'package:nouman_knop/web/landing_page_web.dart';
import 'package:nouman_knop/web/works_web.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case '/home':
    case '/Home':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const LandingPageWeb();
            } else {
              return const LandingPageMobile();
            }
          },
        ),
      );

    case '/about':
    case '/About':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const AboutWeb();
            } else {
              return const AboutMobile();
            }
          },
        ),
      );

    case '/works':
    case '/Works':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const WorksWeb();
            } else {
              return const WorksMobile();
            }
          },
        ),
      );

    case '/blog':
    case '/Blog':
    case '/blogs':
    case '/Blogs':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const BlogWeb();
            } else {
              return const BlogMobile();
            }
          },
        ),
      );

    case '/contact':
    case '/Contact':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const ContactWeb();
            } else {
              return const ContactMobile();
            }
          },
        ),
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const LandingPageWeb();
            } else {
              return const LandingPageMobile();
            }
          },
        ),
      );
  }
}
