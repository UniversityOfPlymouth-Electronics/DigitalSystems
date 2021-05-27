

# Trouble Shooting

## Cannot program the FPGA

Check device manager you have installed the Byte Blaster driver and that it has installed correctly.

* Right-Click your Windows button
* Select Device Manager
* Check the Altera USB-Blaster appears under "Universal Serial Bus controller"

<img src="../../../img/byte_blaster.jpg" width="150px">

If not, then the device driver either has not been installed or it failed to install.

> There has been one issue whereby the driver packaged with Quartus was signed with a certificate that had expired. In this case, an older classic driver can be acquired from Terasic [using this link](http://www.terasic.com.tw/wiki/Altera_USB_Blaster_Driver_Installation_Instructions#Driver).


