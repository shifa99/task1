import 'package:flutter/material.dart';
import 'package:task1/Models/Adaptive.dart';

class BuildSearch extends StatefulWidget {
  @override
  _BuildSearchState createState() => _BuildSearchState();
}

class _BuildSearchState extends State<BuildSearch> {
  String search;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xff77CDEB),
          height: MediaQuery.of(context).size.height * 0.165 - getSize(context),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (search != null) print(search);
                  },
                )),
            onChanged: (name) {
              search = name;
              print(search);
            },
            onFieldSubmitted: (name) {
              print('sub' + name);
            },
          ),
        )
      ],
    );
  }
}
