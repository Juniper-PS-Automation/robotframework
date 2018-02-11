FROM juniperps/map-automation-helper:v0.1.2

LABEL net.juniper.ps.automation.description="base robot testing container" \
      net.juniper.ps.automation.extra="also uses pyez-ansible container" \
      net.juniper.ps.automation.maintainer="Paul Plavetzki"

RUN pip install robotframework robotframework-selenium2library xmltodict librabbitmq pika

