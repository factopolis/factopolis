---
title: "Contributing"
---

Factopolis is a community-driven project, and a fairly large undertaking,
so we need all the help we can get.  All community activity is managed
through [our GitHub project](https://github.com/factopolis/factopolis), most
notably through [our issue
tracker](https://github.com/factopolis/factopolis/issues); if you have an ideas,
please [submit an issue](https://github.com/factopolis/factopolis/issues/new).

If you're not sure how to help, here are a few things we know we need:

## Adding Entries

Adding entries doesn't require an special expertise, so it's a great
way to get started.  Also, it turns out that politicians lie *a lot*,
and we want to document as many of them as we can, so there is plenty
to do!

The first step, and the most difficult, is gathering information.  To
create a new claim, we need the following information:

 * Title — A short, to the point description of the claim.
 * Summary — A short sentence or two to summarize the truth, phrased in
   a way that makes sense coupled with the title.
 * A list of fact checks about the claim; usually an article from one of our [trusted fact checkers](/checker).  Each entry in the list should include:
   * URL of the fact check.
   * A quote from the fact chcek which sums up the result of the fact
     check concisely.  No longer than a paragraph or two.
   * If possible, a similar quote, this time reduced to a short
     sentence or two.
 * Who made the claim, the date they made it, the exact quote in which
   they made the claim, and a link to a credible source for that
   information.  For claims which have been repeated (either by the
   same person or someone else), this can be a list of them all.

The more fact checks you can find the better, so long as they come from
credible sources.

Once you have that information, you can
[submit it to our issue tracker](https://github.com/factopolis/factopolis/issues/new)
and we'll try to add it to our database as soon as possible.

If you'd like to take it a bit further, you can add the claim to the
database yourself and submit a pull request.  We'll try to write
documentation for this process soon, but the basic idea is that you
need to add a claim to the
[content/claim](https://github.com/factopolis/factopolis/tree/master/content/claim)
directory, and add an entry to the file of whover made the claim in the
[content/person](https://github.com/factopolis/factopolis/tree/master/content/person)
directory.  Once that's done you can submit a pull request.

## Front-end Designers / Developers

If you're reading this, you can probably already tell that Factopolis isn't
exactly aesthetically pleasing.  If you're good at design and/or
front-end development, we'd love to hear from you!

## Data Visualization

There are lots of opportunities to create interesting visualizations
using Factopolis's data.  While you are free (and encouraged) to copy the
data and publish visualizations yourself, if you create something
useful we would certainly be interested in merging it into Factopolis's
web site.
