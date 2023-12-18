import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Chart Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(enablePanning: true);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SfCartesianChart(
            primaryXAxis: NumericAxis(
                initialVisibleMinimum: 4,
                initialVisibleMaximum: 7,
                interval: 1),
            title: ChartTitle(text: 'Sales analysis'),
            tooltipBehavior: _tooltipBehavior,
            zoomPanBehavior: _zoomPanBehavior,
            series: <LineSeries<SalesData, double>>[
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
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}
