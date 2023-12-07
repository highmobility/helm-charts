{{/*
Expand the name of the chart.
*/}}
{{- define "hm-worker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hm-worker.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hm-worker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hm-worker.labels" -}}
helm.sh/chart: {{ include "hm-worker.chart" . }}
{{ include "hm-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hm-worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hm-worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "hm-worker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "hm-worker.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "hm-worker.configName" -}}
{{- printf "%s-%s" (include "hm-worker.fullname" .) "config" -}}
{{- end -}}

{{- define "hm-worker.secretName" -}}
{{- printf "%s-%s" (include "hm-worker.fullname" .) "secret" -}}
{{- end -}}

{{- define "hm-worker.headlessServiceName" -}}
{{- printf "%s-%s" (include "hm-worker.fullname" .) "nodes" -}}
{{- end -}}
