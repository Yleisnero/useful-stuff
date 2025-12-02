plugins=(
	git
	zsh-autosuggestions
)

alias gitroot='cd $(git rev-parse --show-toplevel)'
alias cl="clear"
alias office='if ! grep -q "$(date +"%Y-%m-%d")" ~/office-days.txt 2>/dev/null; then echo "$(date +"%Y-%m-%d %A")" >> ~/office-days.txt && echo "Office day logged!"; else echo "Already logged for today!"; fi'
alias office-list='cat ~/office-days.txt'
alias office-count='
total=$(wc -l ~/office-days.txt 2>/dev/null | cut -d" " -f1)
echo "Total Office-Days: $total"
'
alias office-count-month='
month_name=$(date +"%B %Y")
count=$(grep "$(date +"%Y-%m")" ~/office-days.txt 2>/dev/null | wc -l)
echo "Office-Days $month_name: $count"
'
alias office-count-year='
year=$(date +"%Y")
count=$(grep "$year" ~/office-days.txt 2>/dev/null | wc -l)
echo "Office-Days $year: $count"
'
alias office-percentage='
month=$(date +"%m" | sed "s/^0//")
year=$(date +"%Y")
office_days=$(grep "$(date +"%Y-%m")" ~/office-days.txt 2>/dev/null | wc -l)
if [ "$year" = "2025" ]; then
    case $month in
        10) work_days=12 ;;
        11) work_days=20 ;;
        12) work_days=21 ;;
        *) work_days=21 ;;
    esac
    year_info=""
elif [ "$year" = "2026" ]; then
    case $month in
        1|2|4|8|10|11|12) work_days=20 ;;
        3|7|9) work_days=22 ;;
        5) work_days=18 ;;
        6) work_days=21 ;;
        *) work_days=21 ;;
    esac
    year_info=""
else
    work_days=21
    year_info=" (Using default: 21 days)"
fi
percentage=$((office_days * 100 / work_days))
echo "Office-Days in $(date +"%B %Y"): $office_days of $work_days work days${year_info} (${percentage}%)"
'
alias office-percentage-year='
year=$(date +"%Y")
echo "Office-Days overview for $year:"
echo "================================="
for month in {1..12}; do
    month_padded=$(printf "%02d" $month)
    search_pattern="$year-$month_padded"
    month_name=$(date -d "$year-$month_padded-01" +"%B" 2>/dev/null || echo "Month $month")
    office_days=$(grep "$search_pattern" ~/office-days.txt 2>/dev/null | wc -l)
if [ "$year" = "2025" ]; then
    case $month in
        10) work_days=12 ;;
        11) work_days=20 ;;
        12) work_days=21 ;;
        *) work_days=21 ;;
    esac
    year_info=""
elif [ "$year" = "2026" ]; then
        case $month in
            1|2|4|8|10|11|12) work_days=20 ;;
            3|7|9) work_days=22 ;;
            5) work_days=18 ;;
            6) work_days=21 ;;
            *) work_days=21 ;;
        esac
        year_info=""
    else
        work_days=21
        year_info=" (Using default: 21 days)"
    fi
    if [ $work_days -gt 0 ]; then
        percentage=$((office_days * 100 / work_days))
    else
        percentage=0
    fi
    printf "%-10s: %2d of %2d work days%s (%2d%%)\n" "$month_name" "$office_days" "$work_days" "$year_info" "$percentage"
done
# Jahresgesamtstatistik
total_office_days=$(grep "$year" ~/office-days.txt 2>/dev/null | wc -l)
if [ "$year" = "2025" ]; then
    total_work_days=53  # 12 + 20 + 21 = 53
    year_info_total=""
elif [ "$year" = "2026" ]; then
    total_work_days=251  # 20*8 + 22*3 + 18*1 + 21*1 = 160 + 66 + 18 + 21 = 251
    year_info_total=""
else
    total_work_days=252  # 21*12 = 252
    year_info_total=" (Standard)"
fi
if [ $total_work_days -gt 0 ]; then
    total_percentage=$((total_office_days * 100 / total_work_days))
else
    total_percentage=0
fi
echo "================================="
printf "%-10s: %2d von %2d Arbeitstagen%s (%2d%%)\n" "TOTAL" "$total_office_days" "$total_work_days" "$year_info_total" "$total_percentage"
'
