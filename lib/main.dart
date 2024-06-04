import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCalender(),
    );
  }
}

class MyCalender extends StatefulWidget {
  const MyCalender({super.key});

  @override
  State<MyCalender> createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay) {
    setState(() {
    today = day;
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calender 2024")),
      body: content(),
    );
  }
}
Widget content() {
  var today;
  return Column(
    children: [
      Text("Selected Day = " + today.toString().split(" .")[0]),
      Container(
        child: TableCalendar(
          locale: "en_US",
          rowHeight: 43,
          headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day)=>isSameDay(day,today),
          focusedDay: today,
          firstDay: DateTime.utc(2024,1,1),
          lastDay: DateTime.utc(2024,12,31),
          onDaySelected: _onDaySelected,
          ),
      ),
    ],
  );
}
void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
}
