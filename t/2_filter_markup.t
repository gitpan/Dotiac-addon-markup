use Test::More tests=>12;
chdir "t";
no warnings;

require Dtest;
use warnings;
use strict;
use Text::Textile qw/textile/;
use Text::Markdown qw/markdown/;

my $markdown = <<EOM;
A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
> 
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote
EOM

my $markdown2=markdown($markdown);

dtest("filter_markdown.html","A$markdown2"."A\n",{text=>$markdown});
my $textile = <<EOT;
h1. Heading

A _simple_ demonstration of Textile markup.

* One
* Two
* Three

"More information":http://www.textism.com/tools/textile is available.
EOT
my $textile2=textile($textile);
dtest("filter_textile.html","A$textile2"."A\n",{text=>$textile});
my $rest = <<EOR;
=====
Title
=====
Subtitle
-------- 

Titles are underlined (or over-
and underlined) with a printing
nonalphanumeric 7-bit ASCII
character.

- This is item 1
- This is item 2 

EOR
#my $rest2=rest($rest);
#dtest("filter_restructuredtext.html","\n",{text=>$rest}); #Can't test because text::Restructured is just ugly and won't compile on Win32
