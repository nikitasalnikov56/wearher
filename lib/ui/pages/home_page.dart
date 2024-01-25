import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/providers/weather_provider.dart';
import 'package:weather_app/ui/components/current_temp.dart';
import 'package:weather_app/ui/components/row_items.dart';
import 'package:weather_app/ui/components/sun_position.dart';
import 'package:weather_app/ui/components/week_day_items.dart';
import 'package:weather_app/ui/routes/app_routes.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return FutureBuilder(
        future: model.setUp(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: 60,
                  leadingWidth: 150,
                  leading: TextButton.icon(
                    onPressed: () {
                      model.setFavorite(context, cityName: model.currentCity);
                    },
                    icon: Icon(
                      Icons.location_on_sharp,
                      size: 30,
                      color: AppColors.white,
                    ),
                    label: Text(
                      model.currentCity,
                      style: AppStyle.fontStyle,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: IconButton(
                        onPressed: () {
                          context.go(AppRoutes.search);
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                body: const WeatherAppBody(),
              );
            default:
              return const SizedBox();
          }
        });
  }
}

class WeatherAppBody extends StatelessWidget {
  const WeatherAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(model.setBg()),
        ),
      ),
      padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              model.setCurrentDay(),
              style: AppStyle.fontStyle.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${model.currentDate} ${model.currentTime}',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            Image.network(
              model.iconData(),
              scale: 0.6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                model.getCurrentStatus(),
                textAlign: TextAlign.center,
                style: AppStyle.fontStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
            ),
            const CurrentTemp(),
            const SizedBox(height: 30),
            const RowItems(),
            const SizedBox(height: 28),
            const WeekDayItems(),
            const SizedBox(height: 20),
            const SunPosition(),
          ],
        ),
      ),
    );
  }
}
