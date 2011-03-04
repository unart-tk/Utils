#  # tools.sh - oneliners for text files
#
#	Copyright (C) 2010 Ben Leak
#	v0.1: 2010-10-18, leakin.org/r/oneliners
#	tags: oneliner | text
#  
#  ----

#  print bashfile without comments
printcode_doc(){ echo 'Prints code without comments.Usage: printcode <file>'; }
printcode () {
	file=~/test.txt
	cat "$file" | perl -e 'while (<>) { print unless /\s*#/ }'
}
