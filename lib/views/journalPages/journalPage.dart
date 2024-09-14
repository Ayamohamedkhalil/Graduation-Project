import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/journalPages/journalPageIfSelectedDay.dart';
import 'package:splash_onboarding_test/views/journalPages/journalYearPage.dart';
import 'package:splash_onboarding_test/views/journalPages/widgets/JournalData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime selectedYear = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color(0xff537F5C),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //
                //SearchBar
                //
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: const Color(0xff537F5C),
                      filled: true,
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon:
                          const Icon(Icons.mic_none, color: Colors.white),
                      hintText: 'Search for test',
                      hintStyle: const TextStyle(
                          color: Color(0xffD9D9D9),
                          fontFamily: 'Ledger',
                          fontSize: 18),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome John!",
                          style: TextStyle(
                              color: Color(0xffAFAC7F),
                              fontSize: 29,
                              fontFamily: 'Ledger'),
                        ),
                        Icon(
                          FontAwesomeIcons.penToSquare,
                          size: 30,
                          color: Color(0xffAFAC7F),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text(
                        "Malaz thinks you are about to make something great",
                        softWrap: true,
                        style: TextStyle(
                            color: Color.fromARGB(216, 255, 255, 255),
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //
                //calender
                //
                TableCalendar(
                  //daysOfWeekHeight:3 ,
                  //rowHeight: 1,

                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) {
                      switch (DateFormat('E', locale).format(date)) {
                        case "Sun":
                          return "S";

                        case "Mon":
                          return "M";

                        case "Tue":
                          return "T";

                        case "Wed":
                          return "W";

                        case "Thu":
                          return "T";

                        case "Fri":
                          return "F";

                        case "Sat":
                          return "S";

                        default:
                          return DateFormat('E', locale).format(date);
                      }
                    },
                    weekdayStyle: const TextStyle(
                        color: Colors.white, fontFamily: 'Ledger'),
                    weekendStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ledger',
                    ),
                  ),

                  calendarStyle: CalendarStyle(
                      //   cellPadding: EdgeInsets.symmetric(vertical: 20),
                      cellMargin:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                      //cellMargin: const EdgeInsets.symmetric(),
                      todayTextStyle: const TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                          color: const Color.fromARGB(68, 217, 217, 217),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(100)),
                      selectedTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: const TextStyle(color: Colors.white),
                      outsideTextStyle: const TextStyle(
                          color: Color.fromARGB(85, 255, 255, 255)),
                      weekendTextStyle: const TextStyle(color: Colors.white)),
                  headerStyle: HeaderStyle(
                    // headerMargin: EdgeInsets.only(top: 10),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    titleTextFormatter: (date, locale) =>
                        DateFormat('MMM : yyyy', locale).format(date),
                    leftChevronMargin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    rightChevronMargin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1),
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontFamily: 'Ledger', // Change the font to Ledger
                    ),
                    leftChevronVisible: true,
                    rightChevronVisible: true,
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2050, 12, 31),
                  focusedDay: focusedDay,
                  calendarFormat: calendarFormat,
                  //
                  //to mark on day that selcted only
                  //
                  selectedDayPredicate: (day) {
                    return day == selectedDay ? true : false;
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDay = selectedDay;
                      focusedDay = focusedDay;
                    });
                    //
                    // go to the second Page
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JournalPageDay(selectDay: selectedDay),
                      ),
                    );
                  },
                  onPageChanged: (focusedDay) {
                    focusedDay = focusedDay;
                  },
                  onHeaderTapped: (Date) {
                    setState(() {
                      selectedYear = Date;
                    });
                    //
                    //go to third Page
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Journalyearpage(
                          selectYear: selectedYear.year,
                        ),
                      ),
                    );
                  },
                ),
                //
                //
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Month Journals",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Ledger'),
                          ),
                          /*GestureDetector(
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                  color: Color(0xffD1CEA1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Ledger'),
                            ),
                          )*/
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return JournalData(
                          title: "I was wondering", date: "14/1/2024");
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 5,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              child: const BarButton())
        ]),
      ),
    );
  }
}
