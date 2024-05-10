import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/home_cubit_cubit.dart';
import 'package:kemet/cubit/home_cubit_state.dart';
import 'package:kemet/logic/core/api/dio_consumer.dart';
import 'package:kemet/screens/governates_screens.dart';
import 'package:kemet/screens/torist_place.dart';
import 'package:kemet/widget/imagegover.dart';

class governorates extends StatelessWidget {
  governorates({Key? key}) : super(key: key);

  final DioConsumer dioConsumer = DioConsumer(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(api: DioConsumer(dio: Dio()))..governrate(dioConsumer.dio),
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          // TODO: implement listener
        
        },
        builder: (context, state) {
          if (state is governrateLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is governrateSuccess) {
          return Container(
            width: 354,
            height: 217,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      
                      imagecover(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ToristPlace()));
                        },
                        flexvalue: 1,
                        width: 125,
                        height: double.infinity,
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                        image: state.alexandria.image,
                        text: state.alexandria.name,
                       // id: state.alexandria.id,
                      ),
                      SizedBox(width: 5),
                      imagecover(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ToristPlace()));
                        },
                        flexvalue: 2,
                        width: 132,
                        height: double.infinity,
                         image: state.cairo.image,
                        text: state.cairo.name,
                      //  id: state.cairo.id,
                      ), // Space between images

                      SizedBox(width: 5),
                      imagecover(
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ToristPlace()));
                          },
                          flexvalue: 1,
                          width: 89,
                          height: double.infinity,
                          radius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          image: state.aswan.image,
                        text: state.aswan.name,
                       // id: state.aswan.id,
                        ), // Space between images
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // Space between rows
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      imagecover(
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ToristPlace()));
                          },
                          flexvalue: 1,
                          width: 125,
                          height: double.infinity,
                          radius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                         image: state.luxor.image,
                        text: state.luxor.name,
                      //  id: state.luxor.id,
                        ),
                      SizedBox(width: 5),
                      // Space between images
                      imagecover(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ToristPlace()));
                        },
                        flexvalue: 2,
                        width: 92,
                        height: double.infinity,
                        image: state.mersaMatruh.image,
                        text: state.mersaMatruh.name,
                        //id: state.mersaMatruh.id,
                      ),

                      SizedBox(width: 5),
                      imagecover(
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GovernatesScreen()));
                        },
                        flexvalue: 1,
                        width: 129,
                        height: double.infinity,
                        radius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        ),
                        image: 'https://i.pinimg.com/236x/b9/0a/f5/b90af54e43f74a46a74138e9d0070e08.jpg',
                        text: "other",
                      ),
                    ],
                  ),
                ),
              ],
              
            ),
          );
        } else if (state is governrateError) {
          return Center(child: Text(state.error));
        } else {
          return Container(); // Placeholder for other states
        }
      },
    )
    );
  }
}