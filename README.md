# JackItNG

_Checkout the genious script this is based on over at [insecurityofthings/jackit](https://github.com/insecurityofthings/jackit)._

## Installation
To use these scripts, you will need a [CrazyRadio PA adapter from Seed Studio](https://www.seeedstudio.com/item_detail.html?p_id=2104). You will also need to flash the firmware of the adapter using [Bastille's MouseJack research tools](https://github.com/RFStorm/mousejack). Please follow their instructions for updating the firmware before continuing.

After installing the firmware, you can install JackItNG via:

```
git clone https://github.com/curiousmaster/JackItNG.git
cd JackItNG
pip install -e .
```

Once your CrazyRadio PA is ready, you can launch JackItNG via:

```
sudo jackit
```

After running jackit, found devices will be stored in an SQLite3 database in the current directory. This file can later on be parsed with the jacklst command.

```
sudo jacklst
```


## Todo
- Add options to select database file
- Enable/disable database usage
- Resuse stored info from database in jackit script

## Who

The initial code was written by phikshun and infamy. The code is all BSD license. All the files in the lib directory were written by Bastille's research team and are GPLv3 license.
