#!bin/sh

# install secure boot ctl:
sudo pacman -S sbctl

## check status:
sudo sbctl status
## should display: ##
# installed: sbctl is not installed
# setub mode: enabled
# secure boot: disabled

sudo systemctl reboot --firmware-setup

# create the keys
sudo sbctl create-keys

# add microsoft-windows signatures
sudo sbctl enroll-keys -m

# signing key to bootloader (systemd)
# sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi

# signing key to bootloader (GRUB)
sudo sbctl sign -s -o /boot/efi/EFI/Archlinux/grubx64.efi.signed /boot/efi/EFI/Archlinux/grubx64.efi

# replace old unsigned with new signed
sudo mv /boot/efi/EFI/Archlinux/grubx64.efi /boot/efi/EFI/Archlinux/grubx64.efi.unsigned-backup
sudo mv /boot/efi/EFI/Archlinux/grubx64.efi.signed /boot/efi/EFI/Archlinux/grubx64.efi

# signing the key to kernel (grub)
sudo sbctl sign -s -o /boot/vmlinuz-linux.signed /boot/vmlinuz-linux

sudo mv /boot/vmlinuz-linux /boot/vmlinuz-linux.unsigned-backup
sudo mv /boot/vmlinuz-linux.signed /boot/vmlinuz-linux

# to know where is the linux kernel image:
cat /etc/mkinitcpio.d/linux.preset
# ALL_kver for grub (older setups)
# default_uki for systemd

# signing the key to kernel (systemd)
# sudo sbctl sign -s /efi/EFI/Linux/arch-linux.efi

# install bootloader (systemd)
# sudo bootctl install

# install bootloader (grub)
# maybe
#sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Archlinux
#sudo grub-mkconfig -o /boot/grub/grub.cfg
#sudo grub-install

# Regenerate initramfs images based on all existing presets
sudo mkinitcpio -P

sudo sbctl verify

reboot
