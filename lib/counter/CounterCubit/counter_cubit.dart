import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/counter/CounterCubit/counter_state.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(InitialCounterState());


  static CounterCubit get(context)=>BlocProvider.of<CounterCubit>(context);


  int counter =0;

  void increment(){
     counter++;
     emit(IncreamentState());
  }

  void decrement(){
    counter--;
    emit(DecreamentState());

  }
}