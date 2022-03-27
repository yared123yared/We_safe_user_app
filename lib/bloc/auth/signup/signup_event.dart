abstract class SignupEvent {}

class SignupFirstNameChanged extends SignupEvent {
  final String firstName;

  SignupFirstNameChanged({required this.firstName});
}

class SignupLastNameChanged extends SignupEvent {
  final String lastName;

  SignupLastNameChanged({required this.lastName});
}

class SignupCityChanged extends SignupEvent {
  final String city;

  SignupCityChanged({required this.city});
}

class SignupSubityChanged extends SignupEvent {
  final String subcity;

  SignupSubityChanged({required this.subcity});
}

class SignupWoredaChanged extends SignupEvent {
  final String woreda;

  SignupWoredaChanged({required this.woreda});
}

class SignupPhoneChanged extends SignupEvent {
  final String phone;

  SignupPhoneChanged({required this.phone});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});
}

class SignupSubmitted extends SignupEvent {}
