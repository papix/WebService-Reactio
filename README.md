[![Build Status](https://travis-ci.org/papix/WebService-Reactio.svg?branch=master)](https://travis-ci.org/papix/WebService-Reactio)
# NAME

WebService::Reactio - API client for Reactio

# SYNOPSIS

    use WebService::Reactio;

    my $client = WebService::Reactio->new(
        api_key      => '__API_KEY__',
        organization => '__ORGANIZATION__',
    );

    my $incidents = $client->incidents;

# DESCRIPTION

WebService::Reactio is API client for Reactio ([https://reactio.jp/](https://reactio.jp/)).

# METHODS

- new(%args)

    Create instance of WebService::Reactio.
    You must be specified `api_key` and `organization` in this method.

- create\_incident($name, \[\\%options\]);

    Create incident.
    Incident name (`$name`) is required.

- notify\_incident($incident\_id, $notification\_text, \[\\%options\]);

    Send notificate to specified incident.
    Incident id (`$incident_id`) and notification text (`$notification_text`) is required.

- incident($incident\_id);

    Get incident details.
    Incident id (`$incident_id`) is required.

- incidents(\[\\%options\]);

    Get incident list.

# LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

Reactio API Official Guide [https://reactio.jp/development/api](https://reactio.jp/development/api)

# AUTHOR

papix <mail@papix.net>
