import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor_test_project/realestates/bloc/bloc.dart';
import 'package:realmonitor_test_project/realestates/bloc/events.dart';
import 'package:realmonitor_test_project/realestates/bloc/states.dart';
import 'package:realmonitor_test_project/realestates/widgets/error.dart';

import '../models/realestatemodel.dart';
import '../widgets/list_row.dart';
import '../widgets/loading.dart';

///The convention in dart is to name the files with snake case:
///not realestatelistingpage.dart, but real_estate_listing_page.dart
///It seems like you use both: firebase_options.dart
///Maybe pick one and stick to it? I'd suggest the convention :)
class RealEstateListPage extends StatefulWidget {
  const RealEstateListPage({Key? key}) : super(key: key);

  @override
  State<RealEstateListPage> createState() => _RealEstateListPageState();
}

class _RealEstateListPageState extends State<RealEstateListPage> {
  @override
  void initState() {
    super.initState();
    _loadRealEstates();
  }

  void _loadRealEstates() async {
    context.read<RealEstatesBloc>().add(RealEstateEvents.fetchRealEstates);
  }

  @override
  Widget build(BuildContext context) {
    ///Using helper methods like_body() hinders Flutters ability to keep rebuilds
    ///locally scoped and thus keep the apps UI smooth and performant:
    ///https://www.youtube.com/watch?v=IOyq-eTRhvo
    return _body();
  }

  _body() => Column(
        children: [
          BlocBuilder<RealEstatesBloc, RealEstateListState>(
              builder: (BuildContext context, RealEstateListState state) {
            if (state is RealEstateListError) {
              final error = state.error;
              String message = error.message;
              String errorAnimation = error.animationAsset;
              return ErrorScreen(
                lottieAnimationAsset: errorAnimation,
                message: message,
                onReload: _loadRealEstates,
              );

              ///when reading 'if' statements, if there is no 'else' behind it,
              ///i would assume that the if only creates one branch of the code that conditionally runs or not,
              ///but everything after it runs anyways. Since these options are mutually exclusive
              ///(the state cannot be Error and Loaded at the same time)
              ///a if - else statement would convey the true logic of the code better
            } else if (state is RealEstateListLoaded) {
              List<RealEstate> realEstates = state.realEstateList;
              return _buildListWidgetFromRealEstateList(realEstates);
            }
            return const Loading();
          }),
        ],
      );

  Widget _buildListWidgetFromRealEstateList(List<RealEstate> realEstate) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey.shade50,
        child: ListView.builder(
            itemCount: realEstate.length,

            ///This makes the code more readable at a glance,
            ///but makes it harder to debug, if one wants to set a breakpoint
            ///to see what is realEstate[index] is all about.
            ///I guess it's a preference thing.
            itemBuilder: (_, index) =>
                RealEstateCard(realEstate: realEstate[index])),
      ),
    );
  }
}
