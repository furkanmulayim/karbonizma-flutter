// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecycleModelAdapter extends TypeAdapter<RecycleModel> {
  @override
  final int typeId = 0;

  @override
  RecycleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecycleModel(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
      explain: fields[3] as String,
      persentage: fields[4] as int,
      carbonRatio: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecycleModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.explain)
      ..writeByte(4)
      ..write(obj.persentage)
      ..writeByte(5)
      ..write(obj.carbonRatio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecycleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
