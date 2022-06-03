import 'package:flutter/material.dart';

class CommonAuthTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final Function()? onTap;
  CommonAuthTextField({
    required this.hinttext,
    Key? key,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 345,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          }
          return null;
        },
        onTap: onTap ?? () {},
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontFamily: 'Mulish',
            height: 1.25,
            fontWeight: FontWeight.w600,
            color: Color(
              0xffBEBEBE,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(14, 12, 0, 12),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff5EDE99), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen.shade50, width: 1),
          ),
        ),
      ),
    );
  }
}
