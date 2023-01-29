import 'package:flutter/material.dart';
import 'package:pokemon_api/Widgets/custom_bottom_navigation.dart';
import 'package:pokemon_api/Widgets/custom_bottom_navigation_bar_item.dart';

import 'package:pokemon_api/constans/app_assets.dart';

import 'package:pokemon_api/controllers/poke_controller.dart';

import 'package:pokemon_api/repositories/poke_repository.dart';
import '../Widgets/custom_container.dart';
import '../Widgets/custom_future_builder.dart';
import '../constans/app_colors.dart';
import '../constans/app_constants.dart';
import '../constans/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var indexAtual = 0;
  final _pokeController = PokeController(PokeRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLLOR,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppColors.BLACK,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  AppAssets.CIRCLE_AVATAR,
                ),
                radius: 14,
              ),
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(right: 50, top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 70, top: 35),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image.asset(
                AppAssets.LOGO,
                height: 110,
                width: 130,
              ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.centerRight,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 160,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.WHITE_PINK,
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 14, top: 27),
                          child: Text(
                            AppConstants.TEXT_HOME_PAGE_1,
                            style: AppTextStyles.NUNITO_700_MEDIUM
                                .copyWith(color: AppColors.DARK_BLUE),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, top: 5),
                              child: Text(
                                AppConstants.TEXT_HOME_PAGE_2,
                                style: AppTextStyles.NUNITO_400_LOW
                                    .copyWith(color: AppColors.DARK_BLUE),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 31,
                              width: 122.6,
                              margin: const EdgeInsets.only(
                                left: 14,
                                bottom: 0,
                              ),
                              color: Colors.white,
                              child: TextField(
                                controller: _pokeController.controllerText,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: GestureDetector(
                                onTap: _pokeController.searchPokemon,
                                child: Container(
                                  height: 31,
                                  width: 40.4,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    color: AppColors.LIGHT_PINK,
                                  ),
                                  child: Image.asset(AppAssets.IMAGE_SEARCH),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 32, top: 32, bottom: 32),
                    child: SizedBox(
                      height: 86,
                      width: 86,
                      child: Image.asset(AppAssets.IMAGE_PIKACHU,
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 175, top: 19),
              child: Text(
                AppConstants.TEXT_HOME_PAGE_3,
                style: AppTextStyles.NUNITO_700_LOW
                    .copyWith(color: AppColors.DARK_BLUE),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Container(
                      height: 24,
                      width: 66.95,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: AppColors.LIGHT_PINK,
                      ),
                      child: Center(
                        child: Text(
                          AppConstants.FIRE_TYPE,
                          style: AppTextStyles.NUNITO_400_LOW
                              .copyWith(color: AppColors.BACKGROUND_COLLOR),
                        ),
                      ),
                    ),
                  ),
                  const CustomContainer(
                    color: AppColors.LIGHT_GREEN,
                    text: AppConstants.NORMAL_TYPE,
                  ),
                  const CustomContainer(
                    color: AppColors.LIGHT_PURPLE,
                    text: AppConstants.AIR_TYPE,
                  ),
                  const CustomContainer(
                    color: AppColors.DARK_BLUE,
                    text: AppConstants.EARTH_TYPE,
                  ),
                  const CustomContainer(
                    color: AppColors.DARK_BROWN,
                    text: AppConstants.ROCK_TYPE,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Text(AppConstants.TEXT_HOME_PAGE_4,
                  style: AppTextStyles.NUNITO_700_LOW
                      .copyWith(color: AppColors.DARK_BLUE)),
            ),
            CustomFutureBuilder(pokeController: _pokeController)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        onIndexSelected: (index) => print(index),
        item: [
          CustomBottomNavigationBarItem(
              label: AppConstants.HOME, icon: Icons.home_outlined),
          CustomBottomNavigationBarItem(
              label: AppConstants.FAVORITES, icon: Icons.favorite_border),
          CustomBottomNavigationBarItem(
              label: AppConstants.MY_ACCOUNT,
              icon: Icons.account_circle_outlined),
        ],
      ),
    );
  }
}
