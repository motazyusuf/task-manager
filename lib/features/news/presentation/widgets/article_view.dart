import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/configs/theme/text_theme.dart';
import 'package:task_manager/core/constants/assets.dart';
import 'package:task_manager/core/widgets/space.dart';

import '../../data/models/news_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: article.urlToImage != null
                    ? NetworkImage(article.urlToImage!)
                    : const AssetImage(MyAssets.placeHolderImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            article.title,
            style: MyTextStyle.onBackgroundBold24,
          ),
        ],
      ),
    );
  }
}
