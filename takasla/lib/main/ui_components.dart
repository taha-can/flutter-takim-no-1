import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


//DefaultButtonType
class CustomButton extends Button{
  late HexColor? color;
  double width;
  var onPressed;
  var child;
  CustomButton({required this.onPressed, required this.child,required this.color,required this.width, });

}
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  get onPressed => null;
  get child => null;
  get color => null;
  double get width => 100;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed , child:child ,style: ButtonStyle(
      maximumSize: MaterialStateProperty.all(Size(width, 400)),
      backgroundColor: MaterialStateProperty.all(color!),

    ),);
  }
}


//DefaultInputType
class CustomInput extends Input{
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomInput({required this.color,required this.controller,required this.labelText,required this.isPassword,required this.maxlength});


}
class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  get labelText => null;
  get color => null;
  get controller => null;
  get isPassword => null;
  get maxlength => 100;



  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxlength,
      obscureText: isPassword,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color)),
        labelText: labelText,
        labelStyle: TextStyle(
          color: color,
        ),
      ),
      style: TextStyle(
        height: 0.9,
        color: Colors.black87,
      ),
      controller: controller,
    );
  }
}

//NumberDefaultInputType
class CustomNumberInput extends Input{
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomNumberInput({required this.color,required this.controller,required this.labelText,required this.isPassword,required this.maxlength});


}
class NumberInput extends StatelessWidget {
  const NumberInput({Key? key}) : super(key: key);

  get labelText => null;
  get color => null;
  get controller => null;
  get isPassword => null;
  get maxlength => 100;



  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxlength,
      obscureText: isPassword,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color)),
        labelText: labelText,
        labelStyle: TextStyle(
          color: color,
        ),
      ),
      style: TextStyle(
        height: 0.9,
        color: Colors.black87,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
