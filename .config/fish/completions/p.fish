complete --command p --arguments '(oc config view -o json | jq ".contexts[].name" -r)' -d 'Context to switch to'

