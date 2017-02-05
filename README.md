## Connect PS3 Buzz controllers for OSX

[![Demo](http://img.youtube.com/vi/5eImuf0xK2M/0.jpg)](http://www.youtube.com/watch?v=5eImuf0xK2M "See demo on YouTube")

This repository contains files to connect the wireless PS3 dongle. It uses the hidapi library to connect to the Wbuzz dongle and writes the bytes in order to flash the LEDs. 

I used [Enjoyable](https://yukkurigames.com/enjoyable/) to map all buttons to keyboard keys. 
`Wbuzz.enjoyable` is the mapping you should import.


The `/air` folder contains an Adobe AIR project. This full-screen application shows four teams. Press `SPACE` to reset, hold `ENTER` down to light up all 4 BUZZ-controllers.
Furthermore, this app listens to keyboard input, so if you have Enjoyable running with the mapping, it will detect the Buzz-controller-input. 

This app also uses a _command line application_ to send out the bytes to the buzz-controller to light up the LEDs.
There is a keep-alive timer that sends the bytes every 30 seconds, to prevent them from auto-turning off :)


###Extra: command line application source

I included the source code for the terminal app too:
The `/cmd` folder contains the XCode project which builds the terminal application `buzz` (which for obvious reasons is _already_ located in `/air`, else the AIR-app wouldn't work).

**The executable needs 1 parameter:**

`./buzz all` will light all 4 LEDs up.

`./buzz 0` will turn all 4 LEDs off.

`./buzz 1` will only turn the LED off controller 1 on.

`./buzz 2` will do the same for controller 2.

`./buzz 3` will do the same for controller 3.

`./buzz 4` will do the same for controller 4.


You can see how i used the hidapi library to set the bytes. Although you can also use hidapi also to get the input, for me it was more easier to use Enjoyable and let it map to keyboard events though :)



