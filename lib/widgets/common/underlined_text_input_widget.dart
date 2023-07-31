import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/theme.dart';

class UnderlinedTextInputWidget extends StatefulWidget {
  final String hintText;
  final String Function(String text) onChanged;
  const UnderlinedTextInputWidget(
      {super.key, required this.hintText, required this.onChanged});

  @override
  State<UnderlinedTextInputWidget> createState() =>
      _UnderlinedTextInputWidgetState();
}

class _UnderlinedTextInputWidgetState extends State<UnderlinedTextInputWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CustomTextStyle.createComInputPlaceholder,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD0D0D0)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          style: CustomTextStyle.createComInputText,
          onChanged: (String val) {
            widget.onChanged(val);
          },
        ),
      ],
    );
  }
}
