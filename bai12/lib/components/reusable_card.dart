import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardChild,
    this.onPress,
  });

  final Color colour;
  final Widget? cardChild; // Có thể null
  final VoidCallback? onPress; // Đổi Function thành VoidCallback? để an toàn hơn

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
