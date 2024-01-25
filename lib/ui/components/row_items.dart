import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/providers/weather_provider.dart';
import 'package:weather_app/ui/resources/app_icons.dart';
import 'package:weather_app/ui/style/app_style.dart';

class RowItems extends StatelessWidget {
  const RowItems({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherDescription(
          icon: AppIcons.humidity,
          text: 'humidity',
          values: '${model.humidity}%',
        ),
        WeatherDescription(
          icon: AppIcons.wind,
          text: 'WIND',
          values: '${model.windSpeed} km/h',
        ),
        WeatherDescription(
          icon: AppIcons.thermometer,
          text: 'FEELS LIKE',
          values: '${model.feelsLike}°',
        ),
      ],
    );
  }
}

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({
    super.key,
    required this.icon,
    required this.text,
    required this.values,
  });

  final String icon, text, values;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 4),
        Text(
          text.toUpperCase(),
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          values,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
