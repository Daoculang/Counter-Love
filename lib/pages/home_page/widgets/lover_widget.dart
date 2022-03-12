import 'package:app_counter/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoverWidget extends StatefulWidget {
  final String? loverName;
  final Function() onTap;

  const LoverWidget({Key? key, required this.loverName, required this.onTap}) : super(key: key);

  @override
  _LoverWidgetState createState() => _LoverWidgetState();
}

class _LoverWidgetState extends State<LoverWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _xFile = XFile("");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: GestureDetector(
                onTap: () async {
                  XFile? _file = await _picker.pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                  if (_file != null) {
                    _xFile = _file;
                  }
                },
                child: Image.asset(
                  'assets/images/picture_2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                widget.loverName ?? "...",
                textAlign: TextAlign.center,
                style: AppStyles.medium(20).copyWith(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
