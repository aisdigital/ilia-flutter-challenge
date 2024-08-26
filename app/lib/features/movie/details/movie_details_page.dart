import 'package:app/features/movie/details/movie_details_controller.dart';
import 'package:app/features/movie/video/video_page.dart';
import 'package:core/constant/env.dart';
import 'package:core/util/context_x.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/widgets/common/tag.dart';
import 'package:design_system/widgets/tiles/movie_video_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieDetailsPage extends StatefulWidget {
  final int id;

  const MovieDetailsPage({super.key, required this.id});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDetailsController _controller;

  @override
  void initState() {
    _controller = MovieDetailsController(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final expandedHeight = 400.0;
    final collapsedHeight = 60.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          body: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, state, child) {
              if (state.isLoading) return const Center(child: CircularProgressIndicator());

              if (state.exception != null) return Center(child: Text(state.exception!.message));

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
                    expandedHeight: expandedHeight,
                    collapsedHeight: collapsedHeight,
                    pinned: true,
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(.5),
                          shape: const CircleBorder(),
                        ),
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: true,
                      title: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: context.screenSize.width / 1.5),
                          child: Text(
                            state.data!.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                            overflow: TextOverflow.ellipsis,
                          )),
                      background: Hero(
                        tag: state.data!.posterPath ?? "",
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: expandedHeight - collapsedHeight - 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '$imageBaseUrl/w500/${state.data?.backdropPath}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey.shade300,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.star_rounded, color: Colors.amber),
                                Text(
                                  state.data!.voteAverage.toStringAsFixed(2),
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: state.data?.genres
                                        ?.map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Tag(child: Text(e.name)),
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Length', style: Theme.of(context).textTheme.titleMedium),
                                    Text('${state.data!.runtime.toString()} minutes'),
                                  ],
                                ),
                                SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Language', style: Theme.of(context).textTheme.titleMedium),
                                    Text(
                                      state.data!.spokenLanguages?.isNotEmpty == true
                                          ? state.data!.spokenLanguages?.first.name ?? 'Unknown'
                                          : 'Unknown',
                                    ),
                                  ],
                                ),
                                SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Adult', style: Theme.of(context).textTheme.titleMedium),
                                    Text('${state.data!.adult ? 'Yes' : 'No'}'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text('Overview', style: Theme.of(context).textTheme.headlineMedium),
                            Text(
                              state.data!.overview.isEmpty ? 'No overview found.' : state.data!.overview,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 30),
                            if (state.data!.productionCompanies!.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Production Companies', style: Theme.of(context).textTheme.titleMedium),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: state.data!.productionCompanies!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        final company = state.data!.productionCompanies![i];
                                        return Tooltip(
                                          message: company.name,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Container(
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: CachedNetworkImage(
                                                      height: 80,
                                                      width: 80,
                                                      imageUrl: '$imageBaseUrl/w200/${company.logoPath ?? ""}',
                                                      errorWidget: (context, url, error) => const Icon(
                                                        Icons.image_not_supported_outlined,
                                                        size: 50,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Text(
                                                    company.name,
                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 30),
                            if (state.videos.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Videos', style: Theme.of(context).textTheme.titleMedium),
                                  SizedBox(height: 16),
                                  ListView.builder(
                                    itemCount: state.videos.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      final video = state.videos[i];

                                      return MovieVideoTile(
                                        videoKey: video.key,
                                        name: video.name,
                                        type: video.type,
                                        onTap: () => context.toView(
                                          VideoPage(video: video),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
