use v5.20;
use warnings;
use experimental 'signatures';

use Cwd qw(cwd);
use Errno ();
use File::Temp qw(tempdir);

use Test::More;
use Test::LeakTrace;
use File::Copy::clonefile qw(clonefile);

sub spew ($file, $content) {
    open my $fh, ">", $file or die "$!: $file";
    print {$fh} $content;
}

sub slurp ($file) {
    open my $fh, "<", $file or die "$!: $file";
    my $content = do { local $/; <$fh> };
    $content;
}

my $cwd = cwd;
my $tempdir = tempdir CLEANUP => 1;

chdir $tempdir or die;

spew "test.txt", "this is test\n";
my $ok = clonefile "test.txt", "test2.txt";
ok $ok;
ok -f "test2.txt";
is slurp("test2.txt"), "this is test\n";

$ok = clonefile "test.txt", "test2.txt";
ok !$ok;
is 0+$!, Errno::EEXIST;

no_leaks_ok {
    clonefile "test.txt", "test2.txt";
    clonefile "test.txt", "test3.txt";
};

chdir $cwd;

done_testing;
