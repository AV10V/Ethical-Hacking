import subprocess

def check_domains(file_path):
    with open(file_path, 'r') as file:
        domains = [line.strip() for line in file]

    for domain in domains:
        print(f"Checking: {domain}")
        command = f"echo {domain} | httpx -silent"
        result = subprocess.run(command, shell=True, capture_output=True, text=True)

        if result.returncode == 0:
            print(f"   {domain} is live")
        else:
            print(f"   {domain} is not live")

if __name__ == "__main__":
    file_path = "domains.txt"  # Replace with the path to your text file
    check_domains(file_path)
