import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _timeSlots = [];
  String? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    _timeSlots = [];
    for (int i = 10; i <= 12; i++) {
      _timeSlots.add('${i.toString().padLeft(2, '0')}.00 ${i >= 12 ? 'PM' : 'AM'}');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tealColor = Color(0xFF0B8FAC);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Date And Time',
          style: TextStyle(color: tealColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.all,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left, color: tealColor),
                rightChevronIcon: Icon(Icons.chevron_right, color: tealColor),
                headerPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                weekendStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: tealColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: tealColor.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(color: Colors.black),
                weekendTextStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Time Slot',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: tealColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _timeSlots.length,
                itemBuilder: (context, index) {
                  final timeSlot = _timeSlots[index];
                  final isSelected = _selectedTimeSlot == timeSlot;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTimeSlot = timeSlot;
                        });
                      },
                      child: Text(
                        timeSlot,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected ? tealColor : Colors.white,
                        side: BorderSide(
                          color: tealColor,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Adjusted for more rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 1.0, // Adjusted for smaller height
                          horizontal: 150.0,
                        ),
                        minimumSize: Size(100, 50), // Adjusted size
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Set Appointment logic here
                },
                child: Text(
                  'Set Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealColor,
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: tealColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle bottom navigation bar item taps
        },
      ),
    );
  }
}
