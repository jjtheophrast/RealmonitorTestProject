import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor_test_project/realestates/bloc/bloc.dart';
import 'package:realmonitor_test_project/realestates/bloc/events.dart';
import 'package:realmonitor_test_project/realestates/bloc/states.dart';
import 'package:realmonitor_test_project/realestates/widgets/error.dart';

import '../models/realestatemodel.dart';
import '../widgets/list_row.dart';
import '../widgets/loading.dart';

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
    return _body();
  }

  _body() {
    return Column(
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
          }
          if (state is RealEstateListLoaded) {
            List<RealEstate> realEstates = state.realEstateList;
            return _buildListWidgetFromRealEstateList(realEstates);
          }
          return const Loading();
        }),
      ],
    );
  }

  Widget _buildListWidgetFromRealEstateList(List<RealEstate> realEstate) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey.shade50,
        child: ListView.builder(
          itemCount: realEstate.length,
          itemBuilder: (_, index) {
            RealEstate realEstateItem = realEstate[index];
            return RealEstateCard(realEstate: realEstateItem);
          },
        ),
      ),
    );
  }
}
