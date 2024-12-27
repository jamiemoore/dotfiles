##############################################################################
# azure
##############################################################################
# Azure Auth
az-auth () { aws-azure-login -p $1 --no-prompt ; export AWS_PROFILE=$1 }
az-auth-prompt () { DEBUG=aws-azure-login aws-azure-login -p $1 ; export AWS_PROFILE=$1 }
# DEBUG=aws-azure-login aws-azure-login -p shared --no-prompt