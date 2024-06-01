import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/create_password_state.dart';
import 'package:kemet/cubit/createprofile_cubit.dart';
import 'package:kemet/cubit/createprofile_state.dart';
import 'package:kemet/logic/core/api/dio_consumer.dart';
import 'package:kemet/screens/congratsPoPUP.dart';
import 'package:kemet/screens/errorPoPUP.dart';
import 'package:kemet/widget/Button.dart';
import 'package:kemet/widget/text.dart';
import 'package:kemet/widget/textField.dart';

import '../components2/edit_photo2.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

final TextEditingController createfirstnameController = TextEditingController();
final TextEditingController createrelastnameController =
    TextEditingController();
final TextEditingController createcityController = TextEditingController();
final TextEditingController createdateController = TextEditingController();

class _CreateProfilePageState extends State<CreateProfilePage> {
  // String fullName = '';
  // String email = '';
  late DioConsumer dioConsumer;
  late createprofileCubit cubit;
  //late ImageCubitCubit imageCubit;

  @override
  void initState() {
    super.initState();
    dioConsumer = DioConsumer(dio: Dio());
    cubit = createprofileCubit(api: dioConsumer);
    // imageCubit = ImageCubitCubit();
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xffB68B25),
            hintColor: Color(0xffB68B25),
            colorScheme: ColorScheme.light(primary: Color(0xffB68B25)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = picked.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        title: Text(
          'Create Profile',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => createprofileCubit(api: DioConsumer(dio: Dio())),
          child: BlocConsumer<createprofileCubit, createprofilestate>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is createprofileSuccess) {
                showCustomPopupCongrats(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.msg)),
                );
              } else if (state is createprofileError) {
                showCustomPopupError(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text(state.error)),
                // );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: context.read<createprofileCubit>().createprofileFormKey,
                  child: Column(
                    children: [
                                         PickImageWidget(),

                      SizedBox(height: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SLtext(
                            text: 'First Name',
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Field(
                            control: context
                                .read<createprofileCubit>()
                                .createfirstnameController,
                            Ltext: 'First Name',
                            Htext: 'Enter Your First Name',
                            width: 354,
                            height: 44,
                            radius: BorderRadius.circular(8),
                          ),
                          SizedBox(height: 20),
                          SLtext(
                            text: 'Last Name',
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Field(
                            control: context
                                .read<createprofileCubit>()
                                .createrelastnameController,
                            Ltext: 'Last Name',
                            Htext: 'Enter Your Last Name',
                            width: 354,
                            height: 44,
                            radius: BorderRadius.circular(8),
                          ),
                          SizedBox(height: 20),
                          SLtext(
                            text: 'City',
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Field(
                            control: context
                                .read<createprofileCubit>()
                                .createcityController,
                            Ltext: 'City',
                            Htext: 'Enter Your City',
                            width: 354,
                            height: 44,
                            radius: BorderRadius.circular(8),
                          ),
                          SizedBox(height: 20),
                          SLtext(
                            text: 'Date of Birth',
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Field(
                            control: context
                                .read<createprofileCubit>()
                                .createdateController,
                            Ltext: 'DOB',
                            Htext: 'Enter Your DOB',
                            width: 354,
                            height: 44,
                            radius: BorderRadius.circular(8),
                          ),
                          // Container(
                          //   height: 44,
                          //   width: 354,
                          //   child: TextField(
                          //     controller: dateController,
                          //     readOnly: true,
                          //     decoration: InputDecoration(
                          //       labelText: 'Date of Birth',
                          //       floatingLabelStyle:
                          //           TextStyle(color: Color(0xffB68B25)),
                          //       border: OutlineInputBorder(
                          //         borderSide:
                          //             BorderSide(color: Color(0xff252836)),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         borderSide:
                          //             BorderSide(color: Color(0xffB68B25)),
                          //       ),
                          //       suffixIcon: IconButton(
                          //         icon: Icon(Icons.calendar_today),
                          //         onPressed: () => _selectDate(context),
                          //         color: Color(0xffB68B25),
                          //       ),
                          //     ),
                          //     onTap: () => _selectDate(context),
                          //     onChanged: (value) {
                          //       // Update both controllers when the text changes
                          //       dateController.text = value;
                          //       context
                          //           .read<createprofileCubit>()
                          //           .createdateController
                          //           .text = value;
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 100),
                      state is createpasswordLoading
                          ? const CircularProgressIndicator()
                          : button(
                              text: 'Save Profile',
                              ontap: () {
                                context
                                    .read<createprofileCubit>()
                                    .createprofile(dioConsumer.dio);
                              },
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
