import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honeybee/infrastructure/camera_services.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/validation/form_validation_services.dart';

part 'basic_info_auth_event.dart';
part 'basic_info_auth_state.dart';
part 'basic_info_auth_bloc.freezed.dart';

class BasicInfoAuthBloc extends Bloc<BasicInfoAuthEvent, BasicInfoAuthState> {
  BasicInfoAuthBloc() : super(const _Initial()) {
    on<_PickImage>((event, emit) async {
      XFile? image = await CameraServices.pickImageFromGallery();

      emit(state.copyWith(pickedImage: image));
    });

    on<_NextPage>((event, emit) {
      bool isValidationSuccess = true;

      if (!FormValidationServices.fullNameValidation(event.fullName)) {
        emit(state.copyWith(fullNameErrorMsg: 'Please enter a valid name'));
        isValidationSuccess = false;
      } else {
        emit(state.copyWith(fullNameErrorMsg: null));
      }

      if (!FormValidationServices.emailValidation(event.email)) {
        emit(state.copyWith(emailErrorMsg: 'Please enter a valid email'));
        isValidationSuccess = false;
      } else {
        emit(state.copyWith(emailErrorMsg: null));
      }

      if (!FormValidationServices.validateBirthday(event.birthday)) {
        emit(state.copyWith(birthdayErrorMsg: 'Please enter a valid birthday'));
        isValidationSuccess = false;
      } else {
        emit(state.copyWith(birthdayErrorMsg: null));
      }

      emit(state.copyWith(isValidated: isValidationSuccess));
    });
  }
}
