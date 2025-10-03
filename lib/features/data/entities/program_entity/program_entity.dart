class ProgramEntity {
  final String? id;
  final String? name;
  final String? image;
  final List<ProgramDetailEntity>? programDetails;

  const ProgramEntity({
    this.id,
    this.name,
    this.image,
    this.programDetails,
  });
}

class ProgramDetailEntity {
  final String? id;
  final String? programId;
  final String? title;
  final String? content;

  const ProgramDetailEntity({
    this.id,
    this.programId,
    this.title,
    this.content,
  });
}
