import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesafeapp/Repository/User_repository.dart';
import 'package:wesafeapp/bloc/auth/form_submition_status.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_event.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository authRepo;

  SignupBloc({required this.authRepo}) : super(SignupState()) {
    on<SignupFirstNameChanged>(_mapSignupFirstNameUpdatedEventToState);
    on<SignupLastNameChanged>(_mapSignupULastNameUpdatedEventToState);
    on<SignupCityChanged>(_mapSignupCityUpdatedEventToState);
    on<SignupSubityChanged>(_mapSignupSubcityUpdatedEventToState);
    on<SignupWoredaChanged>(_mapSignupWoredaUpdatedEventToState);
    on<SignupPhoneChanged>(_mapSignupPhoneUpdatedEventToState);
    on<SignupPasswordChanged>(_mapLoginPasswordUpdatedEventToState);
    on<SignupSubmitted>(_mapSignupSubmittedEventToState);
  }

  void _mapSignupFirstNameUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(firstName: state.firstName));
  }

  void _mapSignupULastNameUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(lastName: state.lastname));
  }

  void _mapSignupCityUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(city: state.city));
  }

  void _mapSignupSubcityUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(subCity: state.subcity));
  }

  void _mapSignupWoredaUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(woreda: state.woreda));
  }

  void _mapSignupPhoneUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(phone: state.phone));
  }

  void _mapLoginPasswordUpdatedEventToState(
      SignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(password: state.password));
  }

  void _mapSignupSubmittedEventToState(
      SignupEvent event, Emitter<SignupState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.signUp();
      await Future.delayed(const Duration(seconds: 4), () {});
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
