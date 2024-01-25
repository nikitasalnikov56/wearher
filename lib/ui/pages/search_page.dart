import 'package:flutter/material.dart';
import 'package:weather_app/ui/components/favorite_list.dart';
import 'package:weather_app/ui/components/search_appbar.dart';
import 'package:weather_app/ui/style/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.purple,
              AppColors.darkBlue,
              AppColors.mediumBlue,
              AppColors.darkBlue,
              AppColors.purple,
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAppbar(),
            SizedBox(height: 25),
            FavoriteList(),
          ],
        ),
      ),
    );
  }
}
