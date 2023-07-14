class AddressModel {
  final num id;
  final String cep;
  final String street;
  final String complement;
  final String neighbourhood;
  final String local;
  final String state;

  AddressModel(this.id, this.cep, this.street, this.complement,
      this.neighbourhood, this.local, this.state);

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
        num.parse(map['id']),
        map['cep'],
        map['street'],
        map['complement'],
        map['neighbourhood'],
        map['local'],
        map['state'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cep': cep,
        'street': street,
        'complement': complement,
        'neighbourhood': neighbourhood,
        'local': local,
        'state': state,
      };
}
