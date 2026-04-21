# GOOGLE CLOUD SHELL

### XRAY FULL INSTALLER FIXED

## Installer

```bash
curl -fL "https://raw.githubusercontent.com/MindFreak09-King/GCP/refs/heads/main/installer.sh" -o installer.sh
chmod +x installer.sh
./installer.sh

```
## Remove / Clean Up
```bash
gcloud run services delete boysupotph --region=asia-southeast1 --quiet && cd ~ && rm -rf boysupotph
