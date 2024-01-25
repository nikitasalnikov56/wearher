import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/providers/weather_provider.dart';
import 'package:weather_app/ui/routes/app_routes.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            ),
          ),
          AnimatedTextField(model: model),
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            onPressed: () {
              model.openField();
            },
            icon: Icon(
              Icons.search,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    super.key,
    required this.model,
  });

  final WeatherProvider model;

  @override
  Widget build(BuildContext context) {
    return model.isActive
        ? Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 40,
              child: TextField(
                controller: model.searchController,
                onSubmitted: (value) {
                  model.setCurrentCity(context);
                },
                decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  hintText: 'Location...',
                  hintStyle: AppStyle.fontStyle.copyWith(
                    color: AppColors.weekDayBg.withOpacity(0.6),
                    fontSize: 16,
                    shadows: [],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          )
        : Text(
            'Saved Locations',
            style: AppStyle.fontStyle,
            textAlign: TextAlign.center,
          );
  }
}
