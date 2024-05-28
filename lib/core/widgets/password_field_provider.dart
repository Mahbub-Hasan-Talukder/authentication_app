import 'package:flutter/material.dart';

class PasswordFieldProvider extends StatefulWidget {
  final String text, hintText;
  TextEditingController? controller;
  dynamic onChanged;
   PasswordFieldProvider(
      {super.key, required this.text, required this.hintText, this.controller, this.onChanged});

  @override
  State<PasswordFieldProvider> createState() => _PasswordFieldProviderState();
}

class _PasswordFieldProviderState extends State<PasswordFieldProvider> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 360,
              child: TextField(
                onChanged: widget.onChanged,
                controller: widget.controller,
                obscureText: _obsecureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _obsecureText? const Icon(Icons.visibility) :const Icon( Icons.visibility_off),
                   onPressed: (){
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                   },
                    color: const Color(0xFFC1CAD0),
                  ),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC1CAD0),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC1CAD0),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF24786D),
                    ),
                  ),
                  
                ),
                
              ),
            ),
          ],
        ),
      ],
    );
  }
}
