locals {
    iam_config_file         = "config.yaml"
    iam_config_file_content = fileexists(local.iam_config_file) ? file(local.iam_config_file) : "project-iam-bindings:"
    iam_config_obj          = yamldecode(local.iam_config_file_content)
    iam_config              = local.iam_config_obj.project-iam-bindings == null ? [] : local.iam_config_obj.project-iam-bindings

    iam_bindings            = { for iam in local.iam_config : sha1("${iam.projectid}-${iam.member}-${iam.roles[0]}") => iam }

    binding_list            = flatten([
        for iam in values(local.iam_bindings) : [
            for role in iam.roles: {
                projectid   = iam.projectid
                member      = iam.member
                role        = role
            }
        ]
    ])
}


resource "google_project_iam_member" "project_bindings" {

    for_each = { for key, value in local.binding_list : key => value }

    project  = each.value.projectid
    role     = each.value.role
    member   = each.value.member
}
