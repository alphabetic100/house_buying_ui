// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/custom/border_box.dart';
import 'package:flutter_application_2/custom/option_button.dart';
import 'package:flutter_application_2/pages/house_details_page.dart';
import 'package:flutter_application_2/utils/constant.dart';
import 'package:flutter_application_2/utils/sample_data.dart';
import 'package:flutter_application_2/utils/widget_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var horizontalpadding = const EdgeInsets.symmetric(horizontal: 20);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(
                      padding: EdgeInsets.all(20),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.menu,
                        color: colorBlack,
                      ),
                    ),
                    BorderBox(
                      padding: EdgeInsets.all(20),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.settings,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: horizontalpadding,
                  child: const Text(
                    "City",
                    style: textStyle2,
                  ),
                ),
                addVirticalSpacing(10),
                Padding(
                  padding: horizontalpadding,
                  child: const Text(
                    "San Francisco",
                    style: textStyle1,
                  ),
                ),
                addVirticalSpacing(10),
                Padding(
                  padding: horizontalpadding,
                  child: Divider(
                    height: 5,
                    color: colorGray.withOpacity(0.5),
                  ),
                ),
                addVirticalSpacing(15),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ["\$200,000", "For Sale", "3-4 bed", ">1000 sqft"]
                        .map((filter) => ChoiceOption(text: filter))
                        .toList(),
                  ),
                ),
                addVirticalSpacing(20),
                Expanded(
                  child: Padding(
                    padding: horizontalpadding,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: reData.length,
                      itemBuilder: (context, index) {
                        return RealEstateItem(
                          itemData: reData[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            const Positioned(
                bottom: 20,
                child: OptionButton(
                  text: "text",
                  icon: Icons.map,
                  width: 120,
                ))
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption({super.key, required this.text});
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
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: const TextStyle(
          color: colorBlack,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  const RealEstateItem({
    Key? key,
    required this.itemData,
    required this.index,
  }) : super(key: key);
  final dynamic itemData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return HouseDetails(
            itemData: reData[index],
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(itemData["image"])),
                const Positioned(
                  top: 10,
                  right: 15,
                  child: BorderBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: colorwhite,
                    ),
                  ),
                ),
              ],
            ),
            addVirticalSpacing(10),
            Row(
              children: [
                Text(
                  "${itemData["amount"]}",
                  style: textStyle1,
                ),
                addHorizontalSpacing(10),
                Text(
                  "${itemData["address"]}",
                  style: const TextStyle(color: colorGray),
                ),
              ],
            ),
            addVirticalSpacing(10),
            Text(
              "${itemData["beadroom"]} / ${itemData["bathrooms"]} / ${itemData["area"]}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: colorBlack),
            )
          ],
        ),
      ),
    );
  }
}
