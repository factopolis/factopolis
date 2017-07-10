---
title: Factopolis
---

**Factopolis is not ready for public use yet**.  The software is still
under heavy development, the data is woefully incomplete, and even
this page is haphazardly structured and written.  However, it should
give you a decent understanding of the direction we are taking, and we
would very much welcome any feedback, especially constructive
criticism.

## About Factopolis

Factopolis is a collaboratively edited database of the lies politicians
tell and the fact checks which test them.  While Factopolis is a fact
checking site, but it takes a different approach than other fact
checking sites we're aware of such as
[FactCheck.org](https://www.factcheck.org/) and
[PolitiFact](http://www.politifact.com/).

Factopolis doesn't really compete with traditional fact-checking sites,
instead it provides a service built on top of those sites.  A good
analogy is Wikipedia and Google; Wikipedia creates lots of great
content, and Google provides a way for people to make sense of it all.
Similarly, Factopolis provides a way to navigate the work done by
traditional fact checking organizations.

### Factopolis is a Database

Perhaps the most significant difference between Factopolis and most other
fact checking sites is that Factopolis is much more structured.  While most
sites post walls of text detailing their work Factopolis extracts a few
select pieces of information, providing links to the original source
for those who want more information.

The data behind Factopolis is freely available in machine-readable formats,
for both commercial and non-commercial use.  This allows anyone to
download the data and make something new.

### Living Data

Most fact checking sites will publish article about a claim made by a
politician, pundit, or other political figure, then leave it as-is.
If the same person makes the same claim again, or someone else does,
the fact checker *may* choose to publish a new article (often citing
the old article), but will not generally update the old article.

Factopolis, on the other hand, is focused on creating rich, evolving data
which is kept up-to-date to reflect new information as it becomes
available, including subsequent re-statements of the same claims, with
links to any credible fact checks we can find.

### Clarifications

This isn't done yet.

Perhaps as a result of our "living data" approach, we also want to
provide a way to indicate when a politician has publicly retracted a
false claim, as well as link to any "clarifications".

That said, we believe it is important to distinguish between truly
owning up to a mistake and the sort of non-apology equivocations which
are all too common, particularly those issued quietly by someone else
(*e.g.*, by a press secretary or lawyer).

While it is best not to make any deceptive statements in the first
place, we have healthy respect for those who can publicly own up to a
mistake.

### Linking Similar Claims Together

The structured nature of Factopolis is designed to facilitate linking
related information together, and one of the most important ways we do
this is by grouping similar statements together, even if they are
worded slightly differently.

People don't usually come up with claims in a vacuum.  Sometimes many
people operate off of the same "talking points", other times they will
repeat claims they've heard others make.  Fact checking sites
typically analyze each claim separately, in large part because subtle
differences in language can easily mean the difference between a
statement being technically true (though deceptive) and flat-out
false.

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

Factopolis's structure provides a solution to this issue.  While individual
claims can be (and preferably are) rated separately, the fact that
Factopolis links them together means we have a good way to provide an
overview of similar claims and information dug up by fact checkers.
This can then be used to help classify a group of assertions (*i.e.*,
a talking point) as either generally true or disingenuous.

This separation of general claims from specific statements will, we
hope, allow Factopolis to focus on the heart of the issue instead of
quibbling over semantics and grammar, making Factopolis less hospitable to
deceptions such as [weasel
words](https://en.wikipedia.org/wiki/Weasel_word) and vaugery.

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

If you're interested in helping improve Factopolis, take a look at the
[Contributing](/contributing/) page.
