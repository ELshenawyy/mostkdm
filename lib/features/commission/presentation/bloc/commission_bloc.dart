import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/commission/data/repository/commision_repository.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_event.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';

class CommissionBloc extends Bloc<CommissionEvent, CommissionState> {
  final CommissionRepository _repository;

  CommissionBloc(this._repository) : super(const CommissionState()) {
    on<GetCommissionAdsEvent>(_onGetCommissionAds);
    on<SelectAdEvent>(_onSelectAd);
    on<ChangeStepEvent>(_onChangeStep);
    on<GoToPreviousStepEvent>(_onGoToPreviousStep);
    on<CalculateCommissionEvent>(_onCalculateCommission);
    on<PayCommissionEvent>(_onPayCommission);
  }

  Future<void> _onGetCommissionAds(
      GetCommissionAdsEvent event, Emitter<CommissionState> emit) async {
    emit(state.copyWith(isAdsLoading: true));

    // 1. إذا كان الـ Repository جاهزاً لدواعي الربط الفعلي:
    /*
    final result = await _repository.getCommissionAds(); // استدعِ دالة الـ Repo الخاصة بك
    result.fold(
      (exception) => emit(state.copyWith(
        isAdsLoading: false,
        // أضف Exception إذا أردت التعامل معه في الـ UI
      )),
      (adsList) => emit(state.copyWith(
        isAdsLoading: false,
        ads: adsList,
      )),
    );
    */

    // 2. حل مؤقت للتأكد من عمل الـ UI والشاشة (Mock Data):
    await Future.delayed(const Duration(milliseconds: 400));
    final mockAds = [
      {
        'image': 'assets/images/car_add.png',
        'title': 'بلايستيشن فايف مع 5 ألعاب',
        'price': '₴ 2,100',
        'isPaid': false,
      },
      {
        'image': 'assets/images/car_add.png',
        'title': 'تويوتا كامرى 2024 فل كامل 250 ألف كيلو',
        'price': '₴ 75,100',
        'isPaid': true,
      },
    ];

    emit(state.copyWith(
      isAdsLoading: false,
      ads: mockAds,
    ));
  }

  void _onSelectAd(SelectAdEvent event, Emitter<CommissionState> emit) {
    emit(state.copyWith(selectedAd: event.ad));
  }

  void _onChangeStep(ChangeStepEvent event, Emitter<CommissionState> emit) {
    emit(state.copyWith(currentStep: event.step));
  }

  void _onGoToPreviousStep(
      GoToPreviousStepEvent event, Emitter<CommissionState> emit) {
    if (state.currentStep == CommissionStep.payment) {
      emit(state.copyWith(currentStep: CommissionStep.price));
    } else if (state.currentStep == CommissionStep.price ||
        state.currentStep == CommissionStep.exempt) {
      emit(state.copyWith(currentStep: CommissionStep.ads));
    }
  }

  Future<void> _onCalculateCommission(
      CalculateCommissionEvent event, Emitter<CommissionState> emit) async {
    emit(state.copyWith(
      isCalculateLoading: true,
      enteredPrice: event.price,
      calculateException: null,
    ));

    final result = await _repository.calculateCommission(price: event.price);

    result.fold(
      (exception) => emit(state.copyWith(
        isCalculateLoading: false,
        calculateException: exception,
      )),
      (data) => emit(state.copyWith(
        isCalculateLoading: false,
        calculationModel: data,
        currentStep: CommissionStep.price,
      )),
    );
  }

  Future<void> _onPayCommission(
      PayCommissionEvent event, Emitter<CommissionState> emit) async {
    if (state.enteredPrice == null) return;

    emit(state.copyWith(
      isPayLoading: true,
      payException: null,
    ));

    final result = await _repository.payCommission(
      price: state.enteredPrice!,
      paymentMethod: event.paymentMethod,
    );

    result.fold(
      (exception) => emit(state.copyWith(
        isPayLoading: false,
        payException: exception,
      )),
      (data) => emit(state.copyWith(
        isPayLoading: false,
        payResponseModel: data,
      )),
    );
  }
}