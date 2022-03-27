import 'package:flutter/material.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Image",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.image),
                  label: Text("Gallery"))
            ],
          )
        ],
      ),
    );
  }
}
