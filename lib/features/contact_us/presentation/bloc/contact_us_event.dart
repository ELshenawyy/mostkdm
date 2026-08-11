part of 'contact_us_bloc.dart';

sealed class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object> get props => [];
}

class SendContactUsMessageEvent extends ContactUsEvent {
  final ContactUsModel contactUs;
  const SendContactUsMessageEvent({required this.contactUs});

  @override
  List<Object> get props => [contactUs];
}
