import 'package:bloc_project/components/text_view_headline.dart';
import 'package:bloc_project/constants/app_constants.dart';
import 'package:bloc_project/constants/color_constants.dart';
import 'package:bloc_project/constants/message_constants.dart';
import 'package:bloc_project/constants/padding_constants.dart';
import 'package:bloc_project/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/launch_bloc.dart';
import '../components/text_view_body.dart';
import '../components/url_button.dart';
import '../model/launches.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Launches> launchList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaunchBloc(
        RepositoryProvider.of<APIService>(context),
      )..add(LoadLaunchEvent()),
      child: Scaffold(
          backgroundColor: ColorConstants.thirdColor,
          appBar: appBar(),
          body: BlocListener<LaunchBloc, LaunchState>(
            listener: (context, state) {
              if (state is LaunchLoadedState) {
                launchList = state.launches;
              }
            },
            child: blocBuilder(),
          )),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text(
          AppConstants.appName,
          style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: AppConstants.highFontSize),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: ColorConstants.secondColor,
      );

  BlocBuilder<LaunchBloc, LaunchState> blocBuilder() {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is LaunchLoadingState) {
          return loadingState();
        }
        if (state is LaunchLoadedState) {
          launchList = state.launches;
          return RefreshIndicator(
              color: ColorConstants.secondColor,
              backgroundColor: ColorConstants.primaryColor,
              strokeWidth: 4.0,
              onRefresh: () async {
                launchList = state.launches;
                BlocProvider.of<LaunchBloc>(context).add(LoadLaunchEvent());
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: loadedState(launchList)),
                  )
                ],
              ));
        }
        if (state is LaunchErrorState) {
          return errorState();
        }
        return Container();
      },
    );
  }

  Center loadingState() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: ColorConstants.primaryColor,
        // color: ColorConstants.secondColor,
      ),
    );
  }

  Column loadedState(List<Launches> launchList) {
    return Column(children: [
      Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(
                top: PaddingConstants.lowPaddingSize,
                left: PaddingConstants.highPaddingSize,
                right: PaddingConstants.highPaddingSize),
            decoration: const BoxDecoration(
              color: ColorConstants.secondColor,
            ),
            child: Image(
              image:
                  NetworkImage(launchList.last.links!.patch!.small.toString()),
            ),
          )),
      Expanded(
        flex: 4,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Expanded(
                      flex: 1,
                      child: TextViewHeadline(
                        key: widget.key,
                        message: AppConstants.launchDetail,
                      )),
                  Expanded(
                      flex: 2,
                      child: TextViewBody(
                        key: widget.key,
                        left: AppConstants.sec1,
                        right: launchList.last.name.toString(),
                      )),
                  Expanded(
                      flex: 2,
                      child: TextViewBody(
                        key: widget.key,
                        left: AppConstants.sec2,
                        right: launchList.last.success.toString(),
                      )),
                  Expanded(
                      flex: 2,
                      child: TextViewBody(
                        key: widget.key,
                        left: AppConstants.sec3,
                        right:
                            launchList.last.failures!.first.reason.toString(),
                      )),
                  Expanded(
                      flex: 2,
                      child: TextViewBody(
                        key: widget.key,
                        left: AppConstants.sec4,
                        right: launchList.last.details.toString(),
                      )),
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
              left: PaddingConstants.highPaddingSize,
              right: PaddingConstants.highPaddingSize),
          child: Row(
            children: [
              UrlButton(
                key: widget.key,
                link: launchList.last.links?.webcast,
                title: AppConstants.button1,
              ),
              const Spacer(),
              UrlButton(
                key: widget.key,
                link: launchList.last.links?.article,
                title: AppConstants.button2,
              ),
              const Spacer(),
              UrlButton(
                key: widget.key,
                link: launchList.last.links?.wikipedia,
                title: AppConstants.button3,
              ),
            ],
          ),
        ),
      ),
      const Spacer()
    ]);
  }

  Center errorState() {
    return const Center(
      child: Text(MessageConstants.errorStateText),
    );
  }
}
