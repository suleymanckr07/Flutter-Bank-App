// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hesabi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankaHesabiAdapter extends TypeAdapter<BankaHesabi> {
  @override
  final int typeId = 0;

  @override
  BankaHesabi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankaHesabi(
      bankaAdi: fields[0] as String,
      iban: fields[1] as int,
      kartNo: fields[2] as int,
      tarihAy: fields[3] as int,
      tarihYil: fields[4] as int,
      guvenlikNo: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BankaHesabi obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bankaAdi)
      ..writeByte(1)
      ..write(obj.iban)
      ..writeByte(2)
      ..write(obj.kartNo)
      ..writeByte(3)
      ..write(obj.tarihAy)
      ..writeByte(4)
      ..write(obj.tarihYil)
      ..writeByte(5)
      ..write(obj.guvenlikNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankaHesabiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
