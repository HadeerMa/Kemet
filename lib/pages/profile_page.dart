import 'package:flutter/material.dart';
import 'package:kemet/views/profile_view.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileView(),
    );
  }
}
// BlocProvider(
//       create: (context) => ProfileCubit(),
//       child: const Scaffold(body: ProfileView()),
//     );