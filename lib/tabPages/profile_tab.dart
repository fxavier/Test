import 'package:flutter/material.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        fontSize: 20,
        text: 'Profile',
        color: Colors.black,
      ),
    );
  }
}
