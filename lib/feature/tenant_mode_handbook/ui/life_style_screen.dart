import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/common/route/routes.dart';
import 'article_detail_screen.dart';

class LifeStyleScreen extends StatefulWidget {
  @override
  _LifeStyleScreenState createState() => _LifeStyleScreenState();
}

class _LifeStyleScreenState extends State<LifeStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 5),
      itemCount: ListOption.listBook.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.articleDetailScreen,
                arguments: ArticleDetailScreen(
                  tag: '${ListOption.listBook[index]['image']}',
                ));
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: '${ListOption.listBook[index]['image']}',
                    child: Image.asset(
                      ListOption.listBook[index]['image'],
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 17,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ListOption.listBook[index]['selected'] =
                              !ListOption.listBook[index]['selected'];
                        });
                      },
                      child: Image.asset(
                        ListOption.listBook[index]['selected']
                            ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                            : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                        width: 22,
                        height: 20,
                        color: ListOption.listBook[index]['selected']
                            ? const Color(0xFFFC2F39)
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 24, right: 24, bottom: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Why Everyone Should Live In New York City ',
                        style: AppWidget.boldTextFieldStyle(
                            color: const Color(0xFF020433),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            height: 28),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'LIFESTYLE',
                          style: AppWidget.boldTextFieldStyle(
                              fontSize: 13,
                              height: 15.85,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF0F73EE)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: Text(
                            '·',
                            style: AppWidget.boldTextFieldStyle(
                                color: const Color.fromRGBO(64, 75, 105, 0.5),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                height: 17.07),
                          ),
                        ),
                        Text(
                          'Jun 24, 2018',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              fontSize: 13,
                              height: 15.85),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
