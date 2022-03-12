import 'package:app_counter/core/app_styles.dart';
import 'package:flutter/material.dart';

class LoverWidget extends StatefulWidget {
  final String loverName;

  const LoverWidget({Key? key, required this.loverName}) : super(key: key);

  @override
  _LoverWidgetState createState() => _LoverWidgetState();
}

class _LoverWidgetState extends State<LoverWidget> {
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
              child: Image.asset(
                'assets/images/picture_2.png',
                fit: BoxFit.contain,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                widget.loverName,
                style: AppStyles.medium(20).copyWith(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
