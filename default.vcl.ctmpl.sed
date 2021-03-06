vcl 4.0;

import directors;
{{range $index, $elem := service "REPLACE"}}
backend {{ .Name | replaceAll "-" "_" }}{{ $index }} {
    .host = "{{.Address}}";
    .port = "{{.Port}}";
}{{end}}

sub vcl_init {
  new bar = directors.round_robin();
{{range $index, $elem := service "REPLACE"}}
  bar.add_backend({{ .Name | replaceAll "-" "_" }}{{ $index }});{{end}}
}

sub vcl_recv {
  set req.backend_hint = bar.backend();
}
