// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopAdapter extends TypeAdapter<Shop> {
  @override
  final int typeId = 0;

  @override
  Shop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shop(
      name: fields[0] as String,
      mobileNumber: fields[1] as String,
      shopCode: fields[2] as String,
      route: fields[3] as String,
      distributor: fields[4] as String,
      salesPerson: fields[5] as String,
      visited: fields[6] as int,
      ordered: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Shop obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.mobileNumber)
      ..writeByte(2)
      ..write(obj.shopCode)
      ..writeByte(3)
      ..write(obj.route)
      ..writeByte(4)
      ..write(obj.distributor)
      ..writeByte(5)
      ..write(obj.salesPerson)
      ..writeByte(6)
      ..write(obj.visited)
      ..writeByte(7)
      ..write(obj.ordered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
