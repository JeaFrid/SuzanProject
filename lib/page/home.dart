import 'package:flutter/material.dart';
import 'package:gokhan_cv/controller/home_controller.dart';
import 'package:gokhan_cv/theme/color.dart';
import 'package:get/get.dart';
import 'package:gokhan_cv/widget/listview.dart';
import 'package:jeafriday/jeafwidget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    homePageController.width.value = MediaQuery.of(context).size.width;
    homePageController.height.value = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColors.bgColor,
      body: Stack(
        children: [
          stackAppBar(),
          SizedBox(
            width: homePageController.width.value,
            height: homePageController.height.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                drawer(),
                Expanded(
                  child: Column(
                    children: [
                      appBarMethod(),
                      content(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded content() {
    return Expanded(
      child: JeaVerticalScrollView(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: homePageController.width.value < 565
                              ? false
                              : true,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: 565,
                            height: 100,
                            decoration: BoxDecoration(
                              color: ThemeColors.ccColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    info(ThemeColors.gColor),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: constraints.maxHeight - 10,
                                      width: 2,
                                      color: Colors.white12,
                                    ),
                                    info(ThemeColors.pColor),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: constraints.maxHeight - 10,
                                      width: 2,
                                      color: Colors.white12,
                                    ),
                                    info(Colors.orange),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 400,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ThemeColors.ccColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            JeaText(
                              text: "Udemy",
                              fontSize: 14,
                              textColor: Colors.white70,
                              textAlign: TextAlign.left,
                            ),
                            JeaText(
                              text: "%50 INDIRIM KODU",
                              fontSize: 20,
                              textColor: Colors.purpleAccent,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.bold,
                            ),
                            JeaText(
                              text: "Sıfırdan Uzmanlığa Canva Eğitimi",
                              fontSize: 14,
                              textColor: Colors.white70,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  HomePageListView(
                    title: "title",
                    subtitle: "subtitle",
                    image: "image",
                    id: "id",
                    constraints: constraints,
                  ),
                  HomePageListView(
                    title: "title",
                    subtitle: "subtitle",
                    constraints: constraints,
                    image: "image",
                    id: "id",
                  ),
                  HomePageListView(
                    title: "title",
                    subtitle: "subtitle",
                    constraints: constraints,
                    image: "image",
                    id: "id",
                  ),
                  HomePageListView(
                    title: "title",
                    constraints: constraints,
                    subtitle: "subtitle",
                    image: "image",
                    id: "id",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container appBarMethod() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: ThemeColors.navbgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return homePageController.width.value < 565
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColors.pColor,
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: ThemeColors.pColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: const [
                                JeaText(
                                  text: "Teklif Al",
                                  textColor: Colors.white,
                                  marginAll: 8,
                                  fontSize: 14,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                  left: 16.0,
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white70,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container drawer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.navbgColor,
      ),
      width: 300,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints p2) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      JeaText(
                        text: "Gökhan Hayta",
                        fontSize: 23,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w300,
                      )
                    ],
                  ),
                ),
              ),
              JeaVerticalScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.network(
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                                width: p2.maxWidth * 0.7),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SizedBox(),
                            Icon(Icons.whatshot,
                                color: Colors.white70, size: 30),
                            Icon(Icons.whatshot,
                                color: Colors.white70, size: 30),
                            Icon(Icons.whatshot,
                                color: Colors.white70, size: 30),
                            Icon(Icons.whatshot,
                                color: Colors.white70, size: 30),
                            Icon(Icons.whatshot,
                                color: Colors.white70, size: 30),
                            SizedBox(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, right: 8, bottom: 5),
                        child: JeaText(
                          text:
                              "DFDFGDFGHDFSGD  FGHFDHFDGHD FDGHFDHFGDFGH HFGHDFDFHDF GDFGHDFGHDFHDFG DFHDFHDFHF HDFGHFDHFDH FDGHDFHDFHFDGH DFGHDFGHDFH FGH FGHDFHFHDFGHDFHFG",
                          fontSize: 14,
                          textColor: Colors.white70,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: Colors.white24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container stackAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: ThemeColors.navbgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return homePageController.width.value < 565
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColors.pColor,
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: ThemeColors.pColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: const [
                                JeaText(
                                  text: "Teklif Al",
                                  textColor: Colors.white,
                                  marginAll: 8,
                                  fontSize: 14,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                  left: 16.0,
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white70,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding info(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JeaText(
                text: "asdasdsdas",
                textColor: Colors.white70,
                fontSize: 12,
                marginAll: 2,
              ),
              JeaText(
                text: "asdasdsdas",
                textColor: color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                marginAll: 2,
              ),
              const JeaText(
                text: "asdasdsdas",
                textColor: Colors.white70,
                fontSize: 12,
                marginAll: 2,
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
