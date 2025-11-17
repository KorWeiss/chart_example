
import 'package:chart_example_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Bar extends StatefulWidget {
  final List<DeveloperData> _chartData;
  final TooltipBehavior _tooltipBehavior;
  const Bar({super.key, required List<DeveloperData> chartData, required TooltipBehavior tooltipBehavior})
      : _chartData = chartData,
        _tooltipBehavior = tooltipBehavior;

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  //Property
  //late 는 초기화를 나중으로 미룸


  @override
  void initState() { //페이지가 새로 생성 될때 무조건 1번 사용 됨
    super.initState();
   
  }
  
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bar",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white, // AppBar 배경색
        foregroundColor: Colors.black, // AppBar 글자색
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              height: 600,
              child: SfCartesianChart(
                title: ChartTitle(text: "Yearly  Growth  in the Flutter Community"), //차트 제목
                legend: Legend(isVisible: true,title: LegendTitle(text: '범례')), //범례
                tooltipBehavior: widget._tooltipBehavior,
                series: [
                  //ColumnSeries = 세로 막대 그래프
                  //BarSeries = 가로 막대 그래프
                  ColumnSeries<DeveloperData, int>(
                    name: "사이트 수", //범례 이름
                    dataSource: widget._chartData,
                    xValueMapper: (DeveloperData developers, _) { //x축 값 설정
                      return developers.years; //연도
                    }, 
                    yValueMapper: (DeveloperData developers, _)=> developers.developers, //y축 값 설정 //사이트 수, 
                    dataLabelSettings: const DataLabelSettings(isVisible: true), //데이터 라벨 설정
                    enableTooltip: true,
                  ),
                ],
                //x축을 CategoryAxis 로 표현
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: "연도",),
                  labelRotation: 45,
                ),
                //y축을 NumericAxis 로 표현
                primaryYAxis: NumericAxis( 
                  title: AxisTitle(text: "사이트 수",),            
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  //--------Functions ------------
  
  //------------------------------
}