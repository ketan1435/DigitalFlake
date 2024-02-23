class SlotsModel {
  List<Slots>? slots;

  SlotsModel({this.slots});

  SlotsModel.fromJson(Map<String, dynamic> json) {
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  String? slotName;
  int? slotId;
  bool? slotActive;

  Slots({this.slotName, this.slotId, this.slotActive});

  Slots.fromJson(Map<String, dynamic> json) {
    slotName = json['slot_name'];
    slotId = json['slot_id'];
    slotActive = json['slot_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_name'] = this.slotName;
    data['slot_id'] = this.slotId;
    data['slot_active'] = this.slotActive;
    return data;
  }
}
