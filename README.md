[![Actions Status](https://github.com/tbrowder/Storable-Lite/workflows/test/badge.svg)](https://github.com/tbrowder/Storable-Lite/actions)

NAME
====

Storable::Lite - Provides persistent storage of Raku classes and other types in the local user's file system

SYNOPSIS
========

```raku
use Storable::Lite;
```

DESCRIPTION
===========

**Storable::Lite** is a copy of the current Raku module **PerlStore** with a name change and other changes to reflect the new Raku name of the original Perl 6. It is also now under management of **App::Mi6** and published to the **Zef** Raku module repository.

ORIGINAL DESCRIPTION (rakuized)
===============================

.raku serialization class and module

This module will work only for only simple situations. All data that is not visible after calling [.raku](http://doc.raku.org/routine/perl) method will be lost. This may be considered a limitation or feature.

```raku my Bar $bar .= new(a=> 128); my Foo $foo .= new(u=> 'Gore', bar => $bar);

    $foo.to-file('tt1.raku');
    my $tested = Foo.from-file('tt1.raku');

```

AUTHOR
======

Tom Browder <tbrowder@acm.org>

Kamil Kułaga [github:teodozjan (original author)]

COPYRIGHT AND LICENSE
=====================

Copyright 2021 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

