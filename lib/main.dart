import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here
  SyncfusionLicense.registerLicense(null);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chart Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
              primaryXAxis: NumericAxis(
                visibleMinimum: 4, 
                visibleMaximum: 7,
                interval:1
              ),
              title: ChartTitle(text: 'Sales analysis'),
              tooltipBehavior: TooltipBehavior(enable: true),
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true
              ),
              series: <ChartSeries<SalesData, double>>[
                LineSeries<SalesData, double>(
                    dataSource: <SalesData>[
                      SalesData(1, 35),
                      SalesData(2, 28),
                      SalesData(3, 34),
                      SalesData(4, 32),
                      SalesData(5, 40),
                      SalesData(6, 26),
                      SalesData(7, 32),
                      SalesData(8, 38),
                      SalesData(9, 24),
                      SalesData(10, 42)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales)
              ]),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}
