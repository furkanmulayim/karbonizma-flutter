// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statis_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisModelAdapter extends TypeAdapter<StatisModel> {
  @override
  final int typeId = 1;

  @override
  StatisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisModel(
      ecoPoints: fields[0] as int,
      co2Point: fields[1] as int,
      totalPoint: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StatisModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ecoPoints)
      ..writeByte(1)
      ..write(obj.co2Point)
      ..writeByte(2)
      ..write(obj.totalPoint);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
