import os

config = dict(
    environment="dev",
    zmq_enabled=False,
    stomp_uri='messaging-devops-broker01.dev1.ext.devlab.redhat.com:61612,messaging-devops-broker02.dev1.ext.devlab.redhat.com:61612',
    stomp_heartbeat=1000,
    stomp_user=os.environ['UMB_USERNAME'],
    stomp_pass=os.environ['UMB_PASSWORD'],
    stomp_ssl_crt='/secrets/umb-dev.crt',
    stomp_ssl_key='/secrets/umb-dev.key',
    stomp_queue='/queue/Consumer.rbean.VirtualTopic.eng.>',
)
