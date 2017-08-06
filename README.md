Factopolis is a non-partisan site to track when politicians lie.  We
don't do any fact-checking ourselves, but instead provide links to
trusted third-parties who have verified claims to be false.

The main data sources right now are in `content/claim` and
`content/person`.  I'll add documentation for how to work with these
when I have time, but until then it shouldn't be too hard to figure
out—just look in the `content/` folder.

To view the site locally, you'll need to install
[Hugo](https://gohugo.io/overview/installing/).  Once that's done,
simply run `hugo server` in the root directory, then browse to
[localhost:1313](http://localhost:1313/).

Any help would be greatly appreciated—it turns out politicians tell a
**lot** of lies, and it takes time to import them into our database.

There is plenty of room for improvement on the front end, so if you're
a web developer and/or designer any help you can provide would be
fantastic.  Remember, the JSON files are accessible over HTTP, too, so
there are plenty of opportunities to create rich interactive
experiences.
