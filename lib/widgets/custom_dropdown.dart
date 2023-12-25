import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String text;
  final List<String> list;
  final void Function(String?)? onChanged;
  final String? value;
  const CustomDropDown(
      {super.key,
      required this.text,
      required this.list,
      this.onChanged,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isDense: true,
            hint: const Text("Pilih"),
            // value: value,
            value: value,
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.redAccent,
              ),
            ),
            buttonStyleData: ButtonStyleData(
              height: 40,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
            ),
            onChanged: onChanged,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
