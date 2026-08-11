import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/contact_us/data/model/contact_us_model.dart';
import 'package:mostkdm/features/contact_us/presentation/bloc/contact_us_bloc.dart';
import 'package:mostkdm/features/contact_us/presentation/section/contact_us_section.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactUsBloc>(),
      child: Scaffold(
        body: BlocConsumer<ContactUsBloc, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is ContactUsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(
                    height: 160,
                    child: SafeArea(
                      child: Column(
                        children: [
                          LocalAppBar(
                            title: 'إتصل بنا',
                            isLight: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ContactUsSection(
                        isLoading: state is ContactUsLoading,
                        onSubmit: (name, email, message) {
                          context.read<ContactUsBloc>().add(
                                SendContactUsMessageEvent(
                                  contactUs: ContactUsModel(
                                    name: name,
                                    email: email,
                                    message: message,
                                  ),
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}