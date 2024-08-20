MODULE="Modules/OpenAIAPI/Sources/OpenAIAPI/"

openapi-generator generate -i "openaiapi.yaml" -g swift5 -o "openaiapi"
rm -r $MODULE""*
cp -R "openaiapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "openaiapi"
