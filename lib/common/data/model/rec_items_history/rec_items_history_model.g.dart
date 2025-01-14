// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rec_items_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecItemsModelAdapter extends TypeAdapter<RecItemsModel> {
  @override
  final int typeId = 5;

  @override
  RecItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecItemsModel(
      id: fields[0] as int,
      kg: fields[2] as String,
      tokenID: fields[1] as String,
      topEcoPoints: fields[3] as int,
      topCo2Points: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecItemsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tokenID)
      ..writeByte(2)
      ..write(obj.kg)
      ..writeByte(3)
      ..write(obj.topEcoPoints)
      ..writeByte(4)
      ..write(obj.topCo2Points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
