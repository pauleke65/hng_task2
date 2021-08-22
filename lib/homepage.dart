import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  RiveAnimationController _controller;
  bool nameSet = false;
  bool noName = false;

  /// Toggles between play and pause animation states

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation('Hover/Select', autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.05, horizontal: width * 0.05),
        child: Column(
          children: [
            Text(
              "HNG Task 2",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Container(
              height: noName ? 200 : 0,
              width: 200,
              child: RiveAnimation.asset(
                "assets/gift.riv",
              ),
            ),
            Container(
              height: noName ? 0 : 200,
              width: 200,
              child: RiveAnimation.asset(
                "assets/my_avatar.riv",
                stateMachines: ["state1"],
                controllers: [_controller],
              ),
            ),
            SizedBox(height: 20),
            nameSet
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            noName
                                ? "Your name is a gift. But,\nIt's one you can"
                                : "Nice to Meet You,",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(noName ? "Share" : nameController.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 20),
            Container(
                width: width * 0.9,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Your Name",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                )),
            MaterialButton(
              minWidth: width * 0.9,
              onPressed: () {
                setState(() {
                  if (nameController.text.trim() != "") {
                    noName = false;
                    nameSet = true;
                    _controller.isActive = true;
                  } else {
                    noName = true;
                    nameSet = true;
                  }
                });
              },
              child: Text("Submit"),
              color: Colors.yellow,
              height: 50,
              elevation: 0,
            ),
            SizedBox(height: 20),
            Text("brought to you by"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imageLinks(
                    image: 'assets/zuri.png', link: "https://zuri.team/"),
                imageLinks(image: 'assets/hng.png', link: "https://hng.tech/"),
                imageLinks(
                    image: 'assets/i4g.png', link: "https://ingressive.org/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

MaterialButton imageLinks({String image, String link}) {
  return MaterialButton(
    onPressed: () async {
      await canLaunch(link)
          ? await launch(link)
          : throw 'Could not launch $link';
    },
    child: Container(
      padding: EdgeInsets.all(10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(image),
    ),
  );
}
