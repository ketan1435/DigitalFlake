class BookingHistoryModel {
  List<Bookings>? bookings;

  BookingHistoryModel({this.bookings});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  String? workspaceName;
  int? workspaceId;
  String? bookingDate;

  Bookings({this.workspaceName, this.workspaceId, this.bookingDate});

  Bookings.fromJson(Map<String, dynamic> json) {
    workspaceName = json['workspace_name'];
    workspaceId = json['workspace_id'];
    bookingDate = json['booking_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workspace_name'] = this.workspaceName;
    data['workspace_id'] = this.workspaceId;
    data['booking_date'] = this.bookingDate;
    return data;
  }
}
