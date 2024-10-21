import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';

class MikuTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? prefix;
  final String? hintText;
  final double? tamanhoFonte;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool? enableInteractive;
  final Function()? onTap;
  final Function(String?)? submitFunc;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final int? maxLength;
  final String? initialValue;

  const MikuTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.prefix,
      this.tamanhoFonte,
      this.textInputType,
      this.hintText,
      this.enabled,
      this.enableInteractive,
      this.onTap,
      this.onSaved,
      this.focusNode,
      this.submitFunc,
      this.onChanged,
      this.maxLength,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      focusNode: focusNode,
      keyboardType: textInputType,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLength: maxLength,
      onFieldSubmitted: submitFunc,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2,
            horizontal: SizeConfig.heightMultiplier * 2),
        labelText: label,
        prefixText: prefix,
        hintText: hintText,
        counterText: "",
        hintStyle: const TextStyle(
          color: Color(0xFF86a182),
        ),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.corBorda, width: 3.5),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide:
              BorderSide(color: AppTheme.corBordaDisabilitada, width: 2.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        filled: true,
        fillColor: AppTheme.corContainer,
      ),
      enabled: enabled ?? true,
      enableInteractiveSelection: enableInteractive ?? true,
    );
  }
}
