import 'model.dart';
//group id
//members
//blocked members
//owner
//tags
//branches

class Group{
  final String groupId;
  final String groupname;
  final List<String> members;
  final List<String> blockedMembers;
  final String owner;
  final List<String> tags;
  final List<Branch> branches;

  Group({required this.groupId,required this.groupname, required this.members, required this.blockedMembers, required this.owner, required this.tags, required this.branches});

}