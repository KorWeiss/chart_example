
import 'package:chart_example_app/model/developer_data.dart';
import 'package:chart_example_app/view/area.dart';
import 'package:chart_example_app/view/bar.dart';
import 'package:chart_example_app/view/doughnut.dart';
import 'package:chart_example_app/view/line.dart';
import 'package:chart_example_app/view/pie.dart';
import 'package:chart_example_app/view/step_lines.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//with는 추가 상속을 받기 위한 예약어
//provider 는 서비스 제공자 , observer는 감시자
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //Property
  //late 는 초기화를 나중으로 미룸
  late TabController tabbarController;

  late List<DeveloperData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() { //페이지가 새로 생성 될때 무조건 1번 사용 됨
    super.initState();
    tabbarController = TabController(length: 6, vsync: this);
    _chartData = [];
    _addData();
    
    _tooltipBehavior = TooltipBehavior(enable: true); //툴팁 사용 설정
  } 

   @override
  void dispose() {
    tabbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("차트 탭바"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView( //화면 이동이 아니라 화면 바꿔치기
        controller: tabbarController,
        physics: NeverScrollableScrollPhysics(), // 🔒 스와이프 막기
        children: [

          Bar(chartData: _chartData , tooltipBehavior: _tooltipBehavior),
          Line(chartData: _chartData, tooltipBehavior: _tooltipBehavior),
          Pie(chartData: _chartData, tooltipBehavior: _tooltipBehavior),
          Doughnut(chartData: _chartData , tooltipBehavior: _tooltipBehavior),
          Area(list: _chartData, tooltipBehavior: _tooltipBehavior),
          StepLines(list: _chartData),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: TabBar(  //탭바,
          controller: tabbarController,
          indicatorColor: Colors.red,
          indicatorWeight: 5,

          labelColor: Colors.blue,           // 선택된 탭 텍스트
          unselectedLabelColor: Colors.blueGrey, // 비선택 탭 텍스트

          isScrollable: false,
          tabs: [
            Tab(child: 
              Center(child: 
                Text('Bar', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ),
            ),
            Tab(child: 
              Center(child: 
                Text('Line', textAlign: TextAlign.center,style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold),),
              ),
            ),
            Tab(child: 
              Center(child: 
                Text('Pie', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ),
            ),
            Tab(child: 
              Center(child: 
                Text('Doughnut', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ),
            ),
            Tab(child: 
              Center(child: 
                Text('Area', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ),
            ),
            Tab(child: 
              Center(child: 
                Text('Step\nLine', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
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