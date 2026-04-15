import os
from datetime import datetime


keywords = ["CRITICAL", "ERROR", "FAILED LOGIN"]


with open("server.log", "r") as file:
    lines = file.readlines()


filtered_lines = []
for line in lines:
    for keyword in keywords:
        if keyword in line:
            filtered_lines.append(line)
            break

log_count = {
    "CRITICAL": 0,
    "ERROR": 0,
    "FAILED LOGIN": 0
}

for line in filtered_lines:
    for key in log_count:
        if key in line:
            log_count[key] += 1


date_str = datetime.now().strftime("%Y-%m-%d")
output_file = f"security_alert_{date_str}.txt"


with open(output_file, "w") as file:
    file.write("=== SECURITY ALERT REPORT ===\n\n")
    
    for line in filtered_lines:
        file.write(line)

    file.write("\n=== SUMMARY ===\n")
    for key, value in log_count.items():
        file.write(f"{key}: {value}\n")

file_size = os.path.getsize(output_file)

print(f"Alert file created: {output_file}")
print(f"File size: {file_size} bytes")