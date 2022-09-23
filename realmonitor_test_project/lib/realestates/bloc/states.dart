import 'package:equatable/equatable.dart';
import 'package:realmonitor_test_project/realestates/models/realestatemodel.dart';

abstract class RealEstateListState extends Equatable {
  @override
  List<Object> get props => [];
}

class RealEstateListInitState extends RealEstateListState {}

class RealEstateListLoading extends RealEstateListState {}

class RealEstateListLoaded extends RealEstateListState {
  final List<RealEstate> realEstateList;
  RealEstateListLoaded({required this.realEstateList});
}

class  RealEstateListError extends RealEstateListState {
  final error;
  RealEstateListError({this.error});
}
