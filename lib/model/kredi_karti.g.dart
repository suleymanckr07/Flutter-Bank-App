// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kredi_karti.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KrediKartiAdapter extends TypeAdapter<KrediKarti> {
  @override
  final int typeId = 1;

  @override
  KrediKarti read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KrediKarti(
      bankaAdi: fields[0] as String,
      kartNo: fields[1] as int,
      tarihAy: fields[2] as int,
      tarihYil: fields[3] as int,
      guvenlikNo: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, KrediKarti obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bankaAdi)
      ..writeByte(1)
      ..write(obj.kartNo)
      ..writeByte(2)
      ..write(obj.tarihAy)
      ..writeByte(3)
      ..write(obj.tarihYil)
      ..writeByte(4)
      ..write(obj.guvenlikNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KrediKartiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
