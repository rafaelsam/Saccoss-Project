import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saccos/loan/paymentpanel.dart';
// import 'package:saccos_android/loan/paymentpanel.dart';

class Loanfragment extends StatefulWidget {
  const Loanfragment({super.key});

  @override
  State<Loanfragment> createState() => _LoanfragmentState();
}

class _LoanfragmentState extends State<Loanfragment> {
  @override
  void initState() {
    super.initState();
  }

  void navigationPage(String route) {
    switch (route) {
      case "payment":
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => PaymentPanel(),
          ),
          (route) => true, //if you want to disable back feature set to false
        );
        break;
      case "settings":
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Container(),
          ),
          (route) => true, //if you want to disable back feature set to false
        );
        break;
    }

    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => CameraScreen ()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                padding: EdgeInsets.all(20),
                width: 400.0,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 100,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("The amount of loan remain",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 84, 110, 123))),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Tsh 300,000/-",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 63, 81, 181))),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed('/payment');
                              },
                              child: Text("I want to borrow"))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Card(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Visit our website for information",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 84, 110, 123))),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.open_in_new,
                      color: Color.fromARGB(255, 63, 81, 181),
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 170,
          child: CarouselChangeState(),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => navigationPage("payment"),
              child: Container(
                width: 150,
                height: 100,
                alignment: const Alignment(0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/saccoss.webp",),
                      fit: BoxFit.fitWidth,
                      opacity: .1,
                    ),
                    color: Color.fromARGB(255, 63, 81, 181),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(right: 15),
                        child:
                            Icon(Icons.payment, size: 40, color: Colors.white)),
                    Text('PAYMENT',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSans")),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => navigationPage("SETTINGS"),
              child: Container(
                width: 150,
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/saccoss.webp",),
                      fit: BoxFit.fitWidth,
                      opacity: .1,
                    ),
                    color: Color.fromARGB(255, 63, 81, 181),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.settings,
                            size: 40, color: Colors.white)),
                    Text('SETTINGS',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSans"))
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

final List<Widget> containerList = [
  Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child:  Column(children: [
        Image.asset(
          "assets/images/saccoss.webp",
          fit: BoxFit.contain,
          width: 150,
          height: 120,
        ),
        Padding(
            padding: EdgeInsets.all(5),
            child: Text("Rapid Loans",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 81, 181)))),
      ])),
  Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        Image.asset(
          "assets/images/saccoss.webp",
          fit: BoxFit.contain,
          width: 150,
          height: 120,
        ),
        const Padding(
            padding: EdgeInsets.all(5),
            child: Text("Easy Payment",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 81, 181)))),
      ])),
  Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        Image.asset(
        "assets/images/saccoss.webp",
          fit: BoxFit.contain,
          width: 150,
          height: 120,
        ),
        const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "Lower rates",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 81, 181)),
            )),
      ])),
];

Widget CarouselChangeState() {
  final CarouselController controller = CarouselController();
  return Column(
    children: <Widget>[
      Expanded(
        child: CarouselSlider(
          items: containerList,
          options: CarouselOptions(
            autoPlay: true,
          ),
          carouselController: controller,
        ),
      ),
    ],
  );
}
