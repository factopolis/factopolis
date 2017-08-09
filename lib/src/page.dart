import 'package:markdown/markdown.dart' as md;

/// Base class for Factopolis pages
///
/// Contains common members necessary for populating the sidebar, such
/// as title, social links, etc.
abstract class Page {
  /// Slug
  final String slug;
  /// Page title
  final String name;

  /// Page content in Markdown, if available
  final String _markdown;

  /// URL of profile picture, if available
  final String profilePic;
  /// Wikipedia identifier, if available
  final String wikipedia;
  /// Twitter username, if available
  final String twitter;
  /// Facebook username, if available
  final String facebook;
  /// Instagram username, if available
  final String instagram;
  /// Snapchat username, if available
  final String snapchat;
  /// Youtube username, if available
  final String youtube;
  /// Medium username, if available
  final String medium;
  /// Flickr username, if available
  final String flickr;
  /// Tumblr username, if available
  final String tumblr;
  /// Google+ username, if available
  final String googleplus;
  /// Official web site, if available
  final String web;
  /// News feed, if available
  final String feed;

  String _contentHtml = null;
  String get contentHtml {
    if (this._contentHtml == null && this._markdown != null)
      this._contentHtml = md.markdownToHtml(this._markdown);

    return this._contentHtml;
  }

  Page.fromJson(Map<String, dynamic> data, [String id])
    : slug = (id == null) ? data['id'] : id,
      name = data['name'],
      _markdown = data['markdown'],
      profilePic = data['profilePic'],
      web = data['web'],
      feed = data['feed'],
      wikipedia = data['wikipedia'],
      twitter = data['twitter'],
      facebook = data['facebook'],
      instagram = data['instagram'],
      snapchat = data['snapchat'],
      youtube = data['youtube'],
      medium = data['medium'],
      flickr = data['flickr'],
      tumblr = data['tumblr'],
      googleplus = data['googleplus'];
}
