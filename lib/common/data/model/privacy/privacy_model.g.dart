// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivacyModelAdapter extends TypeAdapter<PrivacyModel> {
  @override
  final int typeId = 4;

  @override
  PrivacyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrivacyModel(
      devName: fields[0] as String,
      devIco: fields[9] as String,
      devTitle: fields[1] as String,
      devComm: fields[2] as String,
      devGithub: fields[3] as String,
      devGithubIco: fields[4] as String,
      devLinkedin: fields[5] as String,
      devLinkedinIcon: fields[6] as String,
      kvkkTitle: fields[7] as String,
      kvkk: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrivacyModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.devName)
      ..writeByte(9)
      ..write(obj.devIco)
      ..writeByte(1)
      ..write(obj.devTitle)
      ..writeByte(2)
      ..write(obj.devComm)
      ..writeByte(3)
      ..write(obj.devGithub)
      ..writeByte(4)
      ..write(obj.devGithubIco)
      ..writeByte(5)
      ..write(obj.devLinkedin)
      ..writeByte(6)
      ..write(obj.devLinkedinIcon)
      ..writeByte(7)
      ..write(obj.kvkkTitle)
      ..writeByte(8)
      ..write(obj.kvkk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivacyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
