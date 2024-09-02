/// Author: Shaik Mobin
/// Created on : 07/12/23

import"package:flutter/material.dart";
import "package:flutter/src/services/text_formatter.dart";

class CTextField extends StatelessWidget {
  TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  bool obscureText;
  bool? filled;
  int? maxLength;
  Widget? suffixIcon;
  Widget? suffix;
  String? initialValue;
  Color? textColor,cursorColor;
  TextStyle? hintStyle;
  TextAlign? textAlign;
  Color? fillColor;
  String? Function(String?)? validator;
  int? maxLines;

  final TextInputType? keyboardType;
  Function(dynamic value)? onSaved ;
  Null Function(String? value)? onChanged;
  List<TextInputFormatter>? inputFormatters;

  EdgeInsetsGeometry? contentPadding;


  CTextField(
      {
        super.key,
        this.controller,
        this.labelText,
        this.hintText,
        this.obscureText = false,
        this.validator,
        this.textColor,
        this.maxLength,
        this.fillColor,
        this.textAlign,
        this.filled,
        this.cursorColor,
        this.suffixIcon,
        this.hintStyle,
        this.contentPadding,
        this.suffix,
        this. keyboardType,  this.onSaved,  this.inputFormatters,  this.initialValue,  this.onChanged,this.maxLines
      }
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:initialValue,
      controller: controller,
      obscureText: obscureText,
      textAlign: textAlign??TextAlign.start,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLength: maxLength,
      cursorColor: cursorColor,
      maxLines: maxLines??1,
      validator: validator,keyboardType: keyboardType,
      style: TextStyle(color:textColor?? Colors.black),
      inputFormatters : inputFormatters,

      decoration: InputDecoration(

        labelText: labelText,
        counterText: maxLength!=null?"":null,

        hintText: hintText,
        filled: filled,


        fillColor: fillColor,

        contentPadding: contentPadding?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintStyle: hintStyle?? TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.6),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.6),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),

        suffix: suffix!=null?
        suffix
            : null,
        suffixIcon: suffixIcon!=null?
        suffixIcon
            : null,
      ),
    );
  }

}
