import 'package:flutter/material.dart';

class CustomTextFormFieldComments extends StatelessWidget {
  const CustomTextFormFieldComments({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF3F3F3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
  }
}