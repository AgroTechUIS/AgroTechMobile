// coverage:ignore-file
import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/common_utilities/widgets/search_bar_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/button_date_widget.dart';
import 'package:flutter/material.dart';

class FilterByDate extends StatefulWidget {
  const FilterByDate({
    super.key,
    this.onSearch,
    this.onSelect,
  });

  final Function(String value)? onSearch;
  final Function? onSelect;

  @override
  State<FilterByDate> createState() => _FilterByDateState();
}

class _FilterByDateState extends State<FilterByDate> {
  DateTime initialDate = firstDayMonth();
  DateTime endDate = lastDayMonth();
  bool activeFilter = true;

  void _updateDates(DateTime date1, DateTime date2) {
    setState(() {
      initialDate = date1;
      endDate = date2;
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
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          if (widget.onSearch != null)
            SearchBarWidget(
              searchText: 'Buscar',
              onSend: (value) => widget.onSearch!(value),
            ),
          if (widget.onSelect != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonDateWidget(
                  text: ' Desde',
                  date: initialDate,
                  onTap: () => _selectDate(context, true),
                ),
                ButtonDateWidget(
                  text: ' Hasta',
                  date: endDate,
                  onTap: () => _selectDate(context, false),
                ),
                InkWell(
                  onTap: () => _confirmDate(context),
                  child: Container(
                    alignment: Alignment.center,
                    height: context.rp(60),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: !activeFilter ? colors.white : colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Filtrar ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.textColor,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.filter_list,
                          color: colors.textColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isInit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2050),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null && isInit) {
      _updateDates(picked, endDate);
    } else if (picked != null && !isInit) {
      _updateDates(initialDate, picked);
    }
  }

  Future<void> _confirmDate(BuildContext context) async {
    // filtrar
    if (!activeFilter) {
      changeActive(true);
      widget.onSelect!(initialDate, endDate);
      // quitar filtro
    } else {
      _updateDates(DateTime(0), lastDayMonth());
      changeActive(false);
      widget.onSelect!(initialDate, endDate);
    }
  }
}
