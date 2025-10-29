JackedDebug 

A simple, fun project made to audit the integrity of your headphone jack in your workstation and/or your wired headphones.

How to Use:

1) Save as debug-audio.sh

2) Make executable: chmod +x debug-audio.sh

3) Run: ./debug-audio.sh

What It Checks:

1) Sound card detection

2) Headphone/Mic jack presence (via ALSA controls)

3) PulseAudio port availability (available: yes/no)

4) Currently active output

Additional Tools that can be used (possibly incorporating them in an update in the near future or another project):
- Install alsa-tools-gui for hdajackretask (reconfigure jack behavior)
- Run hdajacksensetest to manually trigger jack sensing
- Use pavucontrol for GUI-based output switching

Happy Debugging everyone, cheers!
