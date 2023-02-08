
function cpu_usage() {
    top -bn1 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print "CPU Usage: " 100-$8 "%"}'
}

function top_process() {
    top -bn1 | grep PID -A 1 | tail -n 1 | awk '{print $12 " Cpu " $9 " Mem " $10}'
}

function main() {
    echo $(top_process)
}

main