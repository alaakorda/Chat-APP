
import 'package:bloc/bloc.dart';
import 'package:chat/screens/cubits/login_cubit/login_state.dart';

class LoginCuit extends Cubit<LoginState> {
  LoginCuit() : super(LoginInitial());

}
