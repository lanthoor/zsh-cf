function cflogin() {
    case $# in
    1)
        cf login -a https://api.cf.$1.hana.ondemand.com --sso
        ;;
    2)
        cf login -a https://api.cf.$1.hana.ondemand.com -o $2 --sso
        ;;
    3)
        cf login -a https://api.cf.$1.hana.ondemand.com -o $2 -s $3 --sso
        ;;
    *)
        echo "Usage: cflogin <region> [<org>] [<space>]"
        echo "Example: cflogin us10"
        echo "Example: cflogin us10 dsi-iat-test-1"
        echo "Example: cflogin us10 dsi-iat-test-1 test"
        ;;
    esac
}

function btplogin() {
    btp login --url https://cpcli.cf.$1.hana.ondemand.com --subdomain $2  --sso
}

function setup_subaccount() {
    while read -r line; do
        for role in "${@:3}"; do
            btp assign security/role-collection --subaccount $1 --email $line --role-collection $role
        done
    done < $2
}
