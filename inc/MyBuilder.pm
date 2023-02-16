package MyBuilder;
use v5.20;
use warnings;
use experimental 'signatures';

use Devel::CheckCompiler ();
use parent 'Module::Build';

my $check = <<'EOF';
#include <sys/attr.h>
#include <sys/clonefile.h>
int main() {
  return clonefile("", "", 0);
}
EOF

sub new ($class, %argv) {
    my $ok = Devel::CheckCompiler::check_compile($check, executable => 1);
    if (!$ok) {
        print "This module only supports platforms that have clonefile system call, such as macos.\n";
        exit 0;
    }
    $class->SUPER::new(%argv);
}

1;
