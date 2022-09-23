import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor_test_project/realestates/api/exceptions.dart';
import 'package:realmonitor_test_project/realestates/api/services.dart';
import 'package:realmonitor_test_project/realestates/bloc/events.dart';
import 'package:realmonitor_test_project/realestates/bloc/states.dart';
import 'package:realmonitor_test_project/realestates/models/realestatemodel.dart';

class RealEstatesBloc extends Bloc<RealEstateEvents, RealEstateListState> {
  //
  final RealEstatesRepo realEstatesRepo;
  List<RealEstate> realEstates = List.empty(growable: true);

  RealEstatesBloc(this.realEstatesRepo) : super(RealEstateListInitState()) {
    on<RealEstateEvents>(_onFetchRealEstates);
  }


  Future<void> _onFetchRealEstates(RealEstateEvents event,
      Emitter<RealEstateListState> emit,) async {



    switch (event) {
      case RealEstateEvents.fetchRealEstates:
        emit(RealEstateListLoading());
        try {
          realEstates = await realEstatesRepo.getRealEstateList();
          emit(RealEstateListLoaded(realEstateList: realEstates));
        } on SocketException {
          emit(RealEstateListError(
            error: NoInternetException('No Internet'),
          ));
        } on HttpException {
          emit(RealEstateListError(
            error: NoServiceFoundException('No Service Found'),
          ));
        } on FormatException {
          emit(RealEstateListError(
            error: InvalidFormatException('Invalid Response format'),
          ));
        } catch (e) {
          emit(RealEstateListError(
            error: UnknownException('Unknown Error'),
          ));
        }

        break;
    }
  }
}


