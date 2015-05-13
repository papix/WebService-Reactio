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

- my $client = WebService::Reactio->new(%args)
- $client->create\_incident($name, \[\\%options\]);
- $client->notify($incident\_id, $notification\_text, \[\\%options\]);
- my $incident = $client->incident($incident\_id);
- my $incidents = $client->incidents(\[\\%options\]);

# LICENSE

Copyright (C) papix.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

papix <mail@papix.net>
