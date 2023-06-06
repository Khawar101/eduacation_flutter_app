// ignore: file_names
import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../widgets/app_utils.dart';

class SlectDateTime extends StatefulWidget {
  const SlectDateTime({super.key});

  @override
  State<SlectDateTime> createState() => _SlectDateTimeState();
}

class _SlectDateTimeState extends State<SlectDateTime>
    with TickerProviderStateMixin {
  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  late TabController tabController;
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(_tabSelect);

    super.initState();
  }

  void _tabSelect() {
    log("Tab index is ${tabController.index}");
    setState(() {
      _currentIndex = tabController.index;
    });
  }

// ignore: unused_field
  final SfRangeValues _values = const SfRangeValues(20.0, 60.0);
  List<String> tags = [];
  List<String> options = [
    '06:00 AM',
    '07:00 AM',
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM'
  ];
  List<String> tags1 = [];
  List<String> options1 = [
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM'
  ];
  List<String> tags2 = [];
  List<String> options2 = [
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
    '09:00 PM',
    '10:00 PM',
    '11:00 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
        title: Text(
          "Slect Date & Time",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalendarWithActionButtons(),
              const SizedBox(height: 20),
              TabBar(
                indicatorWeight: 1,
                indicatorPadding: const EdgeInsets.only(bottom: 4),
                indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                controller: tabController,
                labelStyle: GoogleFonts.ibmPlexSans(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
                onTap: (value) {},
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                tabs: const [
                  Tab(
                    text: "Morning",
                  ),
                  Tab(text: "Afternoon"),
                  Tab(text: "Evening"),
                ],
              ),
              const SizedBox(height: 15),
              _getTabAtIndex(tabController.index),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const EnhanceScreen()),
                  // );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: ButtonText(
                    text: 'BOOK NOW',
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  Widget _buildCalendarWithActionButtons() {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      disableModePicker: true,
      buttonPadding: const EdgeInsets.only(left: 40, right: 20, bottom: 10),
      gapBetweenCalendarAndButtons: 0,
    );
    return Column(
      //  mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2WithActionButtons(
          config: config,
          value: _rangeDatePickerWithActionButtonsWithValue,
          onValueChanged: (dates) => setState(
              () => _rangeDatePickerWithActionButtonsWithValue = dates),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                _getValueText(
                  config.calendarType,
                  _rangeDatePickerWithActionButtonsWithValue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  //tabbarview
  Widget _getTabAtIndex(int index) {
    var list = [
      ChipsChoice<String>.multiple(
        crossAxisAlignment: CrossAxisAlignment.start,
        value: tags,
        choiceCheckmark: true,
        // placeholderStyle: TextStyle(fontSize: 4,color: Colors.red),

        padding: const EdgeInsets.all(0),
        onChanged: (val) => setState(() => tags = val),
        choiceItems: C2Choice.listFrom<String, String>(
          source: options,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
        choiceStyle: const C2ChipStyle(
          foregroundStyle: TextStyle(fontSize: 15),
          backgroundColor: Colors.black,
          checkmarkColor: Colors.black,
          foregroundColor: Colors.blue,
          overlayColor: Colors.blue,
          borderColor: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        wrapped: true,
      ),
      //afternoon time
      ChipsChoice<String>.multiple(
        crossAxisAlignment: CrossAxisAlignment.start,
        value: tags1,
        choiceCheckmark: true,
        // placeholderStyle: TextStyle(fontSize: 4,color: Colors.red),

        padding: const EdgeInsets.all(0),
        onChanged: (val) => setState(() => tags1 = val),
        choiceItems: C2Choice.listFrom<String, String>(
          source: options1,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
        choiceStyle: const C2ChipStyle(
          foregroundStyle: TextStyle(fontSize: 15),
          backgroundColor: Colors.black,
          checkmarkColor: Colors.black,
          foregroundColor: Colors.blue,
          overlayColor: Colors.blue,
          borderColor: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        wrapped: true,
      ),
      //evening time
      ChipsChoice<String>.multiple(
        crossAxisAlignment: CrossAxisAlignment.start,
        value: tags2,
        choiceCheckmark: true,
        // placeholderStyle: TextStyle(fontSize: 4,color: Colors.red),

        padding: const EdgeInsets.all(0),
        onChanged: (val) => setState(() => tags2 = val),
        choiceItems: C2Choice.listFrom<String, String>(
          source: options2,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
        choiceStyle: const C2ChipStyle(
          foregroundStyle: TextStyle(fontSize: 15),
          backgroundColor: Colors.black,
          checkmarkColor: Colors.black,
          foregroundColor: Colors.blue,
          overlayColor: Colors.blue,
          borderColor: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        wrapped: true,
      ),
    ];
    return list[index];
  }
}
