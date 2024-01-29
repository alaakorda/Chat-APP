import 'package:chat/screens/cubits/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(super.initialState);
  emit(RegisterLoading);
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFaild(errorMassage: 'something went wrong'));
    }
  }
}
