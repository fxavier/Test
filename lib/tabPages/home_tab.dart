import 'package:flutter/material.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        fontSize: 20,
        text: 'Home',
        color: Colors.black,
      ),
    );
  }
}
