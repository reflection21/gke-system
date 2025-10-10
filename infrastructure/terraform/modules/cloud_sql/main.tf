resource "google_sql_database_instance" "db" {
  name                = var.db_instance_name
  database_version    = "MYSQL_8_4"
  deletion_protection = false
  settings {
    tier                         = "db-f1-micro"
    edition                      = "ENTERPRISE"
    user_labels                  = { team = "devops" }
    activation_policy            = "ALWAYS"
    availability_type            = "REGIONAL"
    enable_google_ml_integration = true
    enable_dataplex_integration  = true
    disk_autoresize              = true
    disk_autoresize_limit        = 50
    disk_size                    = 10
    disk_type                    = "PD_SSD"
    pricing_plan                 = "PER_USE" # Оплата по часам
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
    advanced_machine_features {
      threads_per_core = 2
    }
    data_cache_config {
      data_cache_enabled = true
    }
    deny_maintenance_period {
      start_date = "12-01"
      end_date   = "12-31"
      time       = "00:00:00"
    }
    sql_server_audit_config {
      bucket             = "gs://terraform-state-gcp-system/audit_log/"
      upload_interval    = "1800s"    # Загрузка логов каждые 30 минут
      retention_interval = "2592000s" # Хранение логов 30 дней
    }
    backup_configuration {
      enabled                        = true
      start_time                     = "04:00"
      # point_in_time_recovery_enabled = true   #posgres
      binary_log_enabled             = true # mysql
      location                       = var.gcp_project
      transaction_log_retention_days = 7
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }

    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc
      # ssl_mode                                      = "ENCRYPTED_ONLY"
      # server_ca_mode                                = "GOOGLE_MANAGED_INTERNAL_CA"
      allocated_ip_range                            = var.db_subnet
      enable_private_path_for_google_cloud_services = true
      authorized_networks {
        name  = "bastion-subnet"
        value = var.bastion_subnet
      }
      authorized_networks {
        name  = "node-subnet"
        value = var.worker_subnet
      }
    }
    maintenance_window {
      day          = 7       # Воскресенье
      hour         = 02      # 23:00 UTC (2:00 EEST)
      update_track = "week5" # Обновления через 5 недели
    }
    insights_config {
      query_insights_enabled  = true
      query_string_length     = 2048 # Хранить до 2048 байт запросов
      record_application_tags = true # Записывать теги приложения
      record_client_address   = true # Записывать IP клиента
      query_plans_per_minute  = 5    # 5 планов выполнения в минуту
    }
    password_validation_policy {
      enable_password_policy      = true
      min_length                  = 8
      complexity                  = "COMPLEXITY_DEFAULT"
      reuse_interval              = 5
      disallow_username_substring = true
    }
  }
  lifecycle {
    ignore_changes = [settings[0].disk_size]
  }
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.db.name
}

resource "google_sql_user" "reflection" {
  instance = google_sql_database_instance.db.name
  name     = "root"
  password = var.root_password
  # type     = "CLOUD_IAM_SERVICE_ACCOUNT"
  password_policy {
    allowed_failed_attempts      = 5
    enable_failed_attempts_check = true
    enable_password_verification = true
  }
}

