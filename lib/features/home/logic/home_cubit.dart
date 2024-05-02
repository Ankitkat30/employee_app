import 'package:employee_app/features/home/data/model/employee_model.dart';
import 'package:employee_app/features/home/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' hide log;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getHomeData();
  }

  HomeRepostiory homeRepostiory = HomeRepostiory();

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      List<EmployeeModel> dataModel = await homeRepostiory.getHomeData();

      int minAge = dataModel
              .map((employee) => employee.employeeAge)
              .reduce((a, b) => min(a ?? 1, b ?? 1)) ??
          1; // Corrected
      int maxAge = dataModel
              .map((employee) => employee.employeeAge)
              .reduce((a, b) => max(a ?? 1, b ?? 1)) ??
          1; // Corrected4

      emit(HomeDataLoadedState(dataModel, minAge, maxAge));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
