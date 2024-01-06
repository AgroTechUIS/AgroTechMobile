import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/button_date_widget.dart';
import 'package:flutter/material.dart';

class FilterOneDate extends StatefulWidget {
  const FilterOneDate({
    super.key,
    required this.onSelect,
  });

  final Function(DateTime date) onSelect;

  @override
  State<FilterOneDate> createState() => _FilterOneDateState();
}

class _FilterOneDateState extends State<FilterOneDate> {
  DateTime initialDate = DateTime.now();
  bool activeFilter = false;

  void _updateDate(DateTime date) {
    setState(() {
      initialDate = date;
    });
  }

  void changeActive(bool active) {
    setState(() {
      activeFilter = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonDateWidget(
            text: ' Fecha',
            date: initialDate,
            onTap: () => _selectDate(context),
          ),
          InkWell(
            onTap: () => _confirmDate(context),
            child: Container(
              alignment: Alignment.center,
              height: context.rp(60),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: activeFilter ? colors.orange : colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    activeFilter ? 'Quitar ' : 'Filtrar ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.textColor,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    activeFilter ? Icons.close : Icons.filter_list,
                    color: colors.textColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2050),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) _updateDate(picked);
  }

  Future<void> _confirmDate(BuildContext context) async {
    if (!activeFilter) {
      changeActive(true);
      widget.onSelect(initialDate);
    } else {
      _updateDate(DateTime.now());
      changeActive(false);
      widget.onSelect(initialDate);
    }
  }
}
