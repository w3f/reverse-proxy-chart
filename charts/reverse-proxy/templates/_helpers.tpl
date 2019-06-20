{{/* redirection name */}}
{{- define "reverse-proxy.name" -}}
{{ .id }}
{{- end }}
{{/* TLS seccret name */}}
{{- define "reverse-proxy.tlsName" -}}
{{ .id }}-tls
{{- end }}
