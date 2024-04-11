// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'kredi_karti.g.dart';

@HiveType(typeId: 1)
class KrediKarti {
  @HiveField(0)
String bankaAdi;
@HiveField(1)
int kartNo;
@HiveField(2)
int tarihAy;
@HiveField(3)
int tarihYil;
@HiveField(4)
int guvenlikNo;
  KrediKarti({
    required this.bankaAdi,
    required this.kartNo,
    required this.tarihAy,
    required this.tarihYil,
    required this.guvenlikNo,
  });
  KrediKarti update(KrediKarti updatedBankaHesabi) {
    this.bankaAdi = updatedBankaHesabi.bankaAdi;
    this.kartNo = updatedBankaHesabi.kartNo;
    this.tarihAy = updatedBankaHesabi.tarihAy;
    this.tarihYil = updatedBankaHesabi.tarihYil;
    this.guvenlikNo = updatedBankaHesabi.guvenlikNo;
    return this;
  }

  KrediKarti copyWith({
    String? bankaAdi,
    int? kartNo,
    int? tarihAy,
    int? tarihYil,
    int? guvenlikNo,
  }) {
    return KrediKarti(
      bankaAdi: bankaAdi ?? this.bankaAdi,
      kartNo: kartNo ?? this.kartNo,
      tarihAy: tarihAy ?? this.tarihAy,
      tarihYil: tarihYil ?? this.tarihYil,
      guvenlikNo: guvenlikNo ?? this.guvenlikNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankaAdi': bankaAdi,
      'kartNo': kartNo,
      'tarihAy': tarihAy,
      'tarihYil': tarihYil,
      'guvenlikNo': guvenlikNo,
    };
  }

  factory KrediKarti.fromMap(Map<String, dynamic> map) {
    return KrediKarti(
      bankaAdi: map['bankaAdi'] as String,
      kartNo: map['kartNo'] as int,
      tarihAy: map['tarihAy'] as int,
      tarihYil: map['tarihYil'] as int,
      guvenlikNo: map['guvenlikNo'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory KrediKarti.fromJson(String source) => KrediKarti.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'KrediKarti(bankaAdi: $bankaAdi, kartNo: $kartNo, tarihAy: $tarihAy, tarihYil: $tarihYil, guvenlikNo: $guvenlikNo)';
  }

  @override
  bool operator ==(covariant KrediKarti other) {
    if (identical(this, other)) return true;
  
    return 
      other.bankaAdi == bankaAdi &&
      other.kartNo == kartNo &&
      other.tarihAy == tarihAy &&
      other.tarihYil == tarihYil &&
      other.guvenlikNo == guvenlikNo;
  }

  @override
  int get hashCode {
    return bankaAdi.hashCode ^
      kartNo.hashCode ^
      tarihAy.hashCode ^
      tarihYil.hashCode ^
      guvenlikNo.hashCode;
  }
}
