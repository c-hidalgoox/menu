#!/usr/bin/env bash
#
# menu_instalador.sh
# Script unificado con menú por cases para la instalación de herramientas de desarrollo y workstation.
# Uso: ./menu_instalador.sh (ejecutar con tu usuario normal, el script pedirá sudo cuando sea necesario)
#

set -euo pipefail

# ------------------------------------------------------------------
# BANNERS DECORATIVOS
# ------------------------------------------------------------------
banner_firefox() {
  printf '\e[1;35m'
  cat << "EOF"
███████╗██╗██████╗ ███████╗███████╗ ██████╗ ██╗  ██╗
██╔════╝██║██╔══██╗██╔════╝██╔════╝██╔═══██╗╚██╗██╔╝
█████╗  ██║██████╔╝█████╗  █████╗  ██║   ██║ ╚███╔╝ 
██╔══╝  ██║██╔══██╗██╔══╝  ██╔══╝  ██║   ██║ ██╔██╗ 
██║     ██║██║  ██║███████╗██║     ╚██████╔╝██╔╝ ██╗
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝
EOF
  printf '\e[0m\n'
}

banner_libreoffice() {
  printf '\e[1;36m'
  cat << "EOF"
██████╗ ██████╗  █████╗ ██╗   ██╗███████╗
██╔══██╗██╔══██╗██╔══██╗██║   ██║██╔════╝
██████╔╝██████╔╝███████║██║   ██║█████╗  
██╔══██╗██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  
██████╔╝██║  ██║██║  ██║ ╚████╔╝ ███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝
EOF
  printf '\e[0m\n'
}

banner_terminal() {
  printf '\e[1;32m'
  cat << "EOF"
██╗   ██╗██╗██████╗ ████████╗██╗   ██╗ █████╗ ██╗     ██████╗  ██████╗ ██╗  ██╗
██║   ██║██║██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██║     ██╔══██╗██╔═══██╗╚██╗██╔╝
██║   ██║██║██████╔╝   ██║   ██║   ██║███████║██║     ██████╔╝██║   ██║ ╚███╔╝ 
╚██╗ ██╔╝██║██╔══██╗   ██║   ██║   ██║██╔══██║██║     ██╔══██╗██║   ██║ ██╔██╗ 
 ╚████╔╝ ██║██║  ██║   ██║   ╚██████╔╝██║  ██║███████╗██████╔╝╚██████╔╝██╔╝ ██╗
  ╚═══╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
EOF
  printf '\e[0m\n'
}

banner_gns3() {
  printf '\e[1;34m'
  cat << "EOF"
 ██████╗██╗  ██╗██████╗  ██████╗ ███╗   ███╗██╗██╗   ██╗███╗   ██╗
██╔════╝██║  ██║██╔══██╗██╔═══██╗████╗ ████║██║██║   ██║████╗  ██║
██║     ███████║██████╔╝██║   ██║██╔████╔██║██║██║   ██║██╔██╗ ██║
██║     ██╔══██║██╔══██╗██║   ██║██║╚██╔╝██║██║██║   ██║██║╚██╗██║
╚██████╗██║  ██║██║  ██║╚██████╔╝██║ ╚═╝ ██║██║╚██████╔╝██║ ╚████║
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
EOF
  printf '\e[0m\n'
}

banner_navegadores() {
  printf '\e[1;33m'
  cat << "EOF"
 ██████╗ ███████╗███████╗██╗ ██████╗███████╗
██╔═══██╗██╔════╝██╔════╝██║██╔════╝██╔════╝
██║   ██║█████╗  █████╗  ██║██║     █████╗  
██║   ██║██╔══╝  ██╔══╝  ██║██║     ██╔══╝  
╚██████╔╝██║     ██║     ██║╚██████╗███████╗
 ╚═════╝ ╚═╝     ╚═╝     ╚═╝ ╚═════╝╚══════╝
EOF
  printf '\e[0m\n'
}

banner_virtualbox() {
  printf '\e[1;31m'
  cat << "EOF"
 ██████╗ ███╗   ██╗███████╗███████╗ 
██╔════╝ ████╗  ██║██╔════╝╚════██╗
██║  ███╗██╔██╗ ██║███████╗ █████╔╝
██║   ██║██║╚██╗██║╚════██║ ╚═══██╗
╚██████╔╝██║ ╚████║███████║██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═══╝╚══════╝╚═════╝ 
EOF
  printf '\e[0m\n'
}

banner_todo() {
  printf '\e[1;36m'
  cat << "EOF"
████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     
╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     
   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     
   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     
   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
EOF
  printf '\e[0m\n'
}

# ------------------------------------------------------------------
# FUNCIONES DE INSTALACIÓN
# ------------------------------------------------------------------

instalar_firefox() {
  banner_firefox
  echo "[INFO] Iniciando instalación de Firefox (Flatpak + Extensiones)..."
  
  # Lógica extraída de setup-firefox-flatpak.sh
  if command -v snap >/dev/null 2>&1 && snap list firefox >/dev/null 2>&1; then
    sudo snap remove firefox
  fi
  
  sudo apt update -y
  sudo apt install -y flatpak gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install -y --system flathub org.mozilla.firefox

  # Configurar extensiones forzadas (uBlock Origin y DocsAfterDark)
  local arch="/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(flatpak --default-arch)/stable/policies"
  sudo mkdir -p "$arch"
  sudo tee "$arch/policies.json" > /dev/null << 'EOF'
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "{e8ffc3db-2875-4c7f-af38-d03e7f7f8ab9}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/docsafterdark/latest.xpi"
      }
    }
  }
}
EOF
  echo "[ OK ] Firefox instalado y configurado correctamente."
}

instalar_libreoffice() {
  banner_libreoffice
  echo "[INFO] Iniciando instalación de LibreOffice..."
  sudo apt update -y
  sudo apt install -y flatpak gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install -y --system flathub org.libreoffice.LibreOffice
  echo "[ OK ] LibreOffice instalado correctamente."
}

instalar_terminal() {
  banner_terminal
  echo "[INFO] Iniciando instalación de la Terminal (Ptyxis)..."
  sudo apt update -y
  sudo apt install -y flatpak gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  
  if apt-cache policy ptyxis 2>/dev/null | grep -q 'Candidate: [^(]'; then
    sudo apt-get install -y ptyxis
  else
    sudo flatpak install -y --system flathub app.devsuite.Ptyxis
  fi
  echo "[ OK ] Terminal Ptyxis instalada correctamente."
}

instalar_gns3() {
  banner_gns3
  echo "[INFO] Iniciando instalación de GNS3..."
  sudo apt update -y
  sudo apt install -y software-properties-common
  
  if ! grep -rqs "gns3/ppa" /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null; then
    sudo add-apt-repository -y ppa:gns3/ppa
    sudo apt-get update -y
  fi

  {
    echo "ubridge ubridge/install-setuid boolean true"
    echo "wireshark-common wireshark-common/install-setuid boolean true"
  } | sudo debconf-set-selections

  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gns3-gui gns3-server
  
  local target_usr="${SUDO_USER:-$USER}"
  for grp in ubridge libvirt kvm wireshark docker; do
    if getent group "$grp" >/dev/null; then
      sudo usermod -aG "$grp" "$target_usr" || true
    fi
  done
  echo "[ OK ] GNS3 instalado correctamente. (Recuerda reiniciar sesión para los grupos)."
}

instalar_navegadores() {
  banner_navegadores
  echo "[INFO] Iniciando instalación de Brave y Chromium..."
  
  # Dependencias base
  sudo apt update -y
  sudo apt install -y curl ca-certificates gnupg flatpak gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

  # Chromium Flatpak
  sudo flatpak install -y --system flathub org.chromium.Chromium

  # Brave Repo APT
  local keyring="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
  if [[ ! -f "$keyring" ]]; then
    sudo curl -fsSLo "$keyring" https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  fi
  
  echo "deb [signed-by=${keyring}] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null
  sudo apt update -y
  sudo apt install -y brave-browser
  
  echo "[ OK ] Brave y Chromium instalados correctamente."
}

instalar_virtualbox() {
  banner_virtualbox
  echo "[INFO] Iniciando instalación de VirtualBox..."
  
  if grep -rqsE '^\s*(deb|Components:).*\bmultiverse\b' /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null; then
    :
  else
    sudo add-apt-repository -y multiverse
    sudo apt-get update -y
  fi

  sudo apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential dkms "linux-headers-$(uname -r)"
  
  # Preaceptar licencia del extension pack
  echo "virtualbox-ext-pack virtualbox-ext-pack/license select true" | sudo debconf-set-selections
  
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y virtualbox virtualbox-qt virtualbox-guest-additions-iso virtualbox-ext-pack

  local target_usr="${SUDO_USER:-$USER}"
  if ! getent group vboxusers >/dev/null; then
    sudo groupadd vboxusers
  fi
  sudo usermod -aG vboxusers "$target_usr" || true

  echo "[ OK ] VirtualBox instalado correctamente."
}

instalar_todo() {
  banner_todo
  echo "[INFO] Instalando todas las aplicaciones secuencialmente..."
  instalar_firefox
  instalar_libreoffice
  instalar_terminal
  instalar_gns3
  instalar_navegadores
  instalar_virtualbox
  echo "[ OK ] ¡Todas las aplicaciones se han instalado con éxito!"
}

# ------------------------------------------------------------------
# MENÚ PRINCIPAL (BUCLE WHILE + CASE)
# ------------------------------------------------------------------
mostrar_menu() {
  clear
  echo "=================================================="
  echo "       MENÚ UNIFICADO DE INSTALACIÓN - UBUNTU     "
  echo "=================================================="
  echo " 1) Instalar Firefox (con extensiones)"
  echo " 2) Instalar LibreOffice"
  echo " 3) Instalar Terminal (Ptyxis)"
  echo " 4) Instalar GNS3"
  echo " 5) Instalar Navegadores (Brave y Chromium)"
  echo " 6) Instalar VirtualBox"
  echo " 7) Instalar TODO (Todas las opciones anteriores)"
  echo " 8) Salir"
  echo "=================================================="
}

main() {
  if [[ $EUID -eq 0 && -z "${SUDO_USER:-}" ]]; then
    echo "[ERROR] No ejecutes este script directamente como root puro. Úsalo con tu usuario normal."
    exit 1
  fi

  while true; do
    mostrar_menu
    read -rp "Selecciona una opción [1-8]: " opcion
    echo ""

    case "$opcion" in
      1)
        instalar_firefox
        read -rp "Presiona [Enter] para continuar..."
        ;;
      2)
        instalar_libreoffice
        read -rp "Presiona [Enter] para continuar..."
        ;;
      3)
        instalar_terminal
        read -rp "Presiona [Enter] para continuar..."
        ;;
      4)
        instalar_gns3
        read -rp "Presiona [Enter] para continuar..."
        ;;
      5)
        instalar_navegadores
        read -rp "Presiona [Enter] para continuar..."
        ;;
      6)
        instalar_virtualbox
        read -rp "Presiona [Enter] para continuar..."
        ;;
      7)
        instalar_todo
        read -rp "Presiona [Enter] para continuar..."
        ;;
      8)
        echo "¡Saliendo del instalador. Hasta luego!"
        exit 0
        ;;
      *)
        echo "[ERROR] Opción inválida. Por favor, elige un número entre 1 y 8."
        sleep 2
        ;;
    esac
  done
}

main "$@"
