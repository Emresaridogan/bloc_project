import 'package:bloc_project/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatefulWidget {
  String? link;
  String title;
  UrlButton({super.key, required this.link, required this.title});

  @override
  State<UrlButton> createState() => _UrlButtonState();
}

class _UrlButtonState extends State<UrlButton> {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.link.toString());
    if (widget.link != "") {
      return Expanded(
          flex: 4,
          child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
              ),
              child: TextButton(
                  onPressed: () {
                    launchUrl(url);
                  },
                  child: Text(
                    widget.title,
                    style: TextStyle(color: ColorConstants.secondColor),
                  ))));
    } else {
      return const Center();
    }
  }
}
