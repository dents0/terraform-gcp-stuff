locals {
  defaults = {
    argument               = []
    container_command      = []
    container_concurrency  = 0
    env_secret_vars        = []
    env_vars               = []
    generate_revision_name = true
    members                = []
    ports = {
      name = "http1"
      port = 8080
    }
    service_annotations  = {}
    template_annotations = {}
    timeout_seconds      = 120
    traffic_split = [{
      latest_revision = true
      percent         = 100
      revision_name   = "v1-0-0"
    }]
  }

  config_file         = "config.yaml"
  config_file_content = fileexists(local.config_file) ? file(local.config_file) : "services:"
  config              = yamldecode(local.config_file_content)
  # Using try with tomap helps to avoid the "inconsistent conditional result types" issue
  services = try(local.config.services == null ? tomap(false) : local.config.services, {})
}

# # Further usage:
# for_each        = { for serv in local.services : serv.service_name => serv }
# env_secret_vars = lookup(each.value, "env_secret_vars", local.defaults.env_secret_vars)

