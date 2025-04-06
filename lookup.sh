#!/bin/bash
clear
API_KEY="TA_CLE_API_ICI"  
BASE_URL="http://apilayer.net/api/validate"
LOG_FILE="log_lookup.txt"

usage() {
    echo "Usage: $0 <numéro de téléphone au format international>"
    echo "Exemple: $0 +33612345678"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

PHONE_NUMBER="$1"

response=$(curl -s "${BASE_URL}?access_key=${API_KEY}&number=${PHONE_NUMBER}")

valid=$(echo "$response" | jq -r '.valid')
country_name=$(echo "$response" | jq -r '.country_name')
location=$(echo "$response" | jq -r '.location')
carrier=$(echo "$response" | jq -r '.carrier')
line_type=$(echo "$response" | jq -r '.line_type')


echo -e "\n==========================="
echo -e "    📞 Lookup Résultat"
echo -e "===========================\n"

if [ "$valid" = "true" ]; then
    echo "✅ Numéro valide"
    echo "🌍 Pays       : $country_name"
    echo "📍 Localité   : $location"
    echo "📡 Opérateur  : $carrier"
    echo "📞 Type de ligne : $line_type"

    {
        echo "==== Lookup $PHONE_NUMBER ===="
        echo "Validité     : Oui"
        echo "Pays         : $country_name"
        echo "Localité     : $location"
        echo "Opérateur    : $carrier"
        echo "Type de ligne: $line_type"
        echo "Date         : $(date)"
        echo ""
    } >> "$LOG_FILE"

    echo -e "\n📝 Résultat enregistré dans $LOG_FILE"
else
    echo "❌ Numéro invalide ou API Key incorrecte"
fi
