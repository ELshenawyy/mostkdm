import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/wallet/presentation/section/bank_account_section.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/bank_account_empty_section.dart';


class BankAccountView extends StatefulWidget {
  const BankAccountView({super.key});

  @override
  State<BankAccountView> createState() => _BankAccountViewState();
}

class _BankAccountViewState extends State<BankAccountView> {
  bool _hasAccount = false; // ← هتيجي من الـ API بعدين

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              height: 120,
              child: SafeArea(
                child: Column(
                  
                  children: [
                    LocalAppBar(
                      title: 'المحفظة',
                      isLight: true,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _hasAccount
                    ? const BankAccountSection()
                    : const BankAccountEmptySection(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}