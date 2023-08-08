import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State< CustomBottomNavigation > {
  
  @override
  Widget build(BuildContext context) {

    final colorButtonPrimary = Theme.of( context ).primaryColor;
    final colorSecondary     = Theme.of( context ).secondaryHeaderColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
      child: GNav(
        hoverColor: colorSecondary, 
        haptic: true,
        tabActiveBorder: Border.all(color: colorSecondary, width: 2.5),
        curve: Curves.easeOutExpo, 
        gap: 8, 
        color: Colors.grey[500], 
        activeColor: colorButtonPrimary,
        tabBackgroundColor: colorSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), 
        tabs: const [
          GButton(
            icon: Icons.home_filled,
            text: 'Home',
          ),
          GButton(
            icon: Icons.label_outline,
            text: 'Categorias',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favoritos',
          ),
          GButton(
            icon: Icons.person_2_rounded,
            text: 'Usuario',
          ),
        ],
      ),
    );
  }
}
