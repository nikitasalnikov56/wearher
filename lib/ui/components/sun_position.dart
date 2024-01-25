import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/providers/weather_provider.dart';
import 'package:weather_app/ui/resources/app_icons.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class SunPosition extends StatelessWidget {
  const SunPosition({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 21),
      decoration: BoxDecoration(
        color: AppColors.weekDayBg.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SunItemInfo(
            icon: AppIcons.sunrise,
            text: 'Восход ${model.setSunrise()}',
          ),
          SunItemInfo(
            icon: AppIcons.sunset,
            text: 'Закат ${model.setSunset()}',
          ),
        ],
      ),
    );
  }
}

class SunItemInfo extends StatelessWidget {
  const SunItemInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: AppColors.white,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(fontSize: 16),
        )
      ],
    );
  }
}
