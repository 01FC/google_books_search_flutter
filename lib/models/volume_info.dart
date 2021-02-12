import 'package:equatable/equatable.dart';

import "image_links.dart";
import "industry_identifiers.dart";
import "panelization_summary.dart";
import "reading_modes.dart";

class VolumeInfo extends Equatable {
  final String title;
  final List<String> authors;
  final String publishedDate;
  final List<IndustryIdentifiers> industryIdentifiers;
  final ReadingModes readingModes;
  final String printType;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary panelizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  final List<String> categories;
  final String description;
  final int pageCount;

  const VolumeInfo({
    this.pageCount,
    this.description,
    this.categories,
    this.title,
    this.authors,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.printType,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  @override
  String toString() {
    return 'VolumeInfo(title: $title, authors: $authors, publishedDate: $publishedDate, industryIdentifiers: $industryIdentifiers, readingModes: $readingModes, printType: $printType, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, panelizationSummary: $panelizationSummary, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink)';
  }

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      pageCount: json["pageCount"] as int,
      description: json["description"] as String,
      categories: (json["categories"]?.cast<String>()),
      title: json['title'] as String,
      authors: (json['authors']?.cast<String>()),
      publishedDate: json['publishedDate'] as String,
      industryIdentifiers:
          (json['industryIdentifiers'] as List<dynamic>)?.map((e) {
        return e == null
            ? null
            : IndustryIdentifiers.fromJson(e as Map<String, dynamic>);
      })?.toList(),
      readingModes: json['readingModes'] == null
          ? null
          : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
      printType: json['printType'] as String,
      maturityRating: json['maturityRating'] as String,
      allowAnonLogging: json['allowAnonLogging'] as bool,
      contentVersion: json['contentVersion'] as String,
      panelizationSummary: json['panelizationSummary'] == null
          ? null
          : PanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String,
      previewLink: json['previewLink'] as String,
      infoLink: json['infoLink'] as String,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "pageCount": pageCount,
      "categories": categories,
      'title': title,
      'authors': authors,
      'publishedDate': publishedDate,
      'industryIdentifiers':
          industryIdentifiers?.map((e) => e?.toJson())?.toList(),
      'readingModes': readingModes?.toJson(),
      'printType': printType,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'panelizationSummary': panelizationSummary?.toJson(),
      'imageLinks': imageLinks?.toJson(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }

  VolumeInfo copyWith({
    String title,
    List<String> authors,
    String publishedDate,
    List<IndustryIdentifiers> industryIdentifiers,
    ReadingModes readingModes,
    String printType,
    String maturityRating,
    bool allowAnonLogging,
    String contentVersion,
    PanelizationSummary panelizationSummary,
    ImageLinks imageLinks,
    String language,
    String previewLink,
    String infoLink,
    String canonicalVolumeLink,
  }) {
    return VolumeInfo(
      title: title ?? this.title,
      authors: authors ?? this.authors,
      publishedDate: publishedDate ?? this.publishedDate,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      readingModes: readingModes ?? this.readingModes,
      printType: printType ?? this.printType,
      maturityRating: maturityRating ?? this.maturityRating,
      allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
      contentVersion: contentVersion ?? this.contentVersion,
      panelizationSummary: panelizationSummary ?? this.panelizationSummary,
      imageLinks: imageLinks ?? this.imageLinks,
      language: language ?? this.language,
      previewLink: previewLink ?? this.previewLink,
      infoLink: infoLink ?? this.infoLink,
      canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      authors,
      publishedDate,
      industryIdentifiers,
      readingModes,
      printType,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
