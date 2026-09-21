import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:nouman_knop/routes.dart' as routes;

class TabsWeb extends StatefulWidget {
  final String title;
  final String route;
  const TabsWeb({super.key, required this.title, required this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class TabsMobile extends StatefulWidget {
  final String text;
  final String route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(routes.generateRoute(RouteSettings(name: widget.route)));
      },
    );
  }
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context)
              .push(routes.generateRoute(RouteSettings(name: widget.route)));
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticIn,
          style: isSelected
              ? const TextStyle(
                  shadows: [Shadow(color: Colors.black)],
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.tealAccent,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              : const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign? textAlign;
  const SansBold(this.size, this.text, {super.key, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign? textAlign;
  const Sans(this.size, this.text, {super.key, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const AbelCustom({
    super.key,
    this.text,
    this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text != null ? text.toString() : "",
      style: GoogleFonts.abel(
        fontSize: size ?? 16.0,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// TEXTFORM
class TextForm extends StatelessWidget {
  final String text;
  final String hintText;
  final double containerWidth;
  final int? maxlines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const TextForm({
    super.key,
    required this.text,
    required this.hintText,
    required this.containerWidth,
    this.maxlines,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(15, text),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxlines ?? 1,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.teal),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCardWeb extends StatefulWidget {
  final String imagePath;
  final String text;
  final BoxFit fit;
  final bool reverse;
  final double? height;
  final double? width;
  const AnimatedCardWeb({
    super.key,
    required this.imagePath,
    required this.text,
    required this.fit,
    required this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10),
              SansBold(20, widget.text),
            ],
          ),
        ),
      ),
    );
  }
}

// Firestore data store
class AddDatafirestore {
  var logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection("messages");

  Future<bool> addResponse(
    String firstName,
    String lastName,
    String email,
    String phone,
    String message,
  ) async {
    return await response.add({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'message': message,
      'timestamp': Timestamp.now(),
    }).then((value) {
      logger.d("Message sent Successfully");
      return true;
    }).catchError((error) {
      logger.d("Error sending message: $error");
      return false;
    });
  }
}
