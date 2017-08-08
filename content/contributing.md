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

## Editors

One of the best ways to help Factopolis is to dive in and start
editing content.  Not only is it difficult for us to keep up with the
new lies politicians and pundits tell, but we would also like to add
as much historical data as we can!

The first thing you need to do is find content; the archives of
[PolitiFact](http://www.politifact.com/truth-o-meter/statements/),
[FactCheck.org](http://www.factcheck.org/the-factcheck-wire/), as well
as [others](/checker) are loaded with great information to comb
through.

Politicians and pundits love to repeat their favorite talking points,
even when they're wrong, so often this will simply mean adding another
quote to an existing claim.  If that's the case, we'll need to know:

 * Which claim the person is making.
 * The exact quote.
 * A reliable source for the quote, preferably from a separate
   location from any fact checks.  If you can find video, that's works
   great, especially YouTube or other sites where you can link to a
   specific time in the video.
 * If any fact checkers have checked the **exact** quote, a link to
   that check.

If it's a new claim which isn't in our database yet, you'll need some
additional information:

 * Title — a short, to the point, description we can use as the claim
   title.
 * Summary — A short sentence or two to summarize the truth, phrased
   in a way that makes sense when coupled with the title.
 * A list of fact checks about the claim; usually an article from one
   of our [trusted fact checkers](/checker).  Each entry in the list
   should include:
   * URL of the fact check.
   * A quote from the fact chcek which sums up the result of the fact
     check concisely.  No longer than a paragraph or two.
   * If possible, a similar quote, this time reduced to a short
     sentence or two.

For both individual quotes and general claims, the more fact checks
you can find the better!  As long as they come from credible sources,
we love having multiple sources.

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

 * Where the claims are coming from (*i.e.*, Republicans or Democrats,
   or specific groups within those parties such as alt-right or BLM).
 * If applicable, historical information.
 * Links to more in-depth **credible** material.

Claims can also benefit from summaries, but for the most part links to
fact checkers fulfill those. In general, Factopolis shouldn't be doing
any fact checking, merely linking to sites which do.

We could also benefit from new text on pages about Factopolis, such as
this page, the [contributing](/contributing) page, the home page, etc.

## Designers & Front-end Developers

If you're a skilled designer you can probably already tell that we
need help badly!  If you're willing (and able) to provide it, please
get in touch with us.

Our current site uses [Hugo](http://www.gohugo.io) to generate a
static web site, and we're working on a client-side interface written
in [Dart](http://www.dartlang.org) using
[Angular](https://webdev.dartlang.org/angular/), but if you're
interested in working on the implementation we're open to other
possibilities.

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
