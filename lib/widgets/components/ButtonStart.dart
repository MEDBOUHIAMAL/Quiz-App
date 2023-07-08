import 'package:flutter/material.dart';

import '../../Used.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width=140,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(

      width:double.infinity ,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(colors: [Colors.deepOrange, Colors.cyanAccent]),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        elevation: 0,

        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(fontSize: 17,color: Colors.black),
        ),
      ),
    );
  }
}
