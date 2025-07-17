import 'package:flutter/material.dart';

class LKTextField extends StatelessWidget {
  final String label;
  final TextEditingController? ctrl;
  const LKTextField({
    required this.label,
    this.ctrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: ctrl,
              decoration: InputDecoration(
                hintText: '',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                enabledBorder: _buildInputBorder(color: Colors.greenAccent.withOpacity(0.2)),
                focusedBorder: _buildInputBorder(color: Colors.greenAccent),
                errorBorder: _buildInputBorder(color: Colors.red),
                focusedErrorBorder: _buildInputBorder(color: Colors.red),
              ),
              keyboardType: TextInputType.url,
              autocorrect: false,
            ),
          ),
        ],
      );
  OutlineInputBorder _buildInputBorder({Color color = Colors.transparent}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }
}
