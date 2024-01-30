import 'package:flutter/material.dart';

class Cinput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final bool? isPassword;

  const Cinput({super.key, required this.icon, required this.placeholder, required this.textController, this.keyboardType, this.isPassword});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 5),
                    blurRadius: 5,
                  )
                ]),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              autocorrect: false,
              keyboardType: keyboardType,
              obscureText: isPassword ?? false,
              decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  //focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: placeholder),
            ),
          ),
        ],
      ),
    );
  }
}
