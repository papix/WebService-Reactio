package WebService::Reactio::Incident;
use strict;
use warnings;
use utf8;

use Carp;

sub create_incident {
    my ($self, $name, $options) = @_;
    Carp::croak '[ERROR] Incident name is required' unless $name;

    my $params = $options || {};
    $params->{name} = $name;

    $self->_request('POST', '/api/v1/incidents', $params);
}

sub incident {
    my ($self, $incident_id) = @_;
    Carp::croak '[ERROR] Incident id is required' unless $incident_id;

    $self->_request('GET', '/api/v1/incidents/'.$incident_id);
}

sub incidents {
    my ($self, $options) = @_;
    my $params = $options || {};

    $self->_request('GET', '/api/v1/incidents', $params);
}

sub notify {
    my ($self, $incident_id, $text, $options) = @_;
    Carp::croak '[ERROR] Incident id is required' unless $incident_id;
    Carp::croak '[ERROR] Notification text is required' unless $text;

    my $params = $options || {};
    $params->{incident_id}       = $incident_id;
    $params->{notification_text} = $text;

    $self->_request('POST', '/api/v1/notifications', $params);
}

1;
