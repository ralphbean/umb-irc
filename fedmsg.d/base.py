import os
from moksha.common.lib.converters import asbool

blocking_mode = asbool(os.environ.get('UMB_BLOCKING_MODE', 'False'))
heartbeat = int(os.environ.get('UMB_HEARTBEAT', 0))

config = dict(
    environment="dev",
    zmq_enabled=False,
    # 'messaging-devops-broker01.dev1.ext.devlab.redhat.com:61612,messaging-devops-broker02.dev1.ext.devlab.redhat.com:61612',
    stomp_heartbeat=heartbeat,
    stomp_uri=os.environ['UMB_URI'],
    stomp_user=os.environ['UMB_USERNAME'],
    stomp_pass=os.environ['UMB_PASSWORD'],
    stomp_ssl_crt='/secrets/cert',
    stomp_ssl_key='/secrets/key',
    stomp_queue='/queue/Consumer.client-umb-irc.umb-irc.VirtualTopic.>',
)

config['moksha.blocking_mode'] = blocking_mode
