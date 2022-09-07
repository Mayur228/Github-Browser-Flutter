/*
class BranchListEntity {
  final List<BranchEntity> list;

  BranchListEntity(this.list);
}
*/

class BranchEntity {
  final String name;

  BranchEntity(this.name);
/*
  factory BranchEntity.fromJson(Map<String, dynamic> json) {
    return BranchEntity(name: json['name']);
  }*/
}