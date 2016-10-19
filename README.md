Jake's website
--------------

Production: http://jakecoffman.com

Setup:

```
git clone -b hugo git@github.com:jakecoffman/jakecoffman.github.io.git
mkdir -p jakecoffman.github.io/public
cd jakecoffman.github.io/public
git clone git@github.com:jakecoffman/jakecoffman.github.io.git
```

Run `hugo` to generate the site, it will overwrite the files in `public`.

When deleting files, you'll need to delete them from `public` manually or write a script that runs `rm -rf public/*`
and then `hugo`.

