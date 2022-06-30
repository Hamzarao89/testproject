import 'package:flutter/material.dart';
import 'package:syntech1/res/color.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final IconData icon;
  final String? invalidMsg;
  final TextInputType inputType;
  final bool obsure;
  final Function validator;
  final Function? onChanged;
  CustomTextField(
      {required this.title,
      required this.controller,
      required this.icon,
      required this.inputType,
      this.obsure = false,
      required this.validator,
      this.onChanged,
      this.invalidMsg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppColors.lightGreyColor, blurRadius: 3.0, spreadRadius: 0.8)
      ]),
      child: TextFormField(
        obscureText: obsure,
        keyboardType: inputType,
        decoration: InputDecoration(
            hintText: title,
            suffixIcon: Icon(
              icon,
              color: AppColors.backgroundColor,
            ),
            border: const OutlineInputBorder()),
        controller: controller,
      ),
    );
  }
}
