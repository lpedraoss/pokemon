import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/utils/status.enum.dart';

class CounterCubit extends Cubit<Status> {
  var stateCounter = Status.inProcess;
  CounterCubit() : super(Status.inProcess);
  Status counterIncrement() {
    stateCounter = Status.increment;

    return stateCounter;
  }

  Status counterDecrement() {
    stateCounter = Status.decrement;
    return stateCounter;
  }
}
