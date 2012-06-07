include Java
import java.awt.TrayIcon
import java.awt.Toolkit
import java.net.InetAddress
import java.awt.datatransfer.StringSelection;

#Menu Items
exitItem = java.awt.MenuItem.new("Exit")
copyItem = java.awt.MenuItem.new("Copy")

ipAddress = java.net.InetAddress.getLocalHost().getHostAddress()
ipItem = java.awt.MenuItem.new(ipAddress)

def copyIpAddress(ipAddress)
  clipboard = java.awt.Toolkit.getDefaultToolkit().getSystemClipboard()
  newContents = java.awt.datatransfer.StringSelection.new(ipAddress)
  clipboard.setContents(newContents, nil)
end

# Event handling
exitItem.add_action_listener{ java.lang.System::exit(0) }
copyItem.add_action_listener { copyIpAddress(ipAddress) }

# PopUp Menu
popup = java.awt.PopupMenu.new
popup.add(ipItem)
popup.add(copyItem)
popup.add(exitItem)



image = java.awt.Toolkit::default_toolkit.get_image("ip-icon.png")
trayIcon = TrayIcon.new(image, ipAddress, popup)
trayIcon.image_auto_size = true

tray = java.awt.SystemTray::system_tray
tray.add(trayIcon)