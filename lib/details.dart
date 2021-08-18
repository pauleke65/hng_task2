import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key key, this.name, this.color, this.book, this.food})
      : super(key: key);
  final String name;
  final String color;
  final String book;
  final String food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Here's what you told me",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          SizedBox(height: 20),
          name == ""
              ? Text("You chose to remain 🥷")
              : RichText(
                  text: TextSpan(
                      text: "You are ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ]),
                ),
          SizedBox(height: 20),
          color == ""
              ? Text("Who likes colors anyways?🤷‍♂️")
              : RichText(
                  text: TextSpan(
                      text: "You love ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: color,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ]),
                ),
          SizedBox(height: 20),
          book == ""
              ? Text("Book, what is this \"book\"?🤨")
              : RichText(
                  text: TextSpan(
                      text: "Greatest book you've read is ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: book,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ]),
                ),
          SizedBox(height: 20),
          food == ""
              ? Text("And food is for the weak💪")
              : RichText(
                  text: TextSpan(
                      text: "There's nothing better than ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: food,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ]),
                ),
        ]),
      )),
    );
  }
}
