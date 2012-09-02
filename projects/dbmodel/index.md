---
comments: true
date: 2009-10-20 07:32:24
layout: page
slug: dbmodel
title: Database Modeller
wordpress_id: 12
---

<div style="float:right">
<a href="/uploads/dbmodel2.png"><img src="/uploads/dbmodel2-300x225.png" /></a>
</div>

Several times I needed a tool to play with database models on Linux and I haven't found anything decent, so I've decided to write one myself. I've been using Visio's entity-relational diagram features a lot and I like it, so this is where I got ideas for the diagram look and editing UI design from. It's far from complete, but it already does most of the things I needed it to do.


### Release 0.3 (2010-01-24)

#### Download
	
  * [Source Code Tarball](http://launchpad.net/dbmodel/trunk/0.3/+download/dbmodel-0.3.tar.gz) (70K, .tar.gz)
  * [Windows Installer](http://launchpad.net/dbmodel/trunk/0.3/+download/dbmodel-setup-0.3.exe) (4.9M, .exe)

#### Changes

  * PDF export
  * Support for printing
  * Opening of files passed through the command line arguments ([Bug #401595](https://bugs.launchpad.net/dbmodel/+bug/))
  * The recently used files list now always uses absolute paths
  * Implemented auto-scrolling in the diagram view ([Bug #420324](https://bugs.launchpad.net/dbmodel/+bug/420324))
  * The "Close" menu item will now only close the document, not the window ([Bug #420322](https://bugs.launchpad.net/dbmodel/+bug/420322))
  * Use the selected file format in the export dialog, instead of relying only on the extension ([Bug #396056](https://bugs.launchpad.net/dbmodel/+bug/396056))

### Development

You can get the development version of the source code using Bazaar:
    
    bzr branch http://bzr.oxygene.sk/dbmodel/trunk dbmodel

You need to have Qt4 installed, then you can run qmake followed by make to build it.

### Roadmap

As I mentioned, this is a personal tool and not a very high-priority project, but there are a few things I'd like to implement in near feature:
	
  * Extend the model to be able to fully represent a physical database schema (at least for PostgreSQL).
  * Use QtScript to allow users to export the schema into SQL scripts, ORM mapping classes, etc.
  * Allow users to manually edit connections in the diagram. Doing this automatically is a very complex problem (even the simplest approximation I could think of), for which I don't have enough time.

### Links
	
  * [Bug tracker on Launchpad](https://bugs.launchpad.net/dbmodel)


