import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';

class DiscountState {
  final List<DiscountModel> descuentos;
  DiscountModel? selectedDiscountForEdit;

  DiscountState({
    this.descuentos = const [],
    this.selectedDiscountForEdit,
  });

  DiscountState copyWith({
    List<DiscountModel>? descuentos,
    DiscountModel? selectedDiscountForEdit,
  }) {
    return DiscountState(
      descuentos: descuentos ?? this.descuentos,
      selectedDiscountForEdit:
          selectedDiscountForEdit ?? this.selectedDiscountForEdit,
    );
  }
}
