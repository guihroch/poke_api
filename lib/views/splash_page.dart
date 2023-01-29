import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/constans/app_assets.dart';
import 'package:pokemon_api/constans/app_named_routes.dart';
import '../constans/app_colors.dart';
import '../constans/app_constants.dart';
import '../constans/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(AppAssets.IMAGE_SPLASH_PAGE),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    AppAssets.LOGO,
                    width: 110,
                    height: 110,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppConstants.TEXT_SPLASH_PAGE_1,
                      style: AppTextStyles.NUNITO_700_BIG
                          .copyWith(color: AppColors.DARK_BLUE),
                    ),
                    TextSpan(
                      text: AppConstants.TEXT_SPLASH_PAGE_2,
                      style: AppTextStyles.NUNITO_600_BIG
                          .copyWith(color: AppColors.LIGHT_PINK),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppConstants.TEXT_SPLASH_PAGE_3,
              style: AppTextStyles.NUNITO_400_MEDIUM
                  .copyWith(color: AppColors.DARK_BLUE),
            ),
            DropShadow(
              offset: const Offset(0.0, 5),
              blurRadius: 5,
              spread: 0,
              child: Container(
                height: 43,
                width: 226,
                margin: const EdgeInsets.only(
                    top: 19, left: 70, right: 79, bottom: 50),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.LIGHT_PINK),
                  onPressed: () {
                    Modular.to.navigate(AppNamedRoutes.homePage);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          AppConstants.START_BUTTON,
                          style: AppTextStyles.NUNITO_700_MEDIUM,
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.keyboard_arrow_right_sharp),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
