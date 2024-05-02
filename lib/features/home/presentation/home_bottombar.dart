import 'package:employee_app/core/constants.dart';
import 'package:employee_app/features/home/presentation/account_screen.dart';
import 'package:employee_app/features/home/presentation/home_screen.dart';
import 'package:employee_app/features/home/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomBarScreen extends StatefulWidget {
  const HomeBottomBarScreen({super.key});

  @override
  State<HomeBottomBarScreen> createState() => _HomeBottomBarScreenState();
}

class _HomeBottomBarScreenState extends State<HomeBottomBarScreen> {
  final List<Widget> loginUserPages = [
    const HomeScreen(),
    const SizedBox(),
    const SizedBox(),
    const AccountScreen(),
  ];

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
          preferredSize: Size(screenWidth, 50), child: const HomeAppBar()),
      body: loginUserPages[tabIndex],
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return BottomNavigationBar(
            elevation: 100,
            unselectedItemColor: AppColors.greyDark,
            unselectedLabelStyle: GoogleFonts.hind(
              fontWeight: FontWeight.w400,
              fontSize: 11,
            ),
            selectedItemColor: AppColors.textDark,
            selectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 11,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
             
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Employee",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Employee",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "Account",
              )
            ],
          );
        },
      ),
    );
  }
}
