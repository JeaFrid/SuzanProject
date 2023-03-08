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
    return Scaffold(
      backgroundColor: ThemeColors.bgColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: ThemeColors.ccColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => JeaText(
                    text: homePageController.width.toString(),
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
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
          ),
          Expanded(
            child: JeaVerticalScrollView(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Visibility(
                        visible:
                            homePageController.width.value < 565 ? false : true,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
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
                                    MainAxisAlignment.spaceBetween,
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
                    const HomePageListView(
                      title: "title",
                      subtitle: "subtitle",
                      image: "image",
                      id: "id",
                    ),
                    const HomePageListView(
                      title: "title",
                      subtitle: "subtitle",
                      image: "image",
                      id: "id",
                    ),
                    const HomePageListView(
                      title: "title",
                      subtitle: "subtitle",
                      image: "image",
                      id: "id",
                    ),
                    const HomePageListView(
                      title: "title",
                      subtitle: "subtitle",
                      image: "image",
                      id: "id",
                    ),
                  ],
                ),
              ),
            ),
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
