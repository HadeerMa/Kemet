import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/components/custom_appbar.dart';
import 'package:kemet/components/custom_container_in_account.dart';
import 'package:kemet/components/logout_pop_up.dart';
import 'package:kemet/components/photo_account.dart';
import 'package:kemet/cubit/createprofile_cubit.dart';
import 'package:kemet/cubit/image_cubit_cubit.dart';
import 'package:kemet/cubit/logout_cubit.dart';
import 'package:kemet/logic/core/api/dio_consumer.dart';
import 'package:kemet/pages/change_password.dart';
import 'package:kemet/pages/profile_page.dart';
import 'package:kemet/pages/search.dart';
import 'package:kemet/pages/setting.dart';
import 'package:kemet/pages/tickets.dart';
import 'package:kemet/screens/homepage.dart';

class Account extends StatefulWidget {
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
   // dioConsumer = DioConsumer(dio: Dio());
  late DioConsumer dioConsumer;
  late createprofileCubit cubit;
  @override
  void initState() {
    super.initState();
    dioConsumer = DioConsumer(dio: Dio());
    cubit = createprofileCubit(api: dioConsumer);
  }

  @override
  Widget build(BuildContext context) {
    //final logoutCubit = BlocProvider.of<LogoutCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Account',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 29,
            ),
            const PhotoAccount(),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Profile', contIcon: Icons.person_outline_rounded),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                //showCustomPopupError(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangePassword();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Change Password',
                  contIcon: CupertinoIcons.lock_rotation_open),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Tickets();
                }));
              },
              child: const ContainerAccount(
                  contName: 'My Tickets', contIcon: CupertinoIcons.tickets),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Search();
                  //SearchPage();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Favorites', contIcon: CupertinoIcons.heart),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Setting();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Setting', contIcon: Icons.settings_outlined),
            ),
            const SizedBox(
              height: 15,
            ),
            ContainerAccount(
              contName: 'Log Out',
              contIcon: Icons.logout,
              onTap: () {
                showCustomPopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
