import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/custom/border_box.dart';
import 'package:flutter_application_2/custom/option_button.dart';
import 'package:flutter_application_2/utils/constant.dart';
import 'package:flutter_application_2/utils/widget_functions.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({
    super.key,
    required this.itemData,
  });
  final dynamic itemData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          itemData["image"],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const BorderBox(
                          padding: EdgeInsets.all(20),
                          height: 50,
                          width: 50,
                          child: Icon(
                            CupertinoIcons.back,
                            color: colorwhite,
                          ),
                        ),
                      ),
                      const BorderBox(
                        padding: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.favorite_border,
                          color: colorwhite,
                        ),
                      )
                    ],
                  ))
                ],
              ),
              addVirticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemData["amount"],
                          style: textStyle1,
                        ),
                        addVirticalSpacing(5),
                        Text(
                          itemData["address"],
                          style: textStyle2,
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorGray.withAlpha(45),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "20 hour ago",
                          style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              addVirticalSpacing(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "House Information",
                  style: TextStyle(
                    fontSize: 20,
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: Center(
                          child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InfoItem(
                                  index: index,
                                  itemdata: itemData,
                                );
                              }),
                        ),
                      ),
                      addVirticalSpacing(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          itemData["description"],
                          style:
                              const TextStyle(color: colorGray, fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const OptionButton(
                      text: "massage",
                      icon: Icons.message,
                      width: 170,
                    ),
                    addHorizontalSpacing(10),
                    const OptionButton(
                      text: "call",
                      icon: Icons.call,
                      width: 170,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    ));
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.itemdata, required this.index});
  final dynamic itemdata;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorGray.withAlpha(35),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Text(
          itemdata[textKey(index)],
          style: const TextStyle(
            color: colorBlack,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

String textKey(int index) {
  if (index == 0) {
    return "amount";
  } else if (index == 1) {
    return "beadroom";
  } else if (index == 2) {
    return "bathrooms";
  } else if (index == 3) {
    return "area";
  } else {
    return "garage";
  }
}
