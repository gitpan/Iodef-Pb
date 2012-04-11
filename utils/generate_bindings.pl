#!/usr/bin/perl -w

use strict;
use Google::ProtocolBuffers;

my $f = '../iodef.proto';
Google::ProtocolBuffers->parsefile($f,
    {
        generate_code => 'lib/Iodef/_Pb.pm',
        create_accessors    => 1,
        follow_best_practice => 1,
    }
);

open(F,'lib/Iodef/_Pb.pm');
my @lines = <F>;
close(F);
open(F,'>','lib/Iodef/_Pb.pm');
no warnings;
print F "package Iodef::_Pb;\n";
foreach (@lines){
    print F $_;
}
close(F);
