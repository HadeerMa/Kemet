import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/logic/cache/cache_helper.dart';
import 'package:kemet/logic/core/api/end_ponits.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  static LogoutCubit get(context) => BlocProvider.of(context);

  void logout2(Dio dio) async {
    emit(LogoutLoading());
    final token = CacheHelper().getDataString(key: ApiKey.token);
    // if (token == null) {
    //   return;
    // }
    try {
      //dioConsumer.dio.options.headers['token'] = token;
      final response = await dio.patch(EndPoint.logoutEndpoint,
          options: Options(headers: {
            "token": token,
          }));
      if (response.statusCode == 200) {
        emit(LoggedOutSuccess());
        print('Logout successful');
        //await CacheHelper().removeData(key: ApiKey.token);
      } else {
        emit(LogoutFailure('error in statusCode'));
      }
    } catch (e) {
      emit(LogoutFailure('can not log out'));
    }
  }
}
