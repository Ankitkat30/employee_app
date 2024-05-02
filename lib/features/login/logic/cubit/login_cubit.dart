import 'package:employee_app/core/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> login({
    required String mobile,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          emit(LoginLoadedState());
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> signOut() async {
    Routes.closeAllAndGoTo(Screens.login);
  }
}
