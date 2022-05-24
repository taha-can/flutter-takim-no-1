import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:takasla/main/constants.dart';

//DefaultButtonType
class CustomButton extends Button {
  late HexColor? color;
  double width;
  var onPressed;
  var child;
  CustomButton({
    required this.onPressed,
    required this.child,
    required this.color,
    required this.width,
  });
}
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  get onPressed => null;
  get child => null;
  get color => null;
  double get width => 100;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all(Size(width, 400)),
        backgroundColor: MaterialStateProperty.all(color!),
      ),
    );
  }
}

//DefaultInputType
class CustomInput extends Input {
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomInput(
      {required this.color,
      required this.controller,
      required this.labelText,
      required this.isPassword,
      required this.maxlength});
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
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
class CustomNumberInput extends NumberInput {
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomNumberInput(
      {required this.color,
      required this.controller,
      required this.labelText,
      required this.isPassword,
      required this.maxlength});
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
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
      keyboardType: TextInputType.numberWithOptions(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

//DefaultCardType
class CustomCard extends CardType {
  late String imageUrl;
  late String text;
  var onPressed;
  CustomCard(
      {required this.text, required this.imageUrl, required this.onPressed}) {}
}
class CardType extends StatelessWidget {
  const CardType({Key? key}) : super(key: key);
  String? get imageUrl => null;
  String? get text => null;
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: colorOfMainTheme, blurRadius: 10, spreadRadius: 0.2)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black26),
                fixedSize: MaterialStateProperty.all(Size(150, 100))),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl!,
                    width: 200,
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text!,
                      style: TextStyle(fontSize: 20, color: colorOfMainTheme),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.settings,
                      color: colorOfMainTheme,
                    )
                  ],
                ),
              ],
            )));
  }
}

//SearchInput
class CustomSearchInput extends InputSearch {
  late TextEditingController? controller;
  late HexColor? color;
  late String hintText;

  CustomSearchInput(
      {required this.color,
        required this.controller,
        required this.hintText,
      });
}
class InputSearch extends StatelessWidget {
  const InputSearch({Key? key}) : super(key: key);
  get hintText => null;
  get color => null;
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText ,
        hintStyle: TextStyle(color: colorOfMainTheme),
        counterText: "",
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: color)),
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


class CustomDateNumberInput extends NumberDateInput {
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomDateNumberInput(
      {required this.color,
        required this.controller,
        required this.labelText,
        required this.isPassword,
        required this.maxlength});
}
class NumberDateInput extends StatelessWidget {
  const NumberDateInput({Key? key}) : super(key: key);

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
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        _DateFormatter(),
    ]);

}}
class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 3) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Days cannot be greater than 31
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if (cLen == 4) {
      // Can only be 0 or 1
      if (int.parse(cText.substring(3, 4)) > 1) {
        // Remove char
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = cText.substring(0, 2) + '/';
      } else {
        // Insert / char
        cText =
            cText.substring(0, pLen) + '/' + cText.substring(pLen, pLen + 1);
      }
    } else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        // Replace char
        cText = cText.substring(0, 5) + '/';
      } else {
        // Insert / char
        cText = cText.substring(0, 5) + '/' + cText.substring(5, 6);
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}


class CustomInputDisabled extends Input {
  late TextEditingController controller;
  late HexColor? color;
  late String labelText;
  late bool isPassword;
  late int maxlength;

  CustomInputDisabled(
      {required this.color,
        required this.controller,
        required this.labelText,
        required this.isPassword,
        required this.maxlength});
}
class DisabledInput extends StatelessWidget {
  const DisabledInput({Key? key}) : super(key: key);

  get labelText => null;
  get color => null;
  get controller => null;
  get isPassword => null;
  get maxlength => 100;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      maxLength: maxlength,
      obscureText: isPassword,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: color)),
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




