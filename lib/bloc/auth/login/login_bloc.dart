import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesafeapp/Repository/User_repository.dart';
import 'package:wesafeapp/bloc/auth/form_submition_status.dart';
import 'package:wesafeapp/bloc/auth/login/login_event.dart';
import 'package:wesafeapp/bloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState()) {
    on<LoginUsernameChanged>(_mapLoginUsernameUpdatedEventToState);
    on<LoginPasswordChanged>(_mapLoginPasswordUpdatedEventToState);
    on<LoginSubmitted>(_mapLoginSubmittedEventToState);
  }

  void _mapLoginUsernameUpdatedEventToState(
      LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: state.username));
  }

  void _mapLoginPasswordUpdatedEventToState(
      LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: state.password));
  }

  void _mapLoginSubmittedEventToState(
      LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.logIn(state.username, state.password);
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
