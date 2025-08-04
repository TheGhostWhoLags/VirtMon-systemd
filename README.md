# 🖥️ VirtMon  
**Spawn a VNC-powered virtual monitor in Hyprland (Linux)**  
Use any device — old laptop, Raspberry Pi, tablet — as a second screen for your Wayland desktop!

---

## 📋 Features
- Creates a **headless virtual monitor** in Hyprland
- Shares the virtual monitor over **VNC**
- Works with **any VNC viewer** on any platform
- Great for **multi-PC setups** or **repurposing old hardware**

---

## 🛠️ Instructions

1. **Configure Hyprland**
   - Edit your `hyprland.conf` and define a new monitor (e.g. `HEADLESS-1`)
   - Set resolution to match the remote screen (recommended)

   Example:
   ```ini
   monitor=HEADLESS-1,1920x1080@60,0x0,1
   ```

2. **Edit `virtmon.sh` and `virtmon.service`**
   - Adjust values in the `# CONFIG` section (monitor name, resolution, etc.)
   - Change `/home/user` to your home folder location in `ExecStart` and `ExecStartPost` 

3. **Install dependencies**
   ```bash
   sudo pacman -S wayvnc
   ```

4. **Find your LAN IP**
   ```bash
   ip a | grep inet
   ```

5. **Install the scripts**
   - Copy the files to `~/.config/systemd/user/`
   - Enable and the systemd socket to start automatically on boot
   ```bash
   systemd --user enable virtmon.socket
   ```
   - Start the systemd socket
   ```bash
   systemd --user start virtmon.socket
   ```

7. **Connect from another PC**
   - Open a VNC viewer (RealVNC, TigerVNC, etc.)
   - Enter IP address shown in terminal
   - The virtual monitor and VNC server will be created when the client attempts to connect
   - Set it to full-screen
   - The VNC server and virtual screen will close on disconnect

---

## 💡 Extra Ideas

- 🧠 Use an old laptop as a **wireless second screen**
- 🍓 Raspberry Pi works great as a **cheap thin-client**
- 📱 Even a **tablet or smartphone** with a VNC viewer app can be used as an external display

---

## 🧪 Tested on

- Arch Linux
- Hyprland v0.49.0
- NVIDIA proprietary drivers v575
- WayVNC 0.9.1

---

## 🧵 License

This project is licensed under the MIT License.
