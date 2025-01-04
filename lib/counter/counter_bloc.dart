import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterLoadingState());
      try {
        counter += 1;
        emit(CounterLoadedState(counter));
      } catch (e) {
        emit(CounterErrorState(e.toString()));
      }
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterLoadingState());
      try {
        if (counter > 0) {
          counter -= 1;
        }
        emit(CounterLoadedState(counter));
      } catch (e) {
        emit(CounterErrorState(e.toString()));
      }
    });
  }
}
