import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/repositories/now_playing_movies_repository_imp.dart';
import 'package:ilia_flutter_challenge/screens/home/home_controller.dart';
import 'package:ilia_flutter_challenge/screens/widgets/movie_picture_card_widget.dart';
import 'package:ilia_flutter_challenge/screens/widgets/text_input_widget.dart';
import 'package:ilia_flutter_challenge/service/dio_service_imp.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';
import 'package:ilia_flutter_challenge/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Screen Controller
  final HomeController homeController =
      HomeController(NowPlayingMoviesRepositoryImp(DioServiceImp()));

  //Screen Scroll Controller
  final ScrollController _scrollController = ScrollController();
  //Screem Search Input Controller
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _scrollController.addListener(infiniteScrolling);
    homeController.fetchByPage();
    super.initState();
  }

  //asserting new data fetch when max scroll position is achieved
  infiniteScrolling() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !homeController.loading.value &&
        searchController.text.isEmpty) {
      homeController.fetchByPage();
    }
  }

  //disposing screen scroll controller
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Now Playing Movies",
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
            valueListenable: homeController.movies,
            builder: (context, movies, _) {
              if (homeController.loading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkSecondaryAmber,
                    backgroundColor: AppColors.darkScaffoldColor,
                  ),
                );
              } else if (!homeController.loading.value &&
                  homeController.error.value.isNotEmpty) {
                return Center(
                  child: Text(
                    "Error: ${homeController.error.value}",
                    style: AppTextStyles.appBarTitle,
                  ),
                );
              } else {
                return movies != null
                    ? SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            TextInputWidget(
                              controller: searchController,
                              text: "Search by name",
                              icon: const Icon(Icons.search),
                              onChanged: homeController.fieldOnChanged,
                            ),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 0.5625),
                                itemCount: searchController.text.isEmpty
                                    ? movies.results.length + 2
                                    : movies.results.length,
                                itemBuilder: (context, index) {
                                  if (index < movies.results.length) {
                                    return MoviePictureCardWidget(
                                      movie: movies.results[index],
                                    );
                                  } else {
                                    return LinearProgressIndicator(
                                        backgroundColor:
                                            AppColors.darkMainAmber,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.darkSecondaryAmber));
                                  }
                                }),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColors.darkSecondaryAmber,
                          backgroundColor: AppColors.darkScaffoldColor,
                        ),
                      );
              }
            }),
      ),
    );
  }
}
