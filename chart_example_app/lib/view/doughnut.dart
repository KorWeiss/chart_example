
import 'package:chart_example_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Doughnut extends StatefulWidget {
  final List<DeveloperData> _chartData;
  final TooltipBehavior _tooltipBehavior;
  const Doughnut({super.key, required List<DeveloperData> chartData, required TooltipBehavior tooltipBehavior})
      : _chartData = chartData,
        _tooltipBehavior = tooltipBehavior;

  @override
  State<Doughnut> createState() => _DoughnutState();
}

class _DoughnutState extends State<Doughnut> {
  //Property
  //late 는 초기화를 나중으로 미룸
  late List<DeveloperData> _chartData;
  


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
      // appBar: AppBar(
      //   title: const Text("Bar Chart"),
      //   backgroundColor: Colors.blue, // AppBar 배경색
      //   foregroundColor: Colors.white, // AppBar 글자색
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              height: 600,
              child: SfCircularChart(
                title: ChartTitle(text: "Yearly  Growth  in the Flutter Community"), //차트 제목
                legend: Legend(isVisible: true), //범례
                tooltipBehavior: widget._tooltipBehavior,
                series: [
                  //ColumnSeries = 세로 막대 그래프
                  //BarSeries = 가로 막대 그래프
                  DoughnutSeries<DeveloperData, int>(
                    name: "사이트 수", //범례 이름
                    dataSource: widget._chartData,
                    selectionBehavior: SelectionBehavior( //
                      enable: true,
                      toggleSelection: true, //
                    ),
                    xValueMapper: (DeveloperData developers, _) { //x축 값 설정
                      return developers.years; //연도
                    }, 
                    yValueMapper: (DeveloperData developers, _)=> developers.developers, //y축 값 설정 //사이트 수, 
                    dataLabelSettings: const DataLabelSettings(isVisible: true), //데이터 라벨 설정
                    enableTooltip: true,
                    explode: true, //조각 분리
                    explodeIndex: 0, //처음 조각 분리
                    explodeOffset: '20%', //조각 분리 거리
                  ),
                ],
                //X,Y축은 없음
              ),
            ),
          ],
        ),
      ),
    );
  }


  //--------Functions ------------
  void _addData() {
    _chartData.add(DeveloperData(years: 2017, developers: 19000));
    _chartData.add(DeveloperData(years: 2018, developers: 40000));
    _chartData.add(DeveloperData(years: 2019, developers: 35000));
    _chartData.add(DeveloperData(years: 2020, developers: 37000));
    _chartData.add(DeveloperData(years: 2021, developers: 45000));
  }
  //------------------------------
}