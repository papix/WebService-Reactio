package WebService::Reactio;
use 5.008001;
use strict;
use warnings;

use Carp;
use Furl;
use JSON;

our $VERSION = "0.01";

use parent qw/
    WebService::Reactio::Incident
/;

sub new {
    my ($class, %params) = @_;

    my $api_key      = $params{api_key};
    my $organization = $params{organization};
    my $domain       = $params{domain} || 'reactio.jp';
    Carp::croak '[ERROR] API key is required' unless $api_key;
    Carp::croak '[ERROR] Organization is required' unless $organization;

    bless {
        api_key  => $api_key,
        host     => "$organization.$domain",
        client   => Furl->new(
            agent   => "WebService::Reactio/$WebService::Reactio::VERSION",
            timeout => 10,
        ),
    }, $class;
}

sub _request {
    my ($self, $method, $path, $content) = @_;

    my $response = $self->{client}->request(
        method     => $method,
        scheme     => 'https',
        host       => $self->{host},
        path_query => $path,
        headers    => [
            'X-Api-Key'    => $self->{api_key},
            'Content-Type' => 'application/json',
            'Accept'       => 'application/json',
        ],
        content    => $content ? encode_json($content) : undef,
    );

    Carp::croak '[ERROR] Authentication error' if $response->status == 401;
    Carp::croak '[ERROR] Forbidden' if $response->status == 403;
    Carp::croak '[ERROR] Not found' if $response->status == 404;
    Carp::croak '[ERROR] Bad request' if $response->status =~ /^4/;
    Carp::croak '[ERROR] Server error' if $response->status =~ /^5/;

    return decode_json($response->{content});
}

1;

__END__

=encoding utf-8

=head1 NAME

WebService::Reactio - API client for Reactio

=head1 SYNOPSIS

    use WebService::Reactio;

    my $client = WebService::Reactio->new(
        api_key      => '__API_KEY__',
        organization => '__ORGANIZATION__',
    );

    my $incidents = $client->incidents;

=head1 DESCRIPTION

WebService::Reactio is API client for Reactio (L<https://reactio.jp/>).

=head1 METHODS

=over 4

=item my $client = WebService::Reactio->new(%args)

=item $client->create_incident($name, [\%options]);

=item $client->notify($incident_id, $notification_text, [\%options]);

=item my $incident = $client->incident($incident_id);

=item my $incidents = $client->incidents([\%options]);

=back

=head1 LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

papix E<lt>mail@papix.netE<gt>

=cut

