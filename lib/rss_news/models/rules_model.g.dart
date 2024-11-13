// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RulesAdapter extends TypeAdapter<Rules> {
  @override
  final int typeId = 0;

  @override
  Rules read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rules(
      category: fields[0] as String,
      type: fields[1] as String,
      value: fields[2] as String,
      domain: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rules obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.domain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RulesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
