import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final VoidCallback onTap;
 final IconData? icon ;
 final String  text;
 final Color? backgroundColor;
 final TextStyle? textStyle;
 final Color? IconColor;
  const CustomButton({super.key, required this.text, this.icon, required this.onTap , this.backgroundColor,this.textStyle, this.IconColor});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(),
          color: backgroundColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: IconColor,),
            const SizedBox(width: 10,),
            Text(text, style: textStyle)
          ],
        ),
      ),
    );
  }
}
