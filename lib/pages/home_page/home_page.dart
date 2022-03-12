import 'package:app_counter/core/app_colors.dart';
import 'package:app_counter/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'widgets/counter_widget.dart';
import 'widgets/lover_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  "Counter App Love",
                  style: AppStyles.medium(20).copyWith(color: kDefaultColor),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: CounterWidget(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LoverWidget(loverName: "Thuy"),
                    Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 140,
                      ),
                    ),
                    LoverWidget(loverName: "Khanh Dang"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
