#!  /usr/bin/sh

PAYLOAD=pay.pay
ADDRESS=93:99:93:F5:18
VENDOR=logitech
INTERVAL=5
DURATION=5
KBD=sv


bin/jackitng \
  	--reset \
	--script ${PAYLOAD} \
	--interval ${INTERVAL} \
	--duration ${DURATION} \
	--layout ${KBD} \
	#--address ${ADDRESS} \
	#--vendor ${VENDOR} \
