---
title: API
aliases:
- /api
---

**WARNING**: The API isn't stable yet; use it at your own risk! If
nothing else, it will change when
[Hugo bug #3832](https://github.com/gohugoio/hugo/issues/3832) is
fixed.

Factopolis is open-source, and you can access all of our data from
[our GitHub repository](https://github.com/factopolis/factopolis).

While the markdown data is convenient for editing, it's a bit of a pain
to access programatically, which is why we also provide HTTP-accessible
JSON files which are built from the markdown:

 * [/index.json](/index.json) — All data for the site combined into a
   single file. **Warning**: this file may be quite large, you should
   download it sparingly.
 * [/person/index.json](/person/index.json) — Provides a list of all
   people in the database, plus some additional data about each
   person.
 * `person/*/index.json` — Information about the person, including a
   list of claims.  Example:
   [/person/donald-trump/index.json](/person/donald-trump/index.json)
 * `/groups/*/index.json` — Information about a group, including a
   membership list.  Example:
   [/groups/democratic-party/index.json](/groups/democratic-party/index.json)
 * `/claims/*/index.json` — Information about a claim. Example:
   [/claims/half-of-ms-13-deported/index.json](/claims/half-of-ms-13-deported/index.json)
 * [/checker/index.json](/checker/index.json) — List of all fact
   checkers.
 * `/checker/*/index.json` — Information about the fact
   checker. Example:
   [/groups/democratic-party/index.json](/groups/democratic-party/index.json)

We're in the process of  filling out the JSON data to support our
client-side front-end, but if you don't want to wait feel free to
[contact us](https://github.com/factopolis/factopolis/issues) about
making the data you need available.

If you make something interesting with this data, please
[let us know](https://gitter.im/factopolis/)!
