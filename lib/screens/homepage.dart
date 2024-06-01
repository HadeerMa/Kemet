import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/home_cubit_cubit.dart';
import 'package:kemet/cubit/home_cubit_state.dart';
import 'package:kemet/logic/core/api/dio_consumer.dart';
import 'package:kemet/pages2/account.dart';
import 'package:kemet/screens/legend_category.dart';
import 'package:kemet/screens/offerList.dart';
import 'package:kemet/screens/offers.dart';
import 'package:kemet/widget/bottomnavebar.dart';
import 'package:kemet/widget/card.dart';
import 'package:kemet/widget/newgov.dart';
import 'package:kemet/widget/text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final usercubit = context.read<UserDataCubit>();
  final DioConsumer dioConsumer = DioConsumer(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(api: DioConsumer(dio: Dio()))
        ..fetchUserData(dioConsumer.dio),
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is UserDataSuccess) {
            final firstName = state.user.firstName;
            //final image = state.user.profileImg;
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Account()));
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(state.user.profileImg),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 160,
                          height: 50,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: SLtext(
                                  text: 'Hello, $firstName',
                                  weight: FontWeight.w600,
                                  size: 20,
                                ),
                              ),
                              SLtext(
                                text: "Let's take a tour in Egypt",
                                color: Color(0xff92929D),
                                weight: FontWeight.w500,
                                size: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  
                    Governoratesnew(),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 20,
                          child: SLtext(
                            text: 'Best Offer',
                            weight: FontWeight.w600,
                            size: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OfferScreen()));
                          },
                          child: SLtext(
                            text: 'See more',
                            weight: FontWeight.w600,
                            size: 12,
                            color: Color(0xffB68B25),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    
                    Expanded(child: offerwidget()),
                  
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottom(
                      image: 'images/home.png',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                    ),
                    bottom(
                      image: 'images/Menu 2.png',
                      ontap: () {},
                      // text: 'Map',
                      // color: Color(0xff92929D),
                    ),
                    bottom(
                      image: 'images/legendgray.png',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LegendCategory()));
                      },
                      // text: 'legend',
                      // color: Color(0xff92929D),
                    ),
                    bottom(
                      image: 'images/Menu 7.png',
                      ontap: () {},
                      // text: 'AR',
                      // color: Color(0xff92929D),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Handle other states or show a loading indicator
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
