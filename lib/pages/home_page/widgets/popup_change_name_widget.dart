import 'package:app_counter/core/app_styles.dart';
import 'package:app_counter/pages/widgets/popup_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupChangeNameWidget extends StatefulWidget {
  final RxString name;

  const PopupChangeNameWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<PopupChangeNameWidget> createState() => _PopupChangeNameWidgetState();
}

class _PopupChangeNameWidgetState extends State<PopupChangeNameWidget> {
  final TextEditingController _nameEditController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameEditController.text = widget.name.value;
    super.initState();
  }

  @override
  void dispose() {
    _nameEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupBase(
      title: "Change Name",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              key: formGlobalKey,
              validator: (value) {
                if (value == "") {
                  return "Please enter name!";
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _nameEditController,
              style: AppStyles.thin(20).copyWith(color: Colors.blue),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          )
        ],
      ),
      onTapOK: () {
        if (formGlobalKey.currentState?.validate() ?? true) {
          Get.back();
          widget.name.value = _nameEditController.text;
        } else {
          formGlobalKey.currentState?.save();
        }
      },
    );
  }
}
