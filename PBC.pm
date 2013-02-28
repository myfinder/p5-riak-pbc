package Riak::PBC;

use strict;
use warnings;
use vars qw(@ISA $AUTOLOAD $VERSION);

$VERSION = '0.1';

use Exporter;

require DynaLoader;
require AutoLoader;

@ISA = qw(DynaLoader Exporter);

bootstrap Riak::PBC $VERSION;

1;

__END__
