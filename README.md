# API_VibraIRM
API written in MATLAB to control VibraIRM, a pneumatic stimulator from TechnoConcept www.technoconcept.fr  
The VibraIRM device uses a chip from FTDI for the communication with the computer.

# Install
After cloning/downloading the repository, add the freshly created _API_VibraIRM_ directory into MATLAB path  

# Exemple
[API_VibraIRM/exemple_script.m](exemple_script.m) is straight forward.  
To open a GUI : `FTDI_VIBRA_IRM.GUI_VIBRA_IRM();`

# Known limitaions
When the communication has been opened with `Open()`, then your script crashed or the object has been deleted, you cannot open another communication. The divice is blocked. Solution : **reboot** (turn off , turn on) the divice with the main button on the front pannel.

# How it works
The repo provide the DLL to communicate with FTDI chip, you shouldn't need to download it. However, maybe you need to install some drivers from FTDI itself : www.ftdichip.com  

# OS
This API is using a DLL, so it is developped for **Windows**.  
Tested on Windows 7, but a user reported it works on Windows 10 also.  

# MATLAB / Octave compatibility
Tested on MATLAB R2011a, it should work for more recent versions. If you encounter problme, please open an Issue.  
The design of the API is based on MATLAB Object Oriented Programming (the "@" directory). This is **NOT** compatible with Ocatve, as far as I know.

