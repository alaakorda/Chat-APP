abstract class RegisterState {}
class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFaild extends RegisterState {
 String? errorMassage;
  RegisterFaild({required this.errorMassage});
}