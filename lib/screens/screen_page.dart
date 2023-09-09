import 'package:cupertino_stor/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CupertinoColors.white,
          width: double.infinity,
          padding: EdgeInsets.only(top: 70, left: 11, bottom: 10, right: 11),
          child: CupertinoTextField(),
        ),
        Expanded(
          child: Container(
            height: 650,
            width: double.infinity,
            color: CupertinoColors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...Global.allProducts
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 5, bottom: 2.5, top: 2.5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(
                                      e['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['name'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "₹ ${e['price']}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: CupertinoColors.systemGrey2),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Global.allCarts.add(e);
                                      });
                                    },
                                    child: Icon(CupertinoIcons.add_circled),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              Divider(
                                color: CupertinoColors.systemGrey,
                                thickness: 0.5,
                                indent: 59,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
