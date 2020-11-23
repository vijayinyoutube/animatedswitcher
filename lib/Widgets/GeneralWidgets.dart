import 'package:flutter/material.dart';


Widget myDivider(int thickness) {
  return Divider(
    thickness: 1,
  );
}

Widget itemDesc(String itemName, int amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        itemName,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      Text(
        "\$${(amount)}",
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

Widget myTotal(int total) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Total",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      Text(
        "\$${(total)}",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    ],
  );
}

heightSpacer(double myheight) {
  return SizedBox(height: myheight);
}

widthSpacer(double mywidth) {
  return SizedBox(width: mywidth);
}

Widget paymentText(String title, String subtitle, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: color,
        ),
      ),
    ],
  );
}


