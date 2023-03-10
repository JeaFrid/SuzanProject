import 'package:flutter/material.dart';
import 'package:gokhan_cv/theme/color.dart';
import 'package:jeafriday/jeafwidget.dart';

class HomePageListView extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;
  final String subtitle;
  final String image;
  final String id;
  const HomePageListView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.id,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          width: constraints.maxWidth / 2,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          "https://raw.githubusercontent.com/JeaFrid/ByBugWeb/master/assets/images/product.jpg",
                          width: constraints.maxWidth / 4,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: constraints.maxWidth / 4 * 3 - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const JeaText(
                                      text: "Başlık - 1",
                                      //selectable: true,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      maxLines: 10,
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ThemeColors.pColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const JeaText(
                                text:
                                    "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text ",
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
