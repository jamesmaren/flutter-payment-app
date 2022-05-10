import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/controllers/data_controller.dart';
import 'package:flutter_payment_app/pages/payment_page.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:flutter_payment_app/widgets/text_size.dart';
import 'package:get/get.dart';

import '../widgets/large_buttons.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  final DataController _controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        width: w,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              } else {
                return _listbills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 50,
      bottom: 8,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
              barrierColor: Colors.transparent,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 295,
                            )),
                        Positioned(
                            right: 53,
                            top: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 25),
                              width: 54,
                              height: 220,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(29)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppButtons(
                                        icon: Icons.cancel,
                                        iconColor: AppColor.mainColor,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.white,
                                        onTap: () {
                                          Navigator.pop(context);
                                        }),
                                    AppButtons(
                                      icon: Icons.add,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {},
                                      text: "Add Bill",
                                    ),
                                    AppButtons(
                                      icon: Icons.history,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {},
                                      text: "History",
                                    ),
                                  ]),
                            ))
                      ],
                    ));
              });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/lines.png")),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0, 1),
                    color: Color(0xFF11324d).withOpacity(0.2))
              ]),
        ),
      ),
    );
  }

  _mainBackground() {
    return Positioned(
        top: 0,
        bottom: 10,
        left: 0,
        child: Container(
          height: 290,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.png"))),
        ));
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: 7,
      bottom: 10,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("images/curve.png"))),
          )),
    );
  }

  _listbills() {
    return Positioned(
        top: 300,
        left: 0,
        right: 0,
        bottom: 30,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: _controller.list.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                height: 130,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10)
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.grey,
                                    ),
                                    image: DecorationImage(image: AssetImage(
                                        // _controller.list[index]["img"]
                                        "images/brand1.png")),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 15,
                                          offset: Offset(0, 1),
                                          color: Color(0xFF11324d)
                                              .withOpacity(0.2))
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _controller.list[index]["brand_name"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ID:845678",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.idColor,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedText(
                              text: _controller.list[index]["due_info"],
                              color: AppColor.green),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.list[index]["status"] =
                                      !_controller.list[index]["status"];

                                  print(_controller.list[index]["status"]);
                                  _controller.list.refresh();
                                  print(_controller.newlist.length);
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _controller.list[index]
                                                  ["status"] ==
                                              false
                                          ? AppColor.selectBackground
                                          : AppColor.green),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          color: _controller.list[index]
                                                      ["status"] ==
                                                  false
                                              ? AppColor.selectColor
                                              : Colors.white,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text("\$" + "{$_controller.list[index]['due']}",
                                  style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900)),
                              Text("Due in 3 days",
                                  style: TextStyle(
                                      color: AppColor.idColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  _payButton() {
    return Positioned(
        bottom: -10,
        child: AppLargeButton(
          text: "Pay All Bills",
          textColor: Colors.white,
          onTap: () {
            Get.to(() => PaymentPage());
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 70,
                color: Color(0xFF293952),
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
