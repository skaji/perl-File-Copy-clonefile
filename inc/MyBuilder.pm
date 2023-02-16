package MyBuilder;
use v5.20;
use warnings;
use experimental 'signatures';

use parent 'Module::Build';

sub new ($class, %argv) {
    $class->SUPER::new(%argv);
}

1;
