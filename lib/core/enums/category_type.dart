enum CategoryType {
  video('video'),
  article('article');

  const CategoryType(this.type);
  final String type;
}

extension ConvertTweet on String{
  CategoryType toCategoryTypeEnum(){
    switch(this) {
      case 'video':
        return CategoryType.video;

      case 'article':
        return CategoryType.article;

      default:
        return CategoryType.article;
    }
  }
}