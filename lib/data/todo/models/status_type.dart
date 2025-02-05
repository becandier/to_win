enum StatusType {
  created,
  completed,
}

extension StatusTypeX on StatusType {
  int get asInt => index;
}
