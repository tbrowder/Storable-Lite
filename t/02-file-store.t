use Test;
use Storable::Lite;

plan 4;

class Bar {
    has $.a;
    has $.b;
}

class Foo does FileStore {
    has %.x;
    has $.u;
    has Bar $.bar;
}

# quietly {} NIY
nok from-file('nox.raku'), 'Reading non existent Any';
nok Foo.from-file('sernox'), 'Reading non existent object';

{
    my %hash = "Foo" => "Bar", "Bar" => "Foo";
    to-file('tt.raku',%hash);
    my %hash2 = from-file('tt.raku');
    unlink('tt.raku');
    my $eq = True;
    is-deeply %hash2, %hash, 'Store and restore hashes'
}


{
    my Bar $bar .= new(a => 128);
    my Foo $foo .= new(u => 'Gore', bar => $bar);

    $foo.to-file('tt1.raku');
    my $tested = Foo.from-file('tt1.raku');
    unlink('tt1.raku');

    is $foo.raku, $tested.raku, 'Equal objects';
}
