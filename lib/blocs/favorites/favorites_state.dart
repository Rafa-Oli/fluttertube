import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialValues extends FavoritesState {}
