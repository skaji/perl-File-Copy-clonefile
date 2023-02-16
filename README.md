[![Actions Status](https://github.com/skaji/perl-File-Copy-clonefile/actions/workflows/test.yml/badge.svg)](https://github.com/skaji/perl-File-Copy-clonefile/actions)

# NAME

File::Copy::clonefile - call clonefile system call

# SYNOPSIS

    use File::Copy::clonefile qw(clonefile);

    clonefile "source.txt", "destination.txt"
      or die "failed to clonefile source.txt to destination.txt: $!";

# DESCRIPTION

File::Copy::clonefile is a wrapper for
[clonefile](https://www.manpagez.com/man/2/clonefile/) system call.

# COPYRIGHT AND LICENSE

Copyright 2023 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
