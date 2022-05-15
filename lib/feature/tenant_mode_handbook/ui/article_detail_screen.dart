import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

import '../widget/sab_article_detail_widget.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SabArticleDetailWidget(
            tag: tag,
            height: height,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  SizedBox(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Why Everyone Should Live In New York City ',
                                style: AppWidget.boldTextFieldStyle(
                                    color: const Color(0xFF020433),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    height: 34),
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
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 8),
                                  child: Text(
                                    '·',
                                    style: AppWidget.boldTextFieldStyle(
                                        color: const Color.fromRGBO(
                                            64, 75, 105, 0.5),
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
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                '- - -',
                                style: AppWidget.simpleTextFieldStyle(
                                    fontSize: 14,
                                    height: 24,
                                    color: const Color(0xFF020433)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                'I slept in a laundry room for \$350 a month. '
                                'I had no fashion sense whatsoever. ',
                                style: AppWidget.simpleTextFieldStyle(
                                    fontSize: 14,
                                    height: 24,
                                    color: const Color(0xFF020433)),
                              ),
                            ),
                            Text(
                              'I was 22 years old and making \$12,000 a year in San Francisco, CA. '
                              'I really did sleep in a laundry room for \$350 a month. '
                              'I covered the washer and dryer with Peruvian ponchos. I taught for Americorps. '
                              'I loved my students and my life. And then late one night, '
                              'I saw my favorite student eating out of the trash. '
                              'I later learned her family was under water with debt and totally broke. '
                              'They lived in the projects and the food stamp money ran out weeks ago. '
                              'It did not seem fair that a 13 year old was sent out to find food from the dumpsters in the Mission. '
                              'Everyone always asks me why I went to law school.',
                              style: AppWidget.simpleTextFieldStyle(
                                  fontSize: 14,
                                  height: 24,
                                  color: const Color(0xFF020433)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
