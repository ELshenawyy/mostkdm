import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/features/wallet/data/models/wallet_balance_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_header.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:mostkdm/features/wallet/presentation/section/wallet_balance_section.dart';
import 'package:mostkdm/features/wallet/presentation/section/wallet_transactions_section.dart';
import 'package:mostkdm/features/wallet/presentation/utils/wallet_dummy_data.dart';
import 'package:mostkdm/features/wallet/presentation/view/payment_web_view_screen.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/recharge_bottom_sheet.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletBloc>(),
      child: const WalletViewBody(),
    );
  }
}

class WalletViewBody extends StatefulWidget {
  const WalletViewBody({super.key});

  @override
  State<WalletViewBody> createState() => _WalletViewBodyState();
}

class _WalletViewBodyState extends State<WalletViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(GetWAlletBalanceEvent());
  }

  void _showRechargeSheet(BuildContext context) {
    final walletBloc = context.read<WalletBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: walletBloc,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            const RechargeBottomSheet(),
            Positioned(
              top: 0,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.primaryColor.withValues(alpha: 0.3)),
                ),
                child: Icon(Icons.account_balance_wallet_outlined,
                    color: AppColors.secondaryColor, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) async {
          if (state is RechargeSuccessState) {
            final isSuccess = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentWebViewScreen(
                  paymentUrl: state.recharge.paymentUrl,
                ),
              ),
            );

            if (isSuccess == true && context.mounted) {
              context.read<WalletBloc>().add(GetWAlletBalanceEvent());
            }
          }

          if (state is RechargeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is WalletLoadingState || state is WalletInitial;

          if (state is WalletErrorState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontFamily: 'Cairo', color: Colors.red),
              ),
            );
          }

          final WalletBalanceModel balanceData = isLoading
              ? WalletDummyData.dummyBalance
              : (state is WalletBalanceSuccessState
                  ? state.balance
                  : WalletDummyData.dummyBalance);

          final List<TransactionModel> transactionsData = isLoading
              ? WalletDummyData.dummyTransactionsList
              : (state is WalletBalanceSuccessState
                  ? state.transactions
                  : []);

          return Skeletonizer(
            enabled: isLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppHeader(
                    height: 160,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: LocalAppBar(
                              title: 'المحفظة',
                              isLight: true,
                              prefixIcon: Icons.arrow_back_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -60),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          WalletBalanceSection(
                            onRechargeTap: () => _showRechargeSheet(context),
                            balance: balanceData,
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () =>
                                context.push(RouteNames.bankAccount),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.secondaryColor
                                      .withValues(alpha: 0.5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.edit_outlined,
                                          color: AppColors.secondaryColor,
                                          size: 18),
                                      const SizedBox(width: 8),
                                      Text('تعديل بيانات الحساب البنكي',
                                          style: AppTextStyle.textFieldHeader),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          WalletTransactionsSection(
                            transactions: transactionsData,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}