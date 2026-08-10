import 'package:equatable/equatable.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/commission/data/models/commission_calculation_model.dart';
import 'package:mostkdm/features/commission/data/models/pay_commission_response_model.dart';

enum CommissionStep { ads, price, payment, exempt }

class CommissionState extends Equatable {
  final CommissionStep currentStep;
  final List<dynamic> ads;
  final dynamic selectedAd;
  final CommissionCalculationModel? calculationModel;
  final PayCommissionResponseModel? payResponseModel;
  final double? enteredPrice;
  final bool isAdsLoading;
  final bool isCalculateLoading;
  final bool isPayLoading;
  final AppException? calculateException;
  final AppException? payException;

  const CommissionState({
    this.currentStep = CommissionStep.ads,
    this.ads = const [],
    this.selectedAd,
    this.calculationModel,
    this.payResponseModel,
    this.enteredPrice,
    this.isAdsLoading = false,
    this.isCalculateLoading = false,
    this.isPayLoading = false,
    this.calculateException,
    this.payException,
  });

  CommissionState copyWith({
    CommissionStep? currentStep,
    List<dynamic>? ads,
    dynamic selectedAd,
    CommissionCalculationModel? calculationModel,
    PayCommissionResponseModel? payResponseModel,
    double? enteredPrice,
    bool? isAdsLoading,
    bool? isCalculateLoading,
    bool? isPayLoading,
    AppException? calculateException,
    AppException? payException,
  }) {
    return CommissionState(
      currentStep: currentStep ?? this.currentStep,
      ads: ads ?? this.ads,
      selectedAd: selectedAd ?? this.selectedAd,
      calculationModel: calculationModel ?? this.calculationModel,
      payResponseModel: payResponseModel ?? this.payResponseModel,
      enteredPrice: enteredPrice ?? this.enteredPrice,
      isAdsLoading: isAdsLoading ?? this.isAdsLoading,
      isCalculateLoading: isCalculateLoading ?? this.isCalculateLoading,
      isPayLoading: isPayLoading ?? this.isPayLoading,
      calculateException: calculateException,
      payException: payException,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        ads,
        selectedAd,
        calculationModel,
        payResponseModel,
        enteredPrice,
        isAdsLoading,
        isCalculateLoading,
        isPayLoading,
        calculateException,
        payException,
      ];
}