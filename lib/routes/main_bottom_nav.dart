// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'dart:ui';
import 'package:artora/presentation/home/home_page.dart';
import 'package:artora/presentation/profile/profile_page.dart';
import 'package:artora/presentation/search/search_page.dart';
import 'package:artora/presentation/stats/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = <Widget>[
    const HomePage(),
    const StatsPage(),
    const SearchPage(),
    const ProfilePage()
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      right: false,
      left: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ClipPath(
          clipper: HexagonClipper(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: -5,
                  ),
                ],
              ),
              child: Icon(
                CupertinoIcons.add,
                color: Colors.white.withOpacity(0.9),
                size: 32,
              ),
            ),
          ),
        ),
        body: _widgets[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32) , topRight: Radius.circular(32)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32) , topRight: Radius.circular(32)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: -5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem("assets/image/home.png", 0),
                  _buildNavItem("assets/image/symbol.png", 1),
                  const SizedBox(width: 16),
                  _buildNavItem("assets/image/explore.png", 2),
                  _buildNavItem("assets/image/profile.png", 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String assets, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        _onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
        ),
        child: Image.asset(
          assets,
          width: 32,
          height: 32,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  final double radius;
  
  const HexagonClipper({this.radius = 8.0});

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    
    final points = [
      Offset(w * 0.5, 0),
      Offset(w, h * 0.25),
      Offset(w, h * 0.75),
      Offset(w * 0.5, h),
      Offset(0, h * 0.75),
      Offset(0, h * 0.25),
    ];
    
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length; i++) {
      final current = points[i];
      final next = points[(i + 1) % points.length];
      final prev = points[i == 0 ? points.length - 1 : i - 1];
      
      final prevToCurrent = Offset(current.dx - prev.dx, current.dy - prev.dy);
      final currentToNext = Offset(next.dx - current.dx, next.dy - current.dy);
      
      final prevLength = sqrt(prevToCurrent.dx * prevToCurrent.dx + prevToCurrent.dy * prevToCurrent.dy);
      final nextLength = sqrt(currentToNext.dx * currentToNext.dx + currentToNext.dy * currentToNext.dy);
      
      final prevUnit = Offset(prevToCurrent.dx / prevLength, prevToCurrent.dy / prevLength);
      final nextUnit = Offset(currentToNext.dx / nextLength, currentToNext.dy / nextLength);
      
      final startPoint = Offset(
        current.dx - prevUnit.dx * radius,
        current.dy - prevUnit.dy * radius,
      );
      final endPoint = Offset(
        current.dx + nextUnit.dx * radius,
        current.dy + nextUnit.dy * radius,
      );
      
      path.lineTo(startPoint.dx, startPoint.dy);
      path.quadraticBezierTo(current.dx, current.dy, endPoint.dx, endPoint.dy);
    }
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant HexagonClipper oldClipper) => radius != oldClipper.radius;
}