import 'package:flutter/material.dart';

import 'Widgets/GeneralWidgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isScale = false;
  bool isanimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Switcher"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 2000),
                transitionBuilder:
                    (Widget child, Animation<double> animation) => isScale
                        ? ScaleTransition(
                            child: child,
                            scale: animation,
                          )
                        : RotationTransition(
                            child: child,
                            turns: animation,
                          ),
                child: _animatedSwitcherWidget(),
              ),
            ),
            heightSpacer(15),
            TextButton(
              child: Text("Rotate"),
              onPressed: () {
                setState(() {
                  isanimated = !isanimated;
                  isScale = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _animatedSwitcherWidget() {
    return isanimated ? buildPaidContainer() : buildPaymentContainer();
  }

  Widget buildpaymentButton(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(3.5),
          child: TextButton(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17.5,
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {
              setState(() {
                isanimated = !isanimated;
                isScale = true;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildPaidContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -50,
              left: 80,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    "Receipt",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
                heightSpacer(25),
                paymentText("Date", "Oct-23, 2020", Colors.grey),
                myDivider(1),
                paymentText("Status", "Paid", Colors.green),
                myDivider(1),
                heightSpacer(25),
                buildpaymentButton("Back"),
              ],
            ),
          ],
        ),
      ),
      key: UniqueKey(),
      width: 250,
      height: 300,
    );
  }

  Widget buildPaymentContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            heightSpacer(25),
            itemDesc("Grocery", 15),
            myDivider(1),
            itemDesc("Bills", 10),
            myDivider(1),
            itemDesc("Food", 20),
            myDivider(1),
            myTotal(45),
            heightSpacer(25),
            buildpaymentButton("Proceed Pay"),
          ],
        ),
      ),
      key: UniqueKey(),
      width: 250,
      height: 300,
    );
  }
}
