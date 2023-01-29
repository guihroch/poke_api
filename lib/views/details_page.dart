import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/constans/app_assets.dart';
import 'package:pokemon_api/constans/app_constants.dart';
import 'package:pokemon_api/models/pokemon_detail_model.dart';
import 'package:pokemon_api/repositories/poke_repository.dart';
import '../constans/app_colors.dart';
import '../constans/app_text_styles.dart';
import '../controllers/poke_details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PokeDetailsController pokeController =
      PokeDetailsController(pokeRepository: PokeRepository());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.DARK_BLUE,
          ),
        ),
        backgroundColor: AppColors.BACKGROUND_COLLOR,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 70, top: 40),
          child: Image.asset(AppAssets.LOGO),
        ),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  AppAssets.CIRCLE_AVATAR,
                ),
                radius: 14,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<PokemonModel>(
        future: pokeController.findPokemon(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Pokemon não encontrado'),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.WHITE_PINK,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: snapshot.data?.url == null
                      ? Image.asset('assets/images/pikachu.png')
                      : Image.network(snapshot.data!.url!)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          snapshot.data?.name ?? '',
                          style: AppTextStyles.NUNITO_700_MEDIUM
                              .copyWith(color: AppColors.POKE_BLUE),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 220),
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.LIGHT_GREY,
                        size: 17,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.share,
                        color: AppColors.LIGHT_GREY,
                        size: 17,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(AppConstants.ID,
                        style: AppTextStyles.NUNITO_400_LOW
                            .copyWith(color: AppColors.POKE_BLUE)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('#${snapshot.data?.id}',
                        style: AppTextStyles.NUNITO_400_LOW
                            .copyWith(color: AppColors.POKE_BLUE)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 260, top: 16),
                    child: Container(
                      height: 24,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                        color: AppColors.LIGHT_ORANGE,
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
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
