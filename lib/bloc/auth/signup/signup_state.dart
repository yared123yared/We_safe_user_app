import 'package:wesafeapp/bloc/auth/form_submition_status.dart';

class SignupState {
  final String firstName;
  final String lastname;
  final String city;
  final String subcity;
  final String woreda;
  final String phone;
  final String password;
  final FormSubmissionStatus formStatus;

  SignupState(
      {this.firstName="",
        this.lastname="",
        this.city="",
        this.subcity="",
        this.woreda="",
        this.phone="",
        this.password = "",
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? city,
    String? subCity,
    String? woreda,
    String? phone,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastname: lastName ?? this.lastname,
      city: city ?? this.city,
      subcity: subCity ?? this.subcity,
      woreda: woreda ?? this.woreda,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,

    );
  }
}