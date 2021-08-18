import 'package:flutter/material.dart';
import 'package:hng_task2/details.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController bookController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.only(
          top: height * 0.05,
        ),
        child: Column(
          children: [
            Text(
              "HNG Task 2",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("brought to you by"),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            textFieldStyle(
                labelText: "Your Name",
                width: width,
                controller: nameController),
            textFieldStyle(
                labelText: "Favorite Color",
                width: width,
                controller: colorController),
            textFieldStyle(
                labelText: "Favorite Book",
                width: width,
                controller: bookController),
            textFieldStyle(
                labelText: "Favorite Food",
                width: width,
                controller: foodController),
            SizedBox(height: 20),
            MaterialButton(
              minWidth: width * 0.9,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(
                            name: nameController.text.trim(),
                            color: colorController.text.trim(),
                            book: bookController.text.trim(),
                            food: foodController.text.trim())));
              },
              child: Text("Submit"),
              color: Colors.white,
              highlightColor: Colors.blue,
              height: 50,
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
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(image),
    ),
  );
}

Container textFieldStyle(
    {String labelText, double width, TextEditingController controller}) {
  return Container(
      width: width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
      ));
}
