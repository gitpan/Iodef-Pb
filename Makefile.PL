use inc::Module::Install;

name        'Iodef-Pb';
all_from    'lib/Iodef/Pb.pm';

requires    'Module::Install'           => '1.00';
requires    'Class::Accessor'           => '0.34';
requires    'Google::ProtocolBuffers'   => '0.08';

WriteAll();
