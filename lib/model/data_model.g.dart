// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentmodelAdapter extends TypeAdapter<Studentmodel> {
  @override
  final int typeId = 1;

  @override
  Studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Studentmodel(
      name: fields[1] as String,
      age: fields[2] as String,
      number: fields[3] as String,
      email: fields[4] as String,
      id: fields[0] as int?,
      images: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Studentmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
