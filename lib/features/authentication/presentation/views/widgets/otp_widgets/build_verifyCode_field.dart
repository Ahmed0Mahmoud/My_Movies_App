import 'package:flutter/material.dart';

class BuildVfCodeField extends StatelessWidget {
  const BuildVfCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
