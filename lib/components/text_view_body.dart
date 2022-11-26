import 'package:bloc_project/constants/app_constants.dart';
import 'package:bloc_project/constants/color_constants.dart';
import 'package:bloc_project/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class TextViewBody extends StatefulWidget {
  String right;
  String left;
  TextViewBody({super.key, required this.left, required this.right});

  @override
  State<TextViewBody> createState() => _TextViewBodyState();
}

class _TextViewBodyState extends State<TextViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingConstants.lowPaddingSize),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: ColorConstants.secondColor,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.lowPaddingSize),
            child: Row(
              children: [
                Expanded(
                  child: Text(widget.left,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: AppConstants.smallFontSize,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryColor)),
                ),
                Expanded(
                  flex: 5,
                  child: Text(widget.right,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: AppConstants.smallFontSize)),
                ),
              ],
            )),
      ),
    );
  }
}
