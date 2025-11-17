
import 'package:chart_example_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  final List<DeveloperData> _chartData;
  final TooltipBehavior _tooltipBehavior;
  const Pie({super.key, required List<DeveloperData> chartData, required TooltipBehavior tooltipBehavior})
      : _chartData = chartData,
        _tooltipBehavior = tooltipBehavior;

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
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
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }


  //--------Functions ------------
  
  //------------------------------
}