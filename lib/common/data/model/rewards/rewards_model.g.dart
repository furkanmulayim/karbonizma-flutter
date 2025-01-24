// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RewardsModelAdapter extends TypeAdapter<RewardsModel> {
  @override
  final int typeId = 3;

  @override
  RewardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RewardsModel(
      compare: fields[0] as int,
      text: fields[1] as String,
      notCompletedImageUrl: fields[2] as String,
      completedImageUrl: fields[3] as String,
      tokenType: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RewardsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.compare)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.notCompletedImageUrl)
      ..writeByte(3)
      ..write(obj.completedImageUrl)
      ..writeByte(4)
      ..write(obj.tokenType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RewardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
