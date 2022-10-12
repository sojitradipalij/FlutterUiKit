import 'package:flutteruikit/loading_effect.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';

import '../controllers/download_controller.dart';
import '../models/download_movie.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DownloadController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(DownloadController());
  }

  List<Widget> _buildDownloadMovieList() {
    List<Widget> list = [];
    for (DownloadMovie downloadMovie in controller.downloadMovies!) {
      list.add(_buildSingleDownloadMovie(downloadMovie));
      list.add(FxSpacing.height(20));
    }
    return list;
  }

  Widget _buildSingleDownloadMovie(DownloadMovie downloadMovie) {
    return FxContainer(
      borderRadiusAll: 4,
      child: Row(
        children: [
          FxContainer(
            height: 80,
            width: 80,
            paddingAll: 0,
            borderRadiusAll: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(downloadMovie.movie.image),
              fit: BoxFit.cover,
            ),
          ),
          FxSpacing.width(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.b2(
                downloadMovie.movie.name,
                fontWeight: 600,
              ),
              FxSpacing.height(4),
              FxText.button(downloadMovie.movie.production),
              FxSpacing.height(6),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          FxText.caption(
                            downloadMovie.downloadedSize.toString() + 'MB',
                            color: customTheme.muviPrimary,
                          ),
                          FxSpacing.width(48),
                          FxText.caption(
                            downloadMovie.totalSize.toString() + 'MB',
                            color: customTheme.muviPrimary,
                          ),
                        ],
                      ),
                      FxSpacing.height(2),
                      FxProgressBar(
                        height: 2,
                        activeColor: customTheme.muviPrimary,
                        inactiveColor:
                            theme.colorScheme.onBackground.withAlpha(30),
                        progress: (downloadMovie.downloadedSize /
                            downloadMovie.totalSize),
                        width: MediaQuery.of(context).size.width - 224,
                      ),
                    ],
                  ),
                  FxSpacing.width(12),
                  Icon(
                    Icons.pause_circle_outline,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  FxSpacing.width(8),
                  Icon(
                    Icons.more_vert,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DownloadController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Container(
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
            theme,
            customTheme,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: FxText.sh1(
            'Downloads',
            fontWeight: 600,
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: FxSpacing.x(20),
          child: Column(
            children: _buildDownloadMovieList(),
          ),
        ),
      );
    }
  }
}
