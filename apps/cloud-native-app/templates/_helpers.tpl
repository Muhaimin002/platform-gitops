{{- define "cna.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "cna.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cna.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "cna.labels" -}}
{{ include "cna.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: portfolio
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
environment: {{ .Values.environment }}
{{- end }}

{{/* Digest wins over tag. One of them is required. */}}
{{- define "cna.image" -}}
{{- if .Values.image.digest -}}
{{ .Values.image.repository }}@{{ .Values.image.digest }}
{{- else -}}
{{ .Values.image.repository }}:{{ required "set image.digest or image.tag" .Values.image.tag }}
{{- end -}}
{{- end }}
