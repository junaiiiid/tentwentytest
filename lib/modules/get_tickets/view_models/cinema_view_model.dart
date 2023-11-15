import 'package:tentwenty_test/architecture/base_view_model.dart';
import 'package:tentwenty_test/modules/get_tickets/models/cinema_model.dart';

class CinemaViewModel extends BaseViewModel {
  List<CinemaModel> listOfCinemas = [
    CinemaModel(
        showData: TimeModel(
            date: DateTime.now(),
            timeSlots: [
              DateTime(2023, 12, 1, 12, 30),
              DateTime(2023, 12, 1, 13, 30),
            ],
            hallName: "Cinetech + Hall 1"),
        cinemaData: {
          0: [
            SeatModel(type: SeatTypes.empty, price: 0),
            SeatModel(type: SeatTypes.empty, price: 0),
            SeatModel(type: SeatTypes.empty, price: 0),
            SeatModel(type: SeatTypes.notAvailable, price: 0),
            SeatModel(type: SeatTypes.notAvailable, price: 0),
          ],
          1: [],
          2: [],
          3: [],
          4: [],
          5: [],
          6: [],
          7: [],
          8: [],
          9: [],
          10: [],
        }),
  ];

  @override
  void callDispose() {
    // TODO: implement callDispose
  }

  @override
  void callInit() {
    // TODO: implement callInit
  }
}
