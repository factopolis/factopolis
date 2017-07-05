---
title: LieDB
---

LieDB is a collaboratively edited database of the lies politicians
tell and the fact checking that catches them.

**LieDB is not ready for public use yet**.  The software is still
under heavy development, the data is woefully incomplete, and even
this page is haphazardly structured and written.  However, it should
give you a decent understanding of the direction we are taking, and we
would very much welcome any feedback, especially constructive
criticism.

Most fact checking sites will publish an article then largely forget
about it.  If a politician makes the same claim again, or a different
politician repeats the claim, they may or may not publish a new
article.

LieDB, on the other hand, is focused on creating rich, evolving data
which is kept up-to-date to reflect new information as it becomes
available, including subsequent re-statements of the same claims.

More than just being a good reference, the data behind LieDB is freely
available in machine-readable formats, for both commercial and
non-commercial use.  This allows anyone to download the data and make
something new.

We don't currently do any fact checking ourselves, instead linking to
analysis from [trusted fact checkers](/checker).

## Current Work

### Gray Areas

Things are complicated the fact that politicians tend to make a lot
of statements targeted at gray areas, where careful word choice can
mean the difference between an outright lie and a statement which is
technically true, though deceptive.  This means that each statement
must be analyzed individually.

For example, consider the claims that the BCRA (the Senate health care
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
truthful or deceptive.  Individual statements can be classified more
specifically as true, mostly true, mostly false, or false; this
corresponds to the scales already used by both
[PolitiFact](http://www.politifact.com/truth-o-meter/article/2013/nov/01/principles-politifact-punditfact-and-truth-o-meter/)
and [The Washington
Post](https://www.washingtonpost.com/news/fact-checker/about-the-fact-checker/).

This separation of general claims from specific statements will, we
hope, allow LieDB to focus on the heart of the issue instead of
quibbling over semantics and grammar, making LieDB less hospitable to
deception such as [weasel
words](https://en.wikipedia.org/wiki/Weasel_word) and vaugery.

### Clarifications

We also want to provide a way to indicate when a politician has
publicly retracted a false claim, as well as link to any
"clarifications" (which is generally a euphemism for an equivocation).
While it is best not to make any deceptive statements in the first
place, we have healthy respect for those who can publicly own up to a
mistake.

With that being said, we believe it is important to distinguish
between truly owning up to a mistake and the sort of non-apology
equivocations which are all too common, particularly those issued
quietly by someone else (*e.g.*, by a press secretary or lawyer).

## Focus on Trump

Right now the database focuses on Donald Trump almost exclusively (at
time of writing, there are 65 Trump claims in the database, 1 Barack
Obama claim, and nothing else).  This is not out of malice toward
Donald Trump, but rather a consequence of the fact that our initial
data source was The New York Times' [Trump's
Lies](https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html)
article.

When developing software it is important to have a good data set to
start from in order to validate design decisions and the internal
logic behind the site.  The *Trump's Lies* article provided a
convenient data source which fit the bill.

If you don't like it feel free to [contribute](/contributing) data
from other politicians; as long as the information is supported by
credible sources we're happy to accept data on other politicians,
regardless of their political affiliation.

## Want to Help?

If you're interested in helping improve LieDB, take a look at the
[Contributing](/contributing/) page.
