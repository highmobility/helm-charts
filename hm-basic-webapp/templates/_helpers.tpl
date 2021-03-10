{{/* vim: set filetype=mustache: */}}

{{- define "hm-basic-webapp.prefix" -}}
{{- printf "%s-%s" .Values.environmentName .Values.name -}}
{{- end -}}

{{- define "hm-basic-webapp.configName" -}}
{{- printf "%s-%s-%s" .Values.environmentName .Values.name "config" -}}
{{- end -}}

{{- define "hm-basic-webapp.secretName" -}}
{{- printf "%s-%s-%s" .Values.environmentName .Values.name "secret" -}}
{{- end -}}

{{- define "hm-basic-webapp.migrationsJobName" -}}
{{- printf "%s-%s-%s" .Values.environmentName .Values.name "migrations-job" -}}
{{- end -}}

{{- define "hm-basic-webapp.letsEncryptProductionName" -}}
{{- printf "%s-%s-%s" .Values.environmentName .Values.name "letsencrypt-production" -}}
{{- end -}}

{{- define "hm-basic-webapp.letsEncryptStagingName" -}}
{{- printf "%s-%s-%s" .Values.environmentName .Values.name "letsencrypt-staging" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hm-basic-webapp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Values.name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hm-basic-webapp.chart" -}}
{{- printf "%s-%s" .Values.name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "hm-basic-webapp.labels" -}}
helm.sh/chart: {{ include "hm-basic-webapp.chart" . }}
{{ include "hm-basic-webapp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "hm-basic-webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hm-basic-webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "hm-basic-webapp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "hm-basic-webapp.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
