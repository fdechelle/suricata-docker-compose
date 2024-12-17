#! /bin/sh

set -e

# is all this mess really needed? Can we just simply run as root?

# fix_perms() {
#     if [[ "${PGID}" ]]; then
#         groupmod -o -g "${PGID}" suricata
#     fi

#     if [[ "${PUID}" ]]; then
#         usermod -o -u "${PUID}" suricata
#     fi

#     chown -R suricata:suricata /etc/suricata
#     chown -R suricata:suricata /var/lib/suricata
#     chown -R suricata:suricata /var/log/suricata
#     chown -R suricata:suricata /var/run/suricata
# }

# # check if needed if installed from PPA
# copy_dist_files() {
#     for src in /etc/suricata.dist/*; do
#         filename=$(basename ${src})
#         dst="/etc/suricata/${filename}"
#         if ! test -e "${dst}"; then
#             echo "Creating ${dst}."
#             cp -a "${src}" "${dst}"
#         fi
#     done
# }

# run_as_user="yes"

# check_for_cap() {
#     echo -n "Checking for capability $1: "
#     if getpcaps 1 2>&1 | grep -q "$1"; then
#         echo "yes"
#         return 0
#     else
#         echo "no"
#         echo "Warning: no $1 capability, use --cap-add $1" > /dev/stderr
#         return 1
#     fi
# }

# if ! check_for_cap sys_nice; then
#     run_as_user="no"
# fi
# if ! check_for_cap net_admin; then
#     run_as_user="no"
# fi

# ARGS=""

# if [[ "${run_as_user}" != "yes" ]]; then
#     echo "Warning: running as root due to missing capabilities" > /dev/stderr
# else
#     fix_perms
#     ARGS="${ARGS} --user suricata --group suricata"
# fi

exec /usr/bin/suricata ${ARGS} $@
