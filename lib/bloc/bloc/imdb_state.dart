part of 'imdb_bloc.dart';

@immutable
sealed class ImdbState {}

class ImbdInitial extends ImdbState {}

class ImbdblocLoading extends ImdbState {}

class ImbdblocLoaded extends ImdbState {
  late Imdbmodel data;
}

class ImbdblocError extends ImdbState {}
