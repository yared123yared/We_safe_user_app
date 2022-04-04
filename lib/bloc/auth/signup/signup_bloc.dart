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
      SignupFirstNameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _mapSignupULastNameUpdatedEventToState(
      SignupLastNameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _mapSignupCityUpdatedEventToState(
      SignupCityChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(city: event.city));
  }

  void _mapSignupSubcityUpdatedEventToState(
      SignupSubityChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(subCity: event.subcity));
  }

  void _mapSignupWoredaUpdatedEventToState(
      SignupWoredaChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(woreda: event.woreda));
  }

  void _mapSignupPhoneUpdatedEventToState(
      SignupPhoneChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _mapLoginPasswordUpdatedEventToState(
      SignupPasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _mapSignupSubmittedEventToState(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.signUp();
      await Future.delayed(const Duration(seconds: 4), () {});
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
    }
  }
}
