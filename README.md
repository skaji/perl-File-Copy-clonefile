# NAME

File::Copy::clonefile - call clonefile system call

# SYNOPSIS

    use File::Copy::clonefile qw(clonefile);

    clonefile "source.txt", "destination.txt"
      or die "failed to clonefile source.txt to destination.txt: $!";

# DESCRIPTION

File::Copy::clonefile is a wrapper for
[clonefile](https://www.manpagez.com/man/2/clonefile/) system call.
Thus, this module only supports platforms that have clonefile system call, such as macos.

# ARTIFACT ATTESTATIONS

GitHub Artifact Attestations are generated for release tarballs uploaded to
CPAN. If you care about provenance for the uploaded tarballs, see:

[https://github.com/skaji/perl-File-Copy-clonefile/attestations](https://github.com/skaji/perl-File-Copy-clonefile/attestations)

# COPYRIGHT AND LICENSE

Copyright 2023 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
