# This file is part of fedmsg.
# Copyright (C) 2012 Red Hat, Inc.
#
# fedmsg is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# fedmsg is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with fedmsg; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
#
# Authors:  Ralph Bean <rbean@redhat.com>

import os

config = dict(
    irc=[
        dict(
            network='irc.devel.redhat.com',
            port=6667,
            nickname='umb-%s' % os.environ['UMB_ENVIRON'],
            channel='umb-firehose',
            timeout=120,
            make_pretty=True,
            make_terse=True,
            make_short=False,
            line_rate=0.9,
            # Don't show the heartbeat... gross.
            filters=dict(
                topic=[],
                body=['lub-dub'],
            ),
        ),
        dict(
            network='irc.devel.redhat.com',
            port=6667,
            nickname='freshmaker-%s' % os.environ['UMB_ENVIRON'],
            channel='freshmaker',
            timeout=120,
            make_pretty=True,
            make_terse=True,
            make_short=False,
            line_rate=0.9,
            filters=dict(
                topic=[
                    # Ignore anything that *doesn't* have this in the topic.
                    '^((?!(freshmaker\.event)).)*$',
                ],
                body=[
                    # Ignore any message with any of these in the body.
                    "release-e2e",
                    "SKIPPED",
                ],
            ),

        ),
    ],
    # the available colors can be looked up from here:
    # https://github.com/fedora-infra/fedmsg/blob/0.16.4/fedmsg/consumers/ircbot.py#L48-L65
    irc_color_lookup={
        "brew": "light blue",
        "errata": "green",
        "git": "red",
        "pub": "brown",
        "rpmdiff": "purple",
        "resultsdb": "orange",
    },

    # color for title if color lookup not defined
    irc_default_color='light grey',

    irc_method='msg',  # Either 'msg' or 'notice'
)
