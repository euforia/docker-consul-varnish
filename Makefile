
clean:
	rm -f default.vcl

render:
	consul-template -consul-addr=${CONSUL_ADDR} -template=default.vcl.ctmpl:default.vcl -once
