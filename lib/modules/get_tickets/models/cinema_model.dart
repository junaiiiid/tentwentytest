class CinemaModel {
  TimeModel showData;
  Map<int,List<SeatModel>> cinemaData;

  CinemaModel({required this.showData,required this.cinemaData});
}

class SeatModel {
  SeatTypes type;
  double price;

  SeatModel({required this.type, required this.price});
}

class TimeModel {
  DateTime date;
  List<DateTime> timeSlots;
  String hallName;

  TimeModel({required this.date, required this.timeSlots,required this.hallName});

  String getFormattedDate() {
    // Custom date format: day Month (e.g., 5 Mar, 6 Mar, 25 Dec)
    return "${date.day} ${_getMonthAbbreviation(date.month)}";
  }

  List<String> getFormattedTimeSlots() {
    // Custom time slot format: HH:mm (e.g., 12:30, 13:30)
    return timeSlots.map((timeSlot) {
      return "${_formatTwoDigitNumber(timeSlot.hour)}:${_formatTwoDigitNumber(timeSlot.minute)}";
    }).toList();
  }

  String _getMonthAbbreviation(int month) {
    // Mapping month numbers to their abbreviations
    final months = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };
    return months[month] ?? '';
  }

  String _formatTwoDigitNumber(int number) {
    // Format a number with leading zeros if it's less than 10
    return number.toString().padLeft(2, '0');
  }
}

enum SeatTypes {
  empty,
  selected,
  notAvailable,
  vip,
}
