part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {}

final class CounterInitial extends CounterState {
  @override
  List<Object?> get props => [];
}

final class CounterLoadingState extends CounterState {
  @override
  List<Object?> get props => [];
}

final class CounterLoadedState extends CounterState {
    final int counter;
    CounterLoadedState(this.counter);
  @override
  List<Object?> get props => [counter];
}

final class CounterErrorState extends CounterState {
  final String error;
  CounterErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
