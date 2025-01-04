part of 'getdiscover_cubit.dart';

abstract class GetDiscoverState extends Equatable {
  const GetDiscoverState();
}

final class GetDiscoverInitial extends GetDiscoverState {
  @override
  List<Object> get props => [];
}

final class GetDiscoverLoading extends GetDiscoverState {
  @override
  List<Object> get props => [];
}

final class GetDiscoverLoaded extends GetDiscoverState {
  final GetDiscoverModel model;
  const GetDiscoverLoaded(this.model);
  @override
  List<Object> get props => [model];
}

final class GetDiscoverError extends GetDiscoverState {
 final String error;
  GetDiscoverError(this.error);
  @override
  List<Object> get props => [error];
}
