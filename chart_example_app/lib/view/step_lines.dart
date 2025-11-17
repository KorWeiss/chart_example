import 'package:chart_example_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StepLines extends StatefulWidget {
  final List<DeveloperData> list;
  const StepLines({super.key, required this.list});

  @override
  State<StepLines> createState() => _StepLinesState();
}

class _StepLinesState extends State<StepLines> {
 late List<DeveloperData> _developerDataList;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _developerDataList = widget.list;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Step Line')),

      body: Center(
        child: Center(
          child: SizedBox(
            width: 400,
            height: 600,
            child: SfCartesianChart(
              title: ChartTitle(
                text: 'Yearly Growth in the Flutter Community\n\n',
              ),
              tooltipBehavior: _tooltipBehavior,
              legend: Legend(isVisible: true, title: LegendTitle(text: '범례')),

              series: [
                // LineSeries는 추세와 경향을 보는 그래프
                StepLineSeries<DeveloperData, int>(
                  name: 'Site 수',
                  dataSource: _developerDataList,
                  xValueMapper: (DeveloperData developers, _) {
                    return developers.years;
                  },
                  yValueMapper: (DeveloperData developers, _) =>
                      developers.developers,
                  enableTooltip: true,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
              //x축을 Category로 표현
              primaryXAxis: CategoryAxis(title: AxisTitle(text: '년도')),
              //y축은 숫자로 표현
              primaryYAxis: NumericAxis(title: AxisTitle(text: '사이트 수')),
            ),
          ),
        ),
      ),
    );
  }
}
