import 'package:markdown/markdown.dart' as md;
import 'package:angular2/security.dart';

/// Base class for Factopolis pages
///
/// Contains common members necessary for populating the sidebar, such
/// as title, social links, etc.
class Page {
  /// Slug
  final String slug;
  /// Page title
  final String name;

  final Uri picture;
  final SafeHtml pictureCopyright;

  /// Official web site, if available
  final String web;
  /// News feed, if available
  final String feed;

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
  /// Vimeo username, if available
  final String vimeo;
  /// Medium username, if available
  final String medium;
  /// Flickr username, if available
  final String flickr;
  /// Tumblr username, if available
  final String tumblr;
  /// Pinterest username, if available
  final String pinterest;
  /// Google+ username, if available
  final String googleplus;
  /// LinkedIn username, if available
  final String linkedin;

  final String politifact;
  final String washingtonPost;
  final String snopes;
  final String factcheckOrg;

  String _contentHtml = null;
  String get contentHtml {
    if (this._contentHtml == null && this._markdown != null)
      this._contentHtml = md.markdownToHtml(this._markdown);

    return this._contentHtml;
  }

  Page.fromJson(Map<String, dynamic> data, [String id])
    : slug = (id == null) ? data['id'] : id,
      name = data['name'],
      picture = (data['picture'] == null) ? null : Uri.parse(data['picture']),
      pictureCopyright = (data['pictureCopyright'] == null) ? null : new SafeHtmlImpl(md.markdownToHtml(data['pictureCopyright'])),
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
      vimeo = data['vimeo'],
      medium = data['medium'],
      flickr = data['flickr'],
      tumblr = data['tumblr'],
      pinterest = data['pinterest'],
      googleplus = data['googleplus'],
      linkedin = data['linkedin'],
      politifact = data['politifact'],
      washingtonPost = data['washingtonpost'],
      snopes = data['snopes'],
      factcheckOrg = data['factcheckorg'];
}
