import 'dart:async';
import 'package:app_counter/controllers/home_controller.dart';
import 'package:app_counter/core/app_colors.dart';
import 'package:app_counter/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final HomeController _homeController = Get.put(HomeController());
  Duration updateDuration = const Duration(seconds: 1);

  @override
  void initState() {
    _increasedSecond();
    super.initState();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int _days = _homeController.seconds.value ~/ (24 * 60 * 60);
      int _hours = _homeController.seconds.value ~/ (60 * 60);
      int _minutes = _homeController.seconds.value ~/ 60;
      int _seconds = _homeController.seconds.value % 60;
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.pink),
        ),
        child: Text(
          "$_days:$_hours:$_minutes:$_seconds",
          style: AppStyles.bold(60).copyWith(color: kDefaultColor),
        ),
      );
    });
  }

  _increasedSecond() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _homeController.seconds.value += 1;
    });
  }
}
