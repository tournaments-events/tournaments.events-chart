{{- define "charts.traits.fullname" -}}
{{ include "charts.fullname" . }}-traits
{{- end }}

{{/*
Traits service labels
*/}}
{{- define "charts.traits.labels" -}}
helm.sh/chart: {{ include "charts.chart" . }}
{{ include "charts.traits.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Traits service selector labels
*/}}
{{- define "charts.traits.selectorLabels" -}}
app.kubernetes.io/name: {{ include "charts.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: traits
{{- end }}

{{/*
Create the name of the service account to use for Traits service
*/}}
{{- define "charts.traits.serviceAccountName" -}}
{{- if .Values.traits.serviceAccount.create }}
{{- default (include "charts.traits.fullname" .) .Values.traits.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.traits.serviceAccount.name }}
{{- end }}
{{- end }}
