import 'dart:math';
import 'dart:ui';
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
    Center(child: Text("Home Screen")),
    Center(child: Text("Stats Screen")),
    Center(child: Text("Search Screen")),
    Center(child: Text("Profile Screen")),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ClipPath(
          clipper: HexagonClipper(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10 , sigmaY: 10),
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                CupertinoIcons.add,
                color: Colors.white.withValues(alpha: 0.7),
                size: 30,
              ),
            ),
          ),
        ),
        body: _widgets[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                color: Colors.white10.withValues(alpha: 0.2),
                border: Border.all(
                  width: 2,
                  color: Colors.white10.withValues(alpha: 0.1)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem("assets/image/home.png", 0),
                  _buildNavItem("assets/image/symbol.png", 1),
                  SizedBox(width: 16),
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
    return InkWell(
      onTap: () {
        _onTap(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          width: 40,
          height: 40,
          assets,
          color: isSelected ? Colors.white : Colors.grey,
        )
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  final double radius;
  
  const HexagonClipper({this.radius = 4.0});

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