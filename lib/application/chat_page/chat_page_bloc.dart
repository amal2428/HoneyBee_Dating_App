import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honeybee/domain/models/get_message_request_model/get_message_request_model.dart';
import 'package:honeybee/domain/models/get_message_response_model/get_message_response_model.dart';
import 'package:honeybee/domain/models/socket_send_msg_request_model/socket_send_msg_request_model/socket_send_msg_request_model.dart';
import 'package:honeybee/infrastructure/services/api_services.dart';
import 'package:honeybee/infrastructure/services/socket_services.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';
part 'chat_page_bloc.freezed.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc() : super(ChatPageState.initial()) {
    on<_NewMessage>((event, emit) async {
      SocketServices.sendMsg(
          sendMsgRequest: SocketSendMsgRequestModel(
              conversationId: event.conversationId,
              from: event.senderId,
              to: event.receiverId,
              message: event.controllerValue,
              messageType: 'text'));

      add(_GetAllMessageOfUser(event.senderId, event.receiverId));
    });

    on<_InitializeGetAllMessagePage>((event, emit) {
      add(_GetAllMessageOfUser(event.senderId, event.receiverId));

      SocketServices.socketMsgReceiveListener(() {
        add(_GetAllMessageOfUser(event.senderId, event.receiverId));
        log('socketMsgReceiveListener funtion from bloc working');
      });
    });

    on<_GetAllMessageOfUser>((event, emit) async {
      GetMessageRequestModel request =
          GetMessageRequestModel(from: event.senderId, to: event.receiverId);

      final result = await ApiServices.getAllMessageData(request);

      result.fold((failure) {
        emit(state.copyWith(errorMessage: failure.errorMessage));
        emit(state.copyWith(errorMessage: null));
      }, (success) {
        final message = GetMessageResponseModel.generateMessagesMap(success);

        emit(state.copyWith(messages: message));

        log(message.toString());
      });
    });

    // on<_GetAllMessageOfUser>((event, emit) async {
    //   GetMessageRequestModel request =
    //       GetMessageRequestModel(from: event.senderId, to: event.receiverId);

    //   final result = await ApiServices.getAllMessageData(request);

    //   result.fold((failure) {
    //     emit(state.copyWith(errorMessage: failure.errorMessage));
    //     emit(state.copyWith(errorMessage: null));
    //   }, (success) {
    //     final message = GetMessageResponseModel.generateMessagesMap(success);

    //     emit(state.copyWith(messages: message));

    //     log(message.toString());
    //   });
    // });
  }
}

// Map<String, List<Map<String, dynamic>>> generateMessagesMap(List<Map<String, dynamic>> messages) {
//   Map<String, List<Map<String, dynamic>>> messagesMap = {};

//   for (var message in messages) {
//     DateTime createdAt = DateTime.parse(message["createdAt"]);
//     String formattedDate = DateFormat('yyyy-MM-dd').format(createdAt);

//     if (!messagesMap.containsKey(formattedDate)) {
//       messagesMap[formattedDate] = [];
//     }

//     messagesMap[formattedDate]!.add(message);
//   }

//   return messagesMap;
// }
