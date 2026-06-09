


import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  const TextFormFieldLogin({super.key, required this.controller, this.obscureText, this.suffixIcon, this.validator,  this.keyboard, required this.hintText, required this.preffixIcon, this.onChanged, required this.focusNode, this.onFieldSubmitted});

  final TextEditingController controller;
  final bool? obscureText; 
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final String hintText;
  final Widget preffixIcon;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    const  style = TextStyle( color: Colors.white);
    const kHintTextStyle = TextStyle(color: Colors.white54,);
    final kBoxDecorationStyle = BoxDecoration(
                                    // color: const Color(0xFF6CA8F1),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6.0,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                );
    
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
              focusNode: focusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Colors.white,
              controller: controller,
              style: style,
              obscureText: obscureText ?? false,
              keyboardType: keyboard,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric( vertical: 20, horizontal: 5),
                border: InputBorder.none,
                hintStyle: kHintTextStyle,
                hintText: hintText,
                prefixIcon: preffixIcon,
                errorStyle:  const TextStyle(color:  Color(0xFFEF4444), fontWeight: FontWeight.w300),
                suffixIcon: suffixIcon
              ),
              validator: validator,
            ),
    );
  }
}