import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/contact_us/data/model/contact_us_model.dart';
import 'package:mostkdm/features/contact_us/data/repository/contact_us_repository.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ContactUsRepository contactUsRepository;
  ContactUsBloc(this.contactUsRepository) : super(ContactUsInitial()) {
    on<SendContactUsMessageEvent>(_onSendContactUsMessageEvent);
  }

  Future<void> _onSendContactUsMessageEvent(
      SendContactUsMessageEvent event, Emitter<ContactUsState> emit) async {
    emit(ContactUsLoading());
    final result =
        await contactUsRepository.sendcontactUsMessage(event.contactUs);
    result.fold(
      (failure) => emit(
        ContactUsError(message: failure.message),
      ),
      (successMessage) => emit(
        ContactUsSuccess(message: successMessage),
      ),
    );
  }
}
