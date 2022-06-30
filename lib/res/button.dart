import 'package:flutter/material.dart';
import 'package:syntech1/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final Color textColor;
  final IconData icon;
  const RoundButton(
      {Key? key,
      required this.icon,
      this.textColor = AppColors.whiteColor,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.5,
      child: MaterialButton(
        elevation: 10,
        color: AppColors.backgroundColor,
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.origionalwhiteColor),
            ),
            Icon(
              icon,
              color: AppColors.origionalwhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
