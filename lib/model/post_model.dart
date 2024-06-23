import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postType;
  final String postUserID;
  final DateTime? postedTime;
  final String postTitle;
  final String postDescription;
  final String commonPostType;
  final String videoUrl;
  final List<String> imageUrls;
  final List<String> tags;
  final DateTime? announcementDate;
  final String announcementImage;
  final String groupID;
  final int totalLikes;
  final List<String> allLikes;
  final List<String> thumbsUPLikes;
  final List<String> heartLikes;
  final List<String> celebrateLikes;
  final int totalComments;
  final String link;
  final bool isDeleted;

  PostModel({
    required this.postType,
    required this.postUserID,
    required this.postedTime,
    required this.postTitle,
    required this.postDescription,
    required this.commonPostType,
    required this.videoUrl,
    required this.imageUrls,
    required this.tags,
    required this.announcementDate,
    required this.announcementImage,
    required this.groupID,
    required this.totalLikes,
    required this.allLikes,
    required this.thumbsUPLikes,
    required this.heartLikes,
    required this.celebrateLikes,
    required this.totalComments,
    required this.link,
    required this.isDeleted,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postType: map['postType'] ?? '',
      postUserID: map['postUserID'] ?? '',
      postedTime: map['postedTime'] != null
          ? (map['postedTime'] as Timestamp).toDate()
          : null,
      postTitle: map['postTitle'] ?? '',
      postDescription: map['postDescription'] ?? '',
      commonPostType: map['commonPostType'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      tags: List<String>.from(map['tags'] ?? []),
      announcementDate: map['announcementDate'] != null
          ? (map['announcementDate'] as Timestamp).toDate()
          : null,
      announcementImage: map['announcementImage'] ?? '',
      groupID: map['groupID'] ?? '',
      totalLikes: map['totalLikes'] ?? 0,
      allLikes: List<String>.from(map['allLikes'] ?? []),
      thumbsUPLikes: List<String>.from(map['thumbsUPLikes'] ?? []),
      heartLikes: List<String>.from(map['heartLikes'] ?? []),
      celebrateLikes: List<String>.from(map['celebrateLikes'] ?? []),
      totalComments: map['totalComments'] ?? 0,
      link: map['link'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postType': postType,
      'postUserID': postUserID,
      'postedTime': postedTime,
      'postTitle': postTitle,
      'postDescription': postDescription,
      'commonPostType': commonPostType,
      'videoUrl': videoUrl,
      'imageUrls': imageUrls,
      'tags': tags,
      'announcementDate': announcementDate,
      'announcementImage': announcementImage,
      'groupID': groupID,
      'totalLikes': totalLikes,
      'allLikes': allLikes,
      'thumbsUPLikes': thumbsUPLikes,
      'celebrateLikes': celebrateLikes,
      'totalComments': totalComments,
      'link': link,
      'isDeleted': isDeleted,
    };
  }
}
