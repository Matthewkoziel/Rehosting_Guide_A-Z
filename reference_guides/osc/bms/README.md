# Understanding Basic Map Support (BMS) Files

* DFHMSD - Declares a mapset

Below are the keywords that can be specified for the DFHMSD macro command

```
COLOR
  - specifies the basic color for the mapset. Users can choose one of the following: 
      DEFAULT, BLUE, RED, PINK, GREEN, TURGOISE, YELLOW, or NEUTRAL
  - COLOR for DFHMDF or DFHMDI is already set; the color set for DFHMSD has the lowest priority.
```  

```
CTRL
  - Sets characterstics of all maps included in mapsets.
  - One of the following options can be entered
    - PRINT: Prints transferred map data
    - LENGTH: Sets the maximum number of characters for a row transferred to a printer.
    - FREEKB: Releases the keyboard lock when transferring maps.
    - ALARM: Sends an alarm if an alarm is sent to the TN3270 terminal.
    - FRSET: Resets the MDT bits of all fiends including in maps when transferring maps.
```

* DFHMDI - Declares a map

* DFHMDF - Declares a field