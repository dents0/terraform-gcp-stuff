output "A------------IAM_CONFIG_FILE_CONTENT" { value = local.iam_config_file_content }
output "B------------IAM_CONFIG_OBJ"          { value = local.iam_config_obj }
output "C------------IAM_CONFIG"              { value = local.iam_config }
output "D------------IAM_BINDINGS"            { value = local.iam_bindings }
output "E------------BINDING_LIST"            { value = local.binding_list }
output "F------------FOR_EACH"                { value = { for key, value in local.binding_list : key => value } }