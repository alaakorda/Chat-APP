abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFaild extends LoginState {
 String? errorMassage;
  LoginFaild({required this.errorMassage});
}
