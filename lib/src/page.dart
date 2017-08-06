/// Base class for Factopolis pages
///
/// Contains common members necessary for populating the sidebar, such
/// as title, social links, etc.
abstract class Page {
  /// Slug
  String slug;
  /// Page title
  String name;

  /// Page content in Markdown, if available
  String content = null;

  /// URL of profile picture, if available
  String profilePic = null;
  /// Wikipedia identifier, if available
  String wikipedia = null;
  /// Twitter username, if available
  String twitter = null;
  /// Facebook username, if available
  String facebook = null;
  /// Instagram username, if available
  String instagram = null;
  /// Snapchat username, if available
  String snapchat = null;
  /// Youtube username, if available
  String youtube = null;
  /// Medium username, if available
  String medium = null;
  /// Flickr username, if available
  String flickr = null;
  /// Official web site, if available
  String web = null;

  Page(this.slug);

  /// Extract as much information as possible from the supplied JSON
  void parseJson(dynamic data) {
    if (data['name'] != null)
      this.name = data['name'];

    if (data['markdown'] != null)
      this.content = data['markdown'];

    if (data['profilePic'] != null)
      this.profilePic = data['profilePic'];

    if (data['wikipedia'] != null)
      this.wikipedia = data['wikipedia'];
    if (data['twitter'] != null)
      this.twitter = data['twitter'];
    if (data['facebook'] != null)
      this.facebook = data['facebook'];
    if (data['instagram'] != null)
      this.instagram = data['instagram'];
    if (data['snapchat'] != null)
      this.snapchat = data['snapchat'];
    if (data['youtube'] != null)
      this.youtube = data['youtube'];
    if (data['medium'] != null)
      this.medium = data['medium'];
    if (data['flickr'] != null)
      this.flickr = data['flickr'];
    if (data['web'] != null)
      this.web = data['web'];
  }
}
