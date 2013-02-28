use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Riak::PBC') };

use Riak::PBC;

my $content = Riak::PBC::RpbContent->new;

$content->set_value("test values");

my $packed_content = $content->pack;

undef $content;

my $unpacked_content = Riak::PBC::RpbContent->new;
$content = $unpacked_content->unpack($packed_content);

is $unpacked_content->value, 'test values', 'pack -> unpack';
