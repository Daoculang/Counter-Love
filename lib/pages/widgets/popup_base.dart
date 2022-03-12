import 'package:app_counter/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupBase extends StatelessWidget {
  final String? title;
  final Widget content;
  final Function() onTapOK;

  const PopupBase({
    Key? key,
    this.title,
    required this.content,
    required this.onTapOK,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      title: Center(
        child: Text(
          title ?? "",
          style: AppStyles.bold(20).copyWith(color: Colors.purpleAccent),
        ),
      ),
      content: content,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onTapOK,
                child: Text(
                  'OK',
                  style: AppStyles.medium(20).copyWith(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Cancel',
                  style: AppStyles.medium(20).copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
