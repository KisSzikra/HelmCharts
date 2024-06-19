{{- define "mariadb.dockerProxyImagePullSecret" }}
{{- with .Values.global.dockerProxyCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"auth\":\"%s\"}}}" .registry (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{- define "mariadb.image" }}
{{- if and (.Values.global.dockerProxyCredentials.username) (.Values.global.dockerProxyCredentials.password) }}{{ .Values.global.dockerProxyCredentials.registry }}/{{ .Values.mariadb.image }}@sha256:{{ .Values.mariadb.sha256 }}
{{- else }}{{ .Values.mariadb.image }}@sha256:{{ .Values.mariadb.sha256 }}
{{- end }}
{{- end }}

{{- define "phpmyadmin.image" }}
{{- if and (.Values.global.dockerProxyCredentials.username) (.Values.global.dockerProxyCredentials.password) }}{{ .Values.global.dockerProxyCredentials.registry }}/{{ .Values.global.devtools.phpmyadmin.image }}@sha256:{{ .Values.global.devtools.phpmyadmin.sha256 }}
{{- else }}{{ .Values.global.devtools.phpmyadmin.image }}@sha256:{{ .Values.global.devtools.phpmyadmin.sha256 }}
{{- end }}
{{- end }}

{{- define "busybox.image" }}
{{- if and (.Values.global.dockerProxyCredentials.username) (.Values.global.dockerProxyCredentials.password) }}{{ .Values.global.dockerProxyCredentials.registry }}/busybox@sha256:538721340ded10875f4710cad688c70e5d0ecb4dcd5e7d0c161f301f36f79414
{{- else }}busybox@sha256:538721340ded10875f4710cad688c70e5d0ecb4dcd5e7d0c161f301f36f79414
{{- end }}
{{- end }}
