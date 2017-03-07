# docker-consul-varnish

Looks up a service by name in consul with consul-template and spins up varnish load balancer with the resulting config.

```
docker run --rm -it -p 8080:8080 \
    -e CONSUL_ADDR=<consul_host>:<consul_port> -e SERVICE_NAME=<my_consul_service> clb-varnish

```


### TODO

- [ ] SSL Support
