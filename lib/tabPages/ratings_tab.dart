import 'package:flutter/material.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';

class RatingsTab extends StatefulWidget {
  const RatingsTab({Key? key}) : super(key: key);

  @override
  State<RatingsTab> createState() => _RatingsTabState();
}

class _RatingsTabState extends State<RatingsTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        fontSize: 20,
        text: 'Ratings',
        color: Colors.black,
      ),
    );
  }
}
