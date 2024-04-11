// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'banka_hesabi.g.dart';

@HiveType(typeId: 0)
class BankaHesabi {
  @HiveField(0)
String bankaAdi;
@HiveField(1)
int iban;
@HiveField(2)
int kartNo;
@HiveField(3)
int tarihAy;
@HiveField(4)
int tarihYil;
@HiveField(5)
int guvenlikNo;
  BankaHesabi({
    required this.bankaAdi,
    required this.iban,
    required this.kartNo,
    required this.tarihAy,
    required this.tarihYil,
    required this.guvenlikNo,
  });

   BankaHesabi update(BankaHesabi updatedBankaHesabi) {
    this.bankaAdi = updatedBankaHesabi.bankaAdi;
    this.iban = updatedBankaHesabi.iban;
    this.kartNo = updatedBankaHesabi.kartNo;
    this.tarihAy = updatedBankaHesabi.tarihAy;
    this.tarihYil = updatedBankaHesabi.tarihYil;
    this.guvenlikNo = updatedBankaHesabi.guvenlikNo;
    return this;
  }


  BankaHesabi copyWith({
    String? bankaAdi,
    int? iban,
    int? kartNo,
    int? tarihAy,
    int? tarihYil,
    int? guvenlikNo,
  }) {
    return BankaHesabi(
      bankaAdi: bankaAdi ?? this.bankaAdi,
      iban: iban ?? this.iban,
      kartNo: kartNo ?? this.kartNo,
      tarihAy: tarihAy ?? this.tarihAy,
      tarihYil: tarihYil ?? this.tarihYil,
      guvenlikNo: guvenlikNo ?? this.guvenlikNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankaAdi': bankaAdi,
      'iban': iban,
      'kartNo': kartNo,
      'tarihAy': tarihAy,
      'tarihYil': tarihYil,
      'guvenlikNo': guvenlikNo,
    };
  }

  factory BankaHesabi.fromMap(Map<String, dynamic> map) {
    return BankaHesabi(
      bankaAdi: map['bankaAdi'] as String,
      iban: map['iban'] as int,
      kartNo: map['kartNo'] as int,
      tarihAy: map['tarihAy'] as int,
      tarihYil: map['tarihYil'] as int,
      guvenlikNo: map['guvenlikNo'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankaHesabi.fromJson(String source) => BankaHesabi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BankaHesabi(bankaAdi: $bankaAdi, iban: $iban, kartNo: $kartNo, tarihAy: $tarihAy, tarihYil: $tarihYil, guvenlikNo: $guvenlikNo)';
  }

  @override
  bool operator ==(covariant BankaHesabi other) {
    if (identical(this, other)) return true;
  
    return 
      other.bankaAdi == bankaAdi &&
      other.iban == iban &&
      other.kartNo == kartNo &&
      other.tarihAy == tarihAy &&
      other.tarihYil == tarihYil &&
      other.guvenlikNo == guvenlikNo;
  }

  @override
  int get hashCode {
    return bankaAdi.hashCode ^
      iban.hashCode ^
      kartNo.hashCode ^
      tarihAy.hashCode ^
      tarihYil.hashCode ^
      guvenlikNo.hashCode;
  }
}
