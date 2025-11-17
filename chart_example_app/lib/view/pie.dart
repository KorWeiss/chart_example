import 'package:chart_example_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  final List<DeveloperData> _chartData;
  final TooltipBehavior _tooltipBehavior;
  const Pie({
    super.key,
    required List<DeveloperData> chartData,
    required TooltipBehavior tooltipBehavior,
  }) : _chartData = chartData,
       _tooltipBehavior = tooltipBehavior;

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  //Property
  //late 는 초기화를 나중으로 미룸
  late List<DeveloperData> _developerDataList;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    //페이지가 새로 생성 될때 무조건 1번 사용 됨
    super.initState();
    _developerDataList = widget._chartData;
    _tooltipBehavior = widget._tooltipBehavior;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pie', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 600,
          child: SfCircularChart(
            title: ChartTitle(text: 'Yearly Growth in the Flutter Community'),
            legend: Legend(isVisible: true, title: LegendTitle(text: '범례'), ),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Site 수',
                dataSource: _developerDataList,
                explode: true,
                selectionBehavior: SelectionBehavior(
                  enable: true
                ),
                xValueMapper: (DeveloperData developers, _) {return developers.years;},
                yValueMapper: (DeveloperData developers, _) =>developers.developers,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true),
                enableTooltip: true,
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  //--------Functions ------------

  //------------------------------
}
