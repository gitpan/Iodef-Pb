#!/usr/bin/perl -w

use strict;

use lib './lib';
use Data::Dumper;

use Iodef::Pb;

my $c = ContactType->new({
                ContactName => MLStringType->new({
                    lang    => 'EN',
                    content => 'Wes Young',
                }),
                Timezone    => 'EDT',
                type    => ContactType::ContactType::Contact_type_person(),
                role    => ContactType::ContactRole::Contact_role_irt(),
            });

my $address = AddressType->new({
    category    => AddressType::AddressCategory::Address_category_ipv4_addr(),
    content     => '1.2.3.4',
});

my $event = EventDataType->new({
    DetectTime  => '2011-01-1T00:00:00Z',
    Flow        => FlowType->new({
        System  => SystemType->new({
            Node    => NodeType->new({
                Address => $address
            }),
            category    => SystemType::SystemCategory::System_category_infrastructure()
        }),
    }),

});

my $i = IODEFDocumentType->new({
    lang    => 'EN',
    Incident    => [
        IncidentType->new({
            IncidentID  => IncidentIDType->new({
                name    => 'name',
                content => 'content....',
            }),
            ReportTime  => '2011-01-01T00:00:00Z',
            purpose     => IncidentType::IncidentPurpose::Incident_purpose_mitigation(),
            Contact     => [$c],
            EventData   => $event,
            }),
    ],
});

warn ::Dumper(@{$i->get_Incident()}[0]);
my $buf = $i->encode();
warn $buf;
warn Dumper(IODEFDocumentType->decode($buf));
