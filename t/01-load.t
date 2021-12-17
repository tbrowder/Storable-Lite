use Test;
use Storable::Lite;

plan 1;

my $o = Storable::Lite.new;
isa-ok $o, Storable::Lite;
