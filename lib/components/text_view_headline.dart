import 'package:bloc_project/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TextViewHeadline extends StatefulWidget {
  String message;
  TextViewHeadline({super.key, required this.message});

  @override
  State<TextViewHeadline> createState() => _TextViewHeadlineState();
}

class _TextViewHeadlineState extends State<TextViewHeadline> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.message,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: AppConstants.medFontSize, fontWeight: FontWeight.bold));
  }
}
