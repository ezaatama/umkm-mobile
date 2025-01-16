import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umkm/utils/constant.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.inputFormatters,
      this.autoFocus = false,
      this.enabled,
      this.controller,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.onFieldSubmitted,
      this.hintText,
      this.labelText,
      this.hintStyle,
      this.textCapitalization = TextCapitalization.none,
      this.keyboardType,
      this.textInputAction,
      this.suffixIcon,
      this.prefix,
      this.obscureText = false,
      this.readOnly = false});

  final bool? autoFocus;
  final bool? enabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode = FocusNode();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      controller: widget.controller,
      autofocus: widget.autoFocus!,
      validator: widget.validator,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: ColorUI.PRIMARY,
      cursorWidth: 2,
      cursorHeight: 25,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 13),
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        fillColor: ColorUI.WHITE,
        filled: true,
        focusedBorder: widget.readOnly == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: ColorUI.GREY_BORDER))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 2, color: ColorUI.PRIMARY)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: ColorUI.GREY_BORDER)),
        hintText: widget.hintText,
        hintStyle: GREY_TEXT_STYLE.copyWith(fontSize: 14),
        labelText: widget.labelText,
        labelStyle: _focusNode!.hasFocus
            ? BLACK_TEXT_STYLE.copyWith(fontSize: 14)
            : GREY_TEXT_STYLE.copyWith(fontSize: 14),
      ),
      focusNode: _focusNode,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      onTap: _requestFocus,
    );
  }
}
