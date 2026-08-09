#!/bin/sh

# Average the physical CPU cores exposed by coretemp. On other CPUs, fall
# back to the package sensors and finally to the kernel CPU thermal zones.
sum=0
count=0

for hwmon in /sys/class/hwmon/hwmon*; do
    [ -r "$hwmon/name" ] || continue
    IFS= read -r name < "$hwmon/name"
    case "$name" in
        coretemp)
            for label_file in "$hwmon"/temp*_label; do
                [ -r "$label_file" ] || continue
                IFS= read -r label < "$label_file"
                case "$label" in
                    Core\ *)
                        input_file=${label_file%_label}_input
                        [ -r "$input_file" ] || continue
                        IFS= read -r value < "$input_file"
                        case "$value" in *[!0-9]*|'') continue ;; esac
                        sum=$((sum + value))
                        count=$((count + 1))
                        ;;
                esac
            done
            ;;
        k10temp|zenpower)
            for input_file in "$hwmon"/temp*_input; do
                [ -r "$input_file" ] || continue
                IFS= read -r value < "$input_file"
                case "$value" in *[!0-9]*|'') continue ;; esac
                sum=$((sum + value))
                count=$((count + 1))
            done
            ;;
    esac
done

if [ "$count" -eq 0 ]; then
    for zone in /sys/class/thermal/thermal_zone*; do
        [ -r "$zone/type" ] && [ -r "$zone/temp" ] || continue
        IFS= read -r type < "$zone/type"
        case "$type" in
            x86_pkg_temp|cpu-thermal|cpu_thermal|TCPU)
                IFS= read -r value < "$zone/temp"
                case "$value" in *[!0-9]*|'') continue ;; esac
                sum=$((sum + value))
                count=$((count + 1))
                ;;
        esac
    done
fi

if [ "$count" -gt 0 ]; then
    printf '%d\n' "$(((sum / count + 500) / 1000))"
else
    printf -- '--\n'
fi
