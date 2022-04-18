part of 'trending_movie_bloc.dart';

@immutable
abstract class TrendingMovieState {}

class TrendingMovieInitial extends TrendingMovieState {}
class TrendingMovieLoading extends TrendingMovieState {}
class TrendingMovieLoaded extends TrendingMovieState {}
class TrendingMovieError extends TrendingMovieState {}
