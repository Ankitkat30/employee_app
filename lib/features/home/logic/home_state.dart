part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeDataLoadedState extends HomeState {
  final List<EmployeeModel> homeData;
  final int minAge;
  final int maxAge;
  HomeDataLoadedState(this.homeData,this.minAge,this.maxAge);
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}
