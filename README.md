## Description

This PowerShell script automates the process of downloading and installing essential tools for security analysis and forensic investigations. It also includes support for downloading and installing Python 3.8.0, as well as setting up dependencies required for Volatility.

### Tools Included:

* **Wireshark** : A network protocol analyzer.
* **Process Hacker** : A process viewer and management tool.
* **Procmon (Process Monitor)** : A monitoring tool for Windows.
* **Process Explorer** : Advanced process exploration and management.
* **Volatility** : A memory forensics framework.
* **Python 3.8.0** : Required for Volatility and its dependencies.

---

## Prerequisites

* Windows Operating System.
* PowerShell (Run the script in an elevated session as Administrator).

---

## Features

1. Creates a download directory for tools (`%USERPROFILE%\Downloads\SecurityTools`).
2. Downloads the following tools from their official or trusted sources:
   * Wireshark
   * Process Hacker
   * Procmon
   * Process Explorer
   * Volatility
   * Python 3.8.0
3. Installs Python 3.8.0 silently.
4. Installs Python dependencies for Volatility:
   * **distorm3**
   * **pycrypto**
   * **Pillow**
   * **openpyxl**
   * **ujson**
5. Provides error handling for failed downloads or installations.

---

## Usage

### Running the Script

1. Get the script `get_tools.ps1` (Git clone or just download as a .zip)
2. Open PowerShell as Administrator.
3. Navigate to the directory containing the script.
4. Execute the script:
   ```powershell
   .\get_tools.ps1
   ```

---

## Output

* All tools and Python installer will be saved in:
  ```
  %USERPROFILE%\Downloads\SecurityTools
  ```
* The script will display success or error messages for each tool and dependency.

---

## Acknowledgements

The script utilizes tools and libraries provided by:

* Wireshark ([https://www.wireshark.org](https://www.wireshark.org/))
* Process Hacker ([https://sourceforge.net/projects/systeminformer](https://sourceforge.net/projects/systeminformer))
* Sysinternals Suite ([https://learn.microsoft.com/en-us/sysinternals/](https://learn.microsoft.com/en-us/sysinternals/))
* Volatility ([https://github.com/volatilityfoundation](https://github.com/volatilityfoundation))
* Python Software Foundation ([https://www.python.org](https://www.python.org/))
