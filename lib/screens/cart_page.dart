import 'package:cupertino_stor/global.dart';
import 'package:flutter/cupertino.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String selectedMonth = 'August';
  String period = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: CupertinoColors.white,
          width: double.infinity,
          padding: EdgeInsets.only(top: 70, left: 11, bottom: 10),
          child: Text(
            'Shopping Cart',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.black),
          ),
        ),
        Expanded(
          child: Container(
            color: CupertinoColors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.person_alt,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(width: 10),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.mail,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(width: 10),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.location,
                      color: CupertinoColors.systemGrey2,
                    ),
                    SizedBox(width: 10),
                    Expanded(child: CupertinoTextField()),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Container(
                        height: 220,
                        color: CupertinoColors.white,
                        child: CupertinoDatePicker(
                          initialDateTime: currentDate,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              currentDate = dateTime;
                              if (currentDate.hour > 11) {
                                period = "PM";
                              } else {
                                period = "AM";
                              }
                              currentDate = dateTime;
                              if (currentDate.month == 1) {
                                selectedMonth = "January";
                              } else if (currentDate.month == 2) {
                                selectedMonth = "February";
                              } else if (currentDate.month == 3) {
                                selectedMonth = "March";
                              } else if (currentDate.month == 4) {
                                selectedMonth = "April";
                              } else if (currentDate.month == 5) {
                                selectedMonth = "May";
                              } else if (currentDate.month == 6) {
                                selectedMonth = "Jun";
                              } else if (currentDate.month == 7) {
                                selectedMonth = "July";
                              } else if (currentDate.month == 8) {
                                selectedMonth = "August";
                              } else if (currentDate.month == 9) {
                                selectedMonth = "September";
                              } else if (currentDate.month == 10) {
                                selectedMonth = "October";
                              } else if (currentDate.month == 11) {
                                selectedMonth = "November";
                              } else if (currentDate.month == 12) {
                                selectedMonth = "December";
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.time,
                          color: CupertinoColors.systemGrey2),
                      SizedBox(width: 10),
                      Text('Delivery time'),
                      Spacer(),
                      Text(
                          '$selectedMonth ${currentDate.day},${currentDate.year}${currentDate.hour}'),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    ...Global.allCarts
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
                                    SizedBox(width: 10),
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
                                              color:
                                                  CupertinoColors.systemGrey2),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      "₹ ${e['price']}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Shipping ₹95 ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.systemGrey),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Tax ₹${Global.gst}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.systemGrey),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Total ₹${Global.total} ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
