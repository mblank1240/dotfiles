#!/bin/bash
input=$(cat)
OR=$'\033[38;2;217;119;87m'; WH=$'\033[97m'; DM=$'\033[90m'; RS=$'\033[0m'

IFS=$'\t' read -r cwd model effort ctx five week < <(printf '%s' "$input" | python3 -I -c '
import json, sys
d = json.load(sys.stdin)
def g(*keys):
    for k in keys:
        d2 = d
        for p in k.split("."):
            d2 = d2.get(p) if isinstance(d2, dict) else None
        if d2 is not None:
            return str(d2)
    return ""
print("\t".join([
    g("workspace.current_dir", "cwd") or "-",
    g("model.display_name") or "-",
    g("effort.level") or "-",
    g("context_window.used_percentage") or "-",
    g("rate_limits.five_hour.used_percentage") or "-",
    g("rate_limits.seven_day.used_percentage") or "-",
]))
')
# "-" stands in for missing values so tab-splitting keeps field positions
for v in cwd model effort ctx five week; do [ "${!v}" = "-" ] && printf -v "$v" ''; done

# Directory: last 3 components, all but last abbreviated to 3 chars + ...
p=${cwd/#$HOME/\~}
IFS='/' read -ra parts <<< "$p"
parts=("${parts[@]}")
n=${#parts[@]}; start=$((n>3 ? n-3 : 0))
dir=""
for ((i=start;i<n;i++)); do
  s=${parts[i]}
  [ -z "$s" ] && continue
  if [ $i -lt $((n-1)) ] && [ ${#s} -gt 3 ] && [ "$s" != "~" ]; then s="${s:0:3}..."; fi
  dir="${dir:+$dir/}$s"
done
[ "${p:0:1}" = "/" ] && [ $start -eq 0 ] && dir="/$dir"
[ $start -gt 0 ] && dir=".../$dir" && dir=${dir#.../}

# Green -> red by usage
pc() {
  local v=$1 r g
  if (( $(printf '%.0f' "$v") <= 50 )); then r=$(( $(printf '%.0f' "$v") * 255 / 50 )); g=200
  else r=255; g=$(( 200 - ( $(printf '%.0f' "$v") - 50) * 200 / 50 )); fi
  printf '\033[38;2;%d;%d;0m%.0f%%%s' "$r" "$g" "$v" "$RS"
}

case "$effort" in
  low) e=lo; ec=$'\033[38;2;0;200;0m';;
  medium) e=med; ec=$'\033[38;2;230;200;0m';;
  high) e=hi; ec=$'\033[38;2;255;140;0m';;
  xhigh) e=xhi; ec=$'\033[38;2;255;60;0m';;
  max) e=max; ec=$'\033[38;2;255;0;0m';;
  *) e="$effort"; ec="$OR";;
esac

SEP=" ${DM}|${RS} "
out="${WH}${dir}${RS}${SEP}${OR}${model}${RS}"
[ -n "$e" ] && out="$out ${OR}(${RS}${ec}${e}${RS}${OR})${RS}"
[ -n "$ctx" ] && out="$out${SEP}${OR}ctx:${RS} $(pc "$ctx")"
if [ -n "$five$week" ]; then
  out="$out${SEP}${OR}usage:${RS}"
  [ -n "$five" ] && out="$out ${WH}5h:${RS}$(pc "$five")"
  [ -n "$week" ] && out="$out ${WH}7d:${RS}$(pc "$week")"
fi
printf '%s' "$out"
