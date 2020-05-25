function last_job_id
    jobs $argv | command awk '/^[0-9]+\t/ { print status = $1 } END { exit !status }'
end
