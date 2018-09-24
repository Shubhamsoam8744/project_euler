
digit = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
other = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

def print_below_100(number):
    if number > 19:
        leading = int(float(number)/10.0)
        rest = number - leading*10
        if rest == 0:
            return other[leading-2]
        else:
            return other[leading-2] + " " + digit[rest-1]
    elif number > 10:
        return teens[number-11]
    elif number == 10:
        return "ten"
    else:
        return digit[number-1]


def print_number(number):
    assert (number <= 1000)
    if number == 1000:
        return "one thousand"
    else:
        if number < 100:
            return print_below_100(number)
        else:
            leading = int(float(number) / 100.0)
            rest = number - leading*100
            if rest == 0:
                return digit[leading-1] + " hundred"
            else:
                return digit[leading-1] + " hundred and " + print_below_100(rest)


print(print_number(342))
print(len(print_number(342).replace(" ", "")))
print(print_number(115))
print(len(print_number(115).replace(" ", "")))
print(print_number(1000))
print(print_number(100))
print(print_number(101))
print(print_number(18))
print(print_number(818))
print(print_number(210))
print(print_number(999))

complete_string = ""
for number in range(1,1001):
    substr = print_number(number)
    print(substr)
    complete_string += substr

print(len(complete_string.replace(" ", "")))