---
title: LieDB
---

LieDB is a collaboratively edited database of the lies politicians
tell and the fact checking that catches them.

**LieDB is not ready for public use yet**.  The software is still
under heavy development.  However, we do welcome feedback.

We don't currently do any fact checking ourselves, instead linking to
analysis from [trusted fact checkers](/checker).  While most fact
checkers will publish an article then mostly forget about it, LieDB is
focused on creating rich, evolving pages which are updated to reflect
new information as it becomes available.  If a politician makes the
same claim again, or a different politician repeats the claim, they
may or may not publish a new article.

More than just being a good reference, the data behind LieDB is freely
available in machine-readable formats, meaning anyone can download the
data and make something new.

## Grey Area

Things are complicated the fact that politicians tend to make a lot
of statements targeted at grey areas, where careful word choice can
mean the difference between an outright lie and a statement which is
technically true, though deceptive.  This means that each statement
must be analyzed individually.

For example, consider the claims that the BCRA (the Senate Healthcare
bill) [increases Medicaid
spending](/claim/bcra-increases-medicaid-spending).  As [The
Washington Post
explains](https://www.washingtonpost.com/news/fact-checker/wp/2017/06/30/president-trumps-claim-medicaid-spending-in-senate-health-bill-actually-goes-up/),
Medicaid receives funding increases each year under current law.  The
BCRA would reduce the size of those increases significantly; by 2026,
the difference would be approximately $231 billion per year ($772
billion if you add up the entire decade from 2017 thru 2026).  Now,
let's look at two statements (both mentioned in that WaPo article),
first one by Donald Trump:

> Democrats purposely misstated Medicaid under new Senate bill –
> actually goes up.

This is pretty clearly false (The Washington Post gave it "3
Pinocchios").  Trump advisor Kellyanne Conway made a similar claim,
but phrased it more carefully:

> These are not cuts to Medicaid. … This slows the rate for the future
> and it allows governors more flexibility with Medicaid dollars
> because they’re closest to the people in need.

While Conway's denial that this constitutes a cut is rather
questionable, she is up-front about what is really happening.  While
the veracity of her statement rests on a questionable definition of
the term "cut", I think anyone would agree that Conway's version is
much less deceptive than Trump's.

Our current plan to resolve this is to classify talking points (i.e.,
similar claims made by one or more politician) as either generally
truthful or deceptive.

Individual statements can be classified more specifically as true,
mostly true, mostly false, or false; this corresponds to the scales
already used by both
[PolitiFact](http://www.politifact.com/truth-o-meter/article/2013/nov/01/principles-politifact-punditfact-and-truth-o-meter/)
and [The Washington
Post](https://www.washingtonpost.com/news/fact-checker/about-the-fact-checker/).

## Want to Help?

If you're interested in helping improve LieDB, take a look at the
[Contributing](/contributing/) page.
