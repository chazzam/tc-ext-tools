# tc-ext-tools
Updates to https://code.google.com/p/tc-ext-tools/

This is an alternative to https://code.google.com/p/tcztools/ which simply wasn't uniformly automated enough to suit my purposes.

I hope to add better documentation, a more filled out default 'build' file, and investigate a few issues that may be bugs.

potential bugs:
- auto changelog doesn't appear to work in original. The .common file appears to be created in a 'temp/' directory, and is getting removed by the time the build is finished. This may be limiting the effectiveness of the helper, more investigation is necessary
- some somewhat painful assumptions concerning the "SOURCE" and creating folder structure if skipping steps like convertit, or unpackit.
- Incredibly painful assumptions concerning a "custom::" SOURCE and having to define a custom everything else afterward.

documentation:
- there are lots of variables available, and many of them are useful and pertinent, but the only to find them is to peruse the source itself and take chances. Lets document some of the more useful ones I've found at least
- A more involved introduction that walks from the 'addit' command to being able to 'buildit'
- A complementary discussion from 'addit' to 'buildit' for a version controlled package instead of a tarball
- Greater discussion and mention of the 'src/' folder inside a package and accessing it from within 'build'.
- Creating a package with a 'custom::' SOURCE
- more in depth discussion of what each of the buildit --* options are doing, the assumptions they make, and the state in which they leave the storage system.
- expanded beginner commentary on the common, dep, install, list, build, and tce.installed files
