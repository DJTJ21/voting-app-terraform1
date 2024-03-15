##########  db_deployment.tf  ##########
variable "db_name" {
  description = "Nom de l'application"
  default     = "db"
}

variable "postgres_image" {
  description = "Image Docker du conteneur PostgreSQL"
  default     = "postgres:15-alpine"
}

variable "postgres_user" {
  description = "Nom d'utilisateur PostgreSQL"
  default     = "postgres"
}

variable "postgres_password" {
  description = "Mot de passe PostgreSQL"
  default     = "postgres"
}

variable "postgres_container_port" {
  description = "Port du conteneur PostgreSQL"
  default     = 5432
}

##########  redis_deployment.tf  ##########

variable "redis_name" {
  description = "Nom de l'application"
  default     = "redis"
}

variable "redis_image" {
  description = "Image Docker du conteneur Redis"
  default     = "redis:alpine"
}

variable "redis_port" {
  description = "Port du conteneur Redis"
  default     = 6379
}


##########  result_deployment.tf  ##########

variable "result_name" {
  description = "Nom de l'application"
  default     = "result"
}

variable "result_image" {
  description = "Image Docker du conteneur"
  default     = "dockersamples/examplevotingapp_result"
}

variable "result_container_port" {
  description = "Port du conteneur"
  default     = 80
}

########### provider.tf ##########

variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

####### clusterIP_service.tf ########

variable "clusterIP" {
  type = map(object({
    port         = number
    target_port  = number
    service_name = string
  }))
}
########## nodeport_service.tf ##########


variable "nodePort" {
  type = map(object({
    port         = number
    target_port  = number
    service_name = string
    nodeport     = number
  }))
  
}

######## vote_deployment.tf ########

variable "vote_name" {
  description = "Nom de l'application"
  default     = "vote"
}

variable "vote_container_image" {
  description = "Image Docker du conteneur"
  default     = "dockersamples/examplevotingapp_vote"
}

variable "vote_container_port" {
  description = "Port du conteneur"
  default     = 80
}

######## worker_deployment.tf ########

variable "worker_name" {
  description = "Nom de l'application"
  default     = "worker"
}

variable "worker_container_image" {
  description = "Image Docker du conteneur"
  default     = "dockersamples/examplevotingapp_worker"
}