import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour,this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}





class ContentCard extends StatelessWidget {
  ContentCard({@required this.icon, this.textIcon});
  final IconData icon;
  final String textIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textIcon,
          style: styleText,
        )
      ],
    );
  }
}


Function peso(){

}