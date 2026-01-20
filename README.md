Server Role - Private IP - Description
Web Server,
10.0.0.5,
The target node running Node Exporter to broadcast system metrics.

Ansible Controller,
.0.0.135,
The orchestration engine used to automate software installation and configuration.

Monitoring Server,
10.0.0.136,
"The central hub hosting Prometheus, Grafana, and the Cloudflare Tunnel agent."

Key Features
Automated Deployment: Used Ansible playbooks to ensure consistent installation of Prometheus, Grafana, and Node Exporter across all nodes.
Metric Scraping: Configured Prometheus to pull real-time data from the Web Server on port 9100.
Zero Trust Access: Leveraged cloudflared to create a secure tunnel, exposing the Grafana UI at https://grafana.sumantri-net.com without public IP exposure.
Visualization: Custom Dashboards (ID: 1860) implemented to monitor CPU, Memory, and Disk I/O with real-world verification via stress testing.

How to Use
Clone the Repo: git clone https://github.com/cyborgr2333/devops-bootcamp-project-.git
Deploy via Ansible: Run ansible-playbook -i inventory.ini setup_monitoring.yml.
Start Tunnel: Ensure cloudflared service is active on the monitoring node.
Access Dashboards: Navigate to grafana.sumantri-net.com.


