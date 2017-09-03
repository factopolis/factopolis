---
title: "Contributing"
---

# Help Wanted!

Factopolis is a community-driven project, and a fairly large
undertaking, so we need all the help we can get.

If you're interested in helping us build Factopolis, please stop by
[our chat room](https://gitter.im/factopolis/) so we can talk.

We are always looking for new ideas, so if you have an something you'd
like to work on we'd love to discuss it with you. If you aren't sure
how you could help, here are some ideas:

## Content Editors

One of the best ways to help Factopolis is to dive in and start
editing content.  Not only is it difficult for us to keep up with the
new lies politicians and pundits tell, but we would also like to add
as much historical data as we can!

The first thing you need to do is find content; the archives of [PolitiFact](http://www.politifact.com/truth-o-meter/statements/), [FactCheck.org](http://www.factcheck.org/the-factcheck-wire/), as well as [others](/checker) are loaded with great information to comb through. Another surprisingly good source is fact checks which are already in our database; they often contain links to other statements and/or fact checks which aren't in our database (yet!).

Information we need to know includes:

* If the claim is already in our database (for a different statement), specify the claim.
* The exact quote.
* At least one source for the quote, preferably from a separate location from any fact checks. The more the better.
* Any fact checks of the statement. All *claims* must have at least one fact check, though if a statement is merely repeating a claim which has already been checked in the context of a different statement then additional fact check(s) aren't required (though they are greatly preferred).

Currently supported sources include:

* Video (including YouTube, raw video files, and embedded players)
* Audio
* Twitter
* Transcripts
* Web sites which don't fit into one of the above types, such as news articles.

Video and/or audio sources are generally preferable to text-only, though whenever possible both should be provided. To find text sources, adding "transcript" to a search for an event often produces favorable results.

Excellent video sources include:

* Press sections of Government web sites, such as [WhiteHouse.gov](https://www.whitehouse.gov/)
* [Archive.org's TV News Archive](https://archive.org/details/tv)
* [YouTube](https://www.youtube.com/) ­— Official channels for whoever produced the video are prefered, such as
  * [White House](https://www.youtube.com/user/whitehouse/videos)
  * [CNN](https://www.youtube.com/user/CNN/videos)
  * [MSNBC](https://www.youtube.com/user/msnbcleanforward/videos)
  * [Fox News](https://www.youtube.com/user/FoxNewsChannel/videos)

You should also always prefer longer videos as opposed to those which *only* show the clip in question, to make it easier for people to see the context of the statement.

For both audio and video, please include the start time and end time where the precise quote appears.

For both individual quotes and general claims, the more fact checks you can find the better!  As long as they come from credible sources, we love having multiple sources.

Once you have that information, you can [submit it to our issue
tracker](https://github.com/factopolis/factopolis/issues/new) and
we'll try to add it to our database as soon as possible.

If you'd like to take it a bit further, you can add the claim to the
database yourself and submit a pull request.  We'll try to write
documentation for this process soon, but the basic idea is that you
need to add a claim to the
[content/claim](https://github.com/factopolis/factopolis/tree/master/content/claim)
directory, and add an entry to the file of whover made the claim in
the
[content/person](https://github.com/factopolis/factopolis/tree/master/content/person)
directory.  Once that's done you can submit a pull request.

## Writers

Several pages on the site are in need of some prose to help explain the
issues.  This is especially true for [themes](/theme), which should
each have simple explanations of:

 * Where the claims are coming from (*i.e.*, Republicans or Democrats).
 * If applicable, historical information.
 * Links to more in-depth **credible** material.

Claims can also benefit from summaries, but for the most part links to
fact checkers fulfill those. In general, Factopolis shouldn't be doing
any fact checking, merely linking to sites which do.

We could also benefit from new text on pages about Factopolis, such as
this page, the [contributing](/contributing) page, the home page, etc.

## Designers & Front-end Developers

If you're a skilled designer you can probably already tell that we need help badly!  If you're willing (and able) to provide it, please get in touch with us.

Our current site uses [Hugo](http://www.gohugo.io) to generate a static web site, but if you're interested in working on the implementation we're open to other possibilities, including client-side Dart or JavaScript interfaces.

## Data Visualization

There are lots of opportunities to create interesting visualizations
using Factopolis's data.  While you are free (and encouraged) to copy
the data and publish visualizations yourself, if you create something
useful we would certainly be interested in merging it into
Factopolis's web site.

You may want to take a look at the [API](/api) page, which should help
you discover what data is available.

## Something Else

Do you have a skillset, or an idea, not covered by something above?
We'd love to hear about what it! Just head over to [our chat
room](https://gitter.im/factopolis/) or file an issue in [our issue
tracker](https://github.com/factopolis/factopolis/issues/new).
