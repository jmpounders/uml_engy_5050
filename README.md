HOW I MADE THIS SITE
====================

1. Created and checked out an orphan branch named `gh-pages`.
2. Untracked and cleared out all files.
3. Configured sphinx to build to the root of the repository.
4. Setup the sphinx project.
5. Create a .nojekyll file so that github doesn't get confused by underscore prefixes.
5. Added and committed all files.

Question... files and directories between branches?

The commands follow.

    git branch --orphan gh-pages
    git checkout --orphan gh-pages
    git rm --cached README.md
    git clean -fdx
    sphinx-quickstart
    make html
    touch .nojekyll
    git add .
    git commit -m "First doc commit"
    git push origin gh-pages

