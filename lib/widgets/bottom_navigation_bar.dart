import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              icon: Icons.account_balance_wallet,
              label: 'Add Balance',
              onTap: () {
                // Action for "Add Balance"
              },
            ),
            const SizedBox(width: 16), // Spacing
            _buildNavItem(
              icon: Icons.qr_code_scanner,
              label: 'Scan to Enter',
              isMiddle: true,
              onTap: () {
                // Action for "Scan to Enter"
              },
            ),
            const SizedBox(width: 16), // Spacing
            _buildNavItem(
              icon: Icons.fitness_center,
              label: 'Packages',
              onTap: () {
                // Action for "Packages"
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    bool isMiddle = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isMiddle ? Colors.orange : Colors.grey,
            size: isMiddle ? 30 : 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isMiddle ? Colors.orange : Colors.grey,
              fontSize: isMiddle ? 12 : 10,
            ),
          ),
        ],
      ),
    );
  }
}
