requires 'perl', '5.008001';
requires 'Carp';
requires 'Furl';
requires 'JSON';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::Mock::Furl';
    requires 'Furl::Response';
    requires 'Path::Class';
};

