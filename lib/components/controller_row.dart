import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ValueController extends StatelessWidget {
  final Function onPlusPressed;
  final Function onMinusPressed;

  ValueController(
      {@required this.onPlusPressed, @required this.onMinusPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: onMinusPressed,
          child: Icon(FontAwesomeIcons.minus,
            color: Theme.of(context).accentColor,
          ),
          constraints: BoxConstraints.tightFor(width: 36, height: 36),
        ),
        SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          onPressed: onPlusPressed,
          child: Icon(FontAwesomeIcons.plus,
            color: Theme.of(context).accentColor,
          ),
          constraints: BoxConstraints.tightFor(width: 36, height: 36),
        ),
      ],
    );
  }
}
