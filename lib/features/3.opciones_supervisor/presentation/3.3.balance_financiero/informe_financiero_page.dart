import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/tools.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeFinancieroPage extends ConsumerWidget {
  const InformeFinancieroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(balanceFinanciero);
    var state = ref.watch(supervisorController);
    var controller = ref.read(supervisorController.notifier);

    if (loadState.hasError) {
      return ErrorScreen(connectionError: loadState.asError.toString());
    }

    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.green3,
      ),
      body: BackgroundBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderPageWidget('Informe financiero'),
              SectionWidget(
                children: [
                  FilterYearWidget(
                    onSelect: (date) {},
                  ),
                  loadState.when(
                    data: (data) {
                      var dataReport = data;
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          const SubtitleWidget('Finanzas:'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InfoBox(
                                title: 'Ventas:',
                                value: '${dataReport.ventasTotales}',
                              ),
                              InfoBox(
                                title: 'Ganancias:',
                                value: '\$ ${formatNumber(dataReport.ganaciaTotal)}',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InfoBox(
                                title: 'Compras:',
                                value: '${dataReport.comprasTotales}',
                              ),
                              InfoBox(
                                title: 'Gastos:',
                                value: '\$ ${formatNumber(dataReport.gastoTotal)}',
                              ),
                            ],
                          ),
                          const SubtitleWidget('Graficas:'),
                          BarChartWidget(
                            chartType: ChartType.month,
                            listPoints: dataReport.historicalGraph.sublist(0, 12),
                            title: 'Ventas vs gastos',
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) => const SizedBox(),
                    loading: () => LoadingBoxWidget(
                      child: Container(
                        width: double.infinity,
                        color: colors.white,
                        child: Column(
                          children: const [SizedBox(height: 1000)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterYearWidget extends StatefulWidget {
  const FilterYearWidget({
    super.key,
    required this.onSelect,
  });

  final Function(int year) onSelect;

  @override
  State<FilterYearWidget> createState() => _FilterYearState();
}

class _FilterYearState extends State<FilterYearWidget> {
  int yearSelect = DateTime.now().year;
  bool activeFilter = false;

  void _updateDate(int year) {
    setState(() {
      yearSelect = year;
    });
  }

  void _changeActive(bool active) {
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
          IconButton(
            icon: Icon(
              Icons.arrow_left,
              color: colors.white,
              size: 30,
            ),
            onPressed: () => _subtractYear(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: context.rp(30),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Año $yearSelect',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_right,
              color: colors.white,
              size: 30,
            ),
            onPressed: () => _addYear(),
          ),
          InkWell(
            onTap: () => _confirmDate(),
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

  void _subtractYear() {
    setState(() {
      if (yearSelect > 0) {
        yearSelect--;
      }
    });
  }

  void _addYear() {
    setState(() {
      yearSelect++;
    });
  }

  /*Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2050),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) _updateDate(picked);
  }*/

  Future<void> _confirmDate() async {
    if (!activeFilter) {
      _changeActive(true);
      widget.onSelect(yearSelect);
    } else {
      _updateDate(DateTime.now().year);
      _changeActive(false);
      widget.onSelect(yearSelect);
    }
  }
}
