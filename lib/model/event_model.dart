class EventModel {
  final String eventName;
  final String eventID;
  final String eventLocation;
  final DateTime eventDate;
  final DateTime eventTime;
  final List<String> eventParticipants;
  final String eventType;
  final String createdUserID;
  final String coverPic;
  final String eventDescription;
  final String eventLink;
  final String registrations;
  final DateTime createdTime;
  final String chatID;
  final bool isdeleted;

  EventModel({
    required this.eventName,
    required this.eventID,
    required this.eventLocation,
    required this.eventDate,
    required this.eventTime,
    required this.eventParticipants,
    required this.eventType,
    required this.createdUserID,
    required this.coverPic,
    required this.eventDescription,
    required this.eventLink,
    required this.registrations,
    required this.createdTime,
    required this.chatID,
    required this.isdeleted,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        eventName: map['eventname'],
        eventID: map['eventID'],
        eventLocation: map['eventLocation'],
        eventDate: map['eventDate'],
        eventTime: map['eventTime'],
        eventParticipants: map['eventParticipants'],
        eventType: map['eventType'],
        createdUserID: map['createdUserID'],
        coverPic: map['coverPic'],
        eventDescription: map['eventDescription'],
        eventLink: map['eventLink'],
        registrations: map['registrations'],
        createdTime: map['createdTime'],
        chatID: map['chatID'],
        isdeleted: map['isdeleted']);
  }
  Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'eventID': eventID,
      'eventLocation': eventLocation,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'eventParticipants': eventParticipants,
      'eventType': eventType,
      'createdUserID': createdUserID,
      'coverPic': coverPic,
      'eventDescription': eventDescription,
      'eventLink': eventLink,
      'registrations': registrations,
      'createdTime': createdTime,
      'chatID': chatID,
      'isdeleted': isdeleted,
    };
  }
}
