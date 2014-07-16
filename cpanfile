requires 'Amon2', '6.02';
requires 'Data::Section::Simple', '0.07';
requires 'Module::Find', '0.12';
requires 'Module::Functions', '2';
requires 'Starlet', '0.20';
requires 'Text::Xslate', '2.0009';
requires 'perl', '5.010_001';

on configure => sub {
    requires 'Module::Build', '0.38';
    requires 'Module::CPANfile', '0.9010';
};

on test => sub {
    requires 'Test::More', '0.98';
};
