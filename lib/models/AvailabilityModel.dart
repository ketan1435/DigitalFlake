class AvailabilityModel {
  List<Availability>? availability;

  AvailabilityModel({this.availability});

  AvailabilityModel.fromJson(Map<String, dynamic> json) {
    if (json['availability'] != null) {
      availability = <Availability>[];
      json['availability'].forEach((v) {
        availability!.add(new Availability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availability != null) {
      data['availability'] = this.availability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Availability {
  String? workspaceName;
  int? workspaceId;
  bool? workspaceActive;

  Availability({this.workspaceName, this.workspaceId, this.workspaceActive});

  Availability.fromJson(Map<String, dynamic> json) {
    workspaceName = json['workspace_name'];
    workspaceId = json['workspace_id'];
    workspaceActive = json['workspace_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workspace_name'] = this.workspaceName;
    data['workspace_id'] = this.workspaceId;
    data['workspace_active'] = this.workspaceActive;
    return data;
  }
}
