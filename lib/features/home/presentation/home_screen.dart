import 'package:employee_app/core/constants.dart';
import 'package:employee_app/features/home/data/model/employee_model.dart';
import 'package:employee_app/features/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmployeeModel> employeeList = []; // Local list to store employee data
  String searchQuery = ''; // Search query
  String? selectedAgeGroup; // Selected age group filter
  List<String> ageGroups =
      []; // List to store dynamically calculated age groups

  @override
  void initState() {
    super.initState();
    // Calculate age groups based on API data
    calculateAgeGroups();
  }

  void calculateAgeGroups() {
    // Assuming minAge and maxAge are fetched from the API
    int minAge = 19;
    int maxAge = 66;
    ageGroups.add("All Ages"); // Add "All Ages" option
    for (int i = minAge; i <= maxAge; i += 10) {
      int lowerBound = i;
      int upperBound = i + 9 < maxAge ? i + 9 : maxAge;
      ageGroups.add('$lowerBound years to $upperBound years');
    }
    // Set the default selected age group
    selectedAgeGroup = ageGroups.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (state is HomeDataLoadedState) {
                      // Populate local list with data from state
                      employeeList = state.homeData;
                      // Filter the list based on search query and age group
                      List<EmployeeModel> filteredList = employeeList
                          .where((employee) =>
                              employee.employeeName!
                                  .toLowerCase()
                                  .contains(searchQuery) &&
                              isInSelectedAgeGroup(employee.employeeAge!))
                          .toList();
                      return Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    hintText: 'Search by employee name',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      searchQuery = value.toLowerCase();
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                DropdownButtonFormField<String>(
                                  value: selectedAgeGroup,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    hintText: 'Filter by age group',
                                  ),
                                  items: ageGroups.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAgeGroup = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          height(20),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              var data = filteredList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: EmployeeContainer(
                                  age: data.employeeAge.toString(),
                                  employeeName: data.employeeName ?? "",
                                  id: data.id.toString(),
                                  salary: data.employeeSalary.toString(),
                                ),
                              );
                            },
                            shrinkWrap: true,
                          ),
                        ],
                      );
                    }
                    if (state is HomeErrorState) {
                      return Center(
                        child: simpleText(state.error),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isInSelectedAgeGroup(int age) {
    if (selectedAgeGroup == "All Ages") {
      return true;
    }
    List<String> ageRange = selectedAgeGroup!.split(' ');
    int lowerBound = int.parse(ageRange[0]);
    int upperBound = int.parse(ageRange[3]);
    return age >= lowerBound && age <= upperBound;
  }
}

class EmployeeContainer extends StatelessWidget {
  final String id;
  final String employeeName;
  final String salary;
  final String age;
  const EmployeeContainer({
    super.key,
    required this.id,
    required this.employeeName,
    required this.salary,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading2Text(
            employeeName,
            color: AppColors.primary,
          ),
          height(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: simpleText(
                    "Employee Id",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: simpleText(
                  id,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ))
            ],
          ),
          height(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: simpleText(
                  "Employee Age",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
              Flexible(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: simpleText(
                  age,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ))
            ],
          ),
          height(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: simpleText(
                  "Employee Salary",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
              Flexible(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: simpleText(
                  salary,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
