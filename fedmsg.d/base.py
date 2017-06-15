import os

config = dict(
    environment="dev",
    zmq_enabled=False,
    #'messaging-devops-broker01.dev1.ext.devlab.redhat.com:61612,messaging-devops-broker02.dev1.ext.devlab.redhat.com:61612',
    stomp_heartbeat=1000,
    stomp_uri=os.environ['UMB_URI'],
    stomp_user=os.environ['UMB_USERNAME'],
    stomp_pass=os.environ['UMB_PASSWORD'],
    stomp_ssl_crt='/secrets/cert',
    stomp_ssl_key='/secrets/key',
    stomp_queue='/topic/Consumer.client-umb-irc.umb-irc.VirtualTopic.eng.>',
)
