import 'package:app_counter/controllers/home_controller.dart';
import 'package:app_counter/core/app_colors.dart';
import 'package:app_counter/core/app_styles.dart';
import 'package:app_counter/pages/home_page/widgets/popup_change_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/counter_widget.dart';
import 'widgets/lover_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              stops: const [0.3, 0.5, 0.7],
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow,
                Colors.purpleAccent.withOpacity(0.3),
                Colors.purpleAccent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Column(
              children: [
                _buildTitle(),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: CounterWidget(),
                  ),
                ),
                _buildName(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoverWidget(
            loverName: _homeController.loverOne.value,
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopupChangeNameWidget(name: _homeController.loverOne);
              },
            ),
          ),
          _buildHeart(),
          LoverWidget(
            loverName: _homeController.loverTwo.value,
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopupChangeNameWidget(name: _homeController.loverTwo);
              },
            ),
          ),
        ],
      );
    });
  }

  Row _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconFavorite(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Counter App Love",
            style: AppStyles.medium(35).copyWith(color: kDefaultColor),
          ),
        ),
        _buildIconFavorite(20),
      ],
    );
  }

  Widget _buildHeart() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: _buildIconFavorite(140),
    );
  }

  Widget _buildIconFavorite(double size) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: size,
    );
  }
}
