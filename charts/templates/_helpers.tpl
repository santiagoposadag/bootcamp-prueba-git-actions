
{{- define "cardgame-core.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}



{{- define "cardgame-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "cardgame-core.labels" -}}
helm.sh/chart: {{ include "cardgame-core.chart" . }}
{{ include "cardgame-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "cardgame-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cardgame-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
