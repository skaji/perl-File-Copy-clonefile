use v5.20;
use warnings;

load_module("ExtUtils::Builder::Conf");

my $source = <<'EOF';
#include <sys/attr.h>
#include <sys/clonefile.h>
int main() {
  (void)clonefile("", "", 0);
  return 0;
}
EOF

assert_compile_run(
    source => $source,
    quiet  => 1,
    diag   => 'This module only supports platforms that have clonefile system call, such as macos.',
);

load_module('Dist::Build::XS');

add_xs(
    -d ".git" ? ( extra_compiler_flags => ['-Wall', '-Wextra', '-Werror'] ) : (),
);

my $write_constants = function(module => "MyFunc", function => "write_constants");

create_node(
    target => "lib/File/Copy/const-xs.inc",
    actions => [ $write_constants ],
);

create_node(
    target => "lib/File/Copy/const-c.inc",
    actions => [ $write_constants ],
);

create_node(
    target => "code",
    dependencies => [ "lib/File/Copy/const-xs.inc", "lib/File/Copy/const-c.inc" ],
    phony => 1,
);
