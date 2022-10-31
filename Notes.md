In general terms, the PCB industry considers an RF circuit board to be any high
frequency PCB that operates above 100MHz.

IRF510 - The device dissipates 43 watts so as long as the kit doesn't draw more
that about 3.5 amps max at 12 volts, it won't fail. At 5 watts and 50%
efficiency it won't draw more than 1 amp and  can handle full reflected SWR.

https://www.rapidonline.com/Catalogue/Search?Query=CDIL

LED Wemos D1 Mini - The built-in led is on pin D4, and it is inverted.

```
Z=Vcc2 / 2PO
In [7]: (22 * 22) / (2 * 5)
Out[7]: 48.4
```

```
[dhiru@zippy DS1054Z_screen_capture]$ python2 OscScreenGrabLAN.py png 192.168.1.16
Instrument ID: RIGOL TECHNOLOGIES,DS1054Z,DS1ZA203916662,00.04.04.SP3

Receiving screen capture...
Saved file: 'captures/DS1054Z_DS1ZA203916662_2021-09-21_18.23.17.png'
```

From the internet,

7805 -> Without an extra heatsink, you can burn off up to 2W. If you need more
current heatsinks are cheap and effective. Every 11 degrees Celsius cooler you
run your semiconductors, reliability doubles.

- Get the max die temperature from the regulator datasheet

- Get the Theta(j-a) number from the datasheet in degrees C per watt.

- Calculate the power dissipated by your device. Example: 9 volts in, 5 volts
  out at 1 amp would be 4 watts.

- Multiply the watts dissipated by Theta(j-a) to get the temperature rise.

- Add the temperature rise to the maximum ambient temperature the device will
  be exposed to.

- If the number computed in #5 is greater than the max die temperature, then
  you need to use a heatsink or some other way to actively
  cool the device.

- If you use a heatsink, you will use a slightly different set of calculations
  involving the regulator's Theta(j-c) (Not Theta(j-a).

For a 7805 it's 65 C/W junction to air.

This means that if the regulator produces 1 W of heat, the die will be 65
degrees C hotter than the ambient air.  The maximum operating temperature is
125 C. Pune temperature (inside the case) -> 70 c.

Can dissipate -> (125 - 70) / 65 -> 0.84 watts. P = VI. This allows around
100mA of current when input voltage is 14v.

Note: Try the `Small mark` option instead of the regular `Real drill` option in
KiCad.

Note 2: Set track width to >= 2.2mm in KiCad - try to work with this. For the
copper pour, set clearance to 0.850.

...

LTspice notes:

- Download LTspice (Google "Download LTspice"). It's free.

- `~/Documents/LTspiceXVII/lib`

  Extract external components to this path.

- Extract the `contents` of `LTspiceXVII_2019Jan29.zip` (Google for this file) properly to `~/Documents/LTspiceXVII` path.

...

From Daniel Alonso:

A unnecessarily large L doesn't do harm by itself, but the 'series' self
resonant frequencies decrease when you increase the turns count. A
rule-of-thumb is choosing an inductive reactance of 4 times the load
resistance, at the lower frequency. Supposing the circuit is to drive a 50 ohm
load, to get a reactance of 200 ohms at 3.5MHz you will need L = 200/(2*pi*3.5)
= 9.1uH. Or if you are more conservative with 10 times the R, it should be
22.7uH.

From Sandeep Lohia:

Inductive reactance on primary side is critical and the magic number is `36`.

```
36 ÷ lowest operating frequency.
36 ÷ 7 = 5 uh
```

Inductance on secondary not critical but turns ratio is...

...

From Farhan:

At 25 watts, the RF peak voltage is 50v. This is easily handled by the regular
disc ceramics rated for 60v. Higher power will require expensive capacitors.

Pinout helper:

1 2 3 4
E B C E

BD139
B C E

NTE-224 results with BS170 driver:

- 4W @ 7 MHz
- 1.6W+ @ 14 MHz
- 0.8W @ 28 MHz

NTE-224 is usable, and offers OK'ish performance for the price (0.23 USD).

The IRF510 option is much better at this price point (with higher voltages
though).

Learnings `http://pa0o-jaap.blogspot.com`:

- http://pa0o-jaap.blogspot.com/2017/03/u3s-5w-pa.html
- http://pa0o-jaap.blogspot.com/2017/04/u3s-ultimate3-5w.html

- The QRP-LABS IRF510 5W PA will not deliver more then 1W at 28MHz not to speak
  of 50 MHz where it is an attenuator. Using the RD15HVF1 Mitsubishi did bring
  just a little more. 3-4 W at 28 and 1.5 W at 50MHz.

- The 5W-PA (RD15HVF1 powered) is good for 10MHz and lower but very
  disappointing at higher bands.

- At 20W DC input it stays cool.

- Turning up the bias seems the only way to get 5W out at 50MHz 12V.

- Use 7 turns (instead of 10) on the output transformer.

- Use 1:9 output transformer instead of my bifilar one!?

- T1 modified to 8 turns (from 10 turns originally) also did not increase the
  10 and 6 output.

- The signal from the U3S straight from the Si5351 needs to be filtered before
  it drives the RD15 and after the 5W-PA again.


PDX-v2 PA (`HF-PA-Combined`):

3.3W+ @ 13.8v @ 21 MHz. 4.25v gate bias. 13.65W DC IN. RF meter shows ~4W.

...


2023 Updates:

Results of 28 MHz HF IRF510 powered amplifier in Class A with Idq  == 41 mA:

- 1W drive @ 29v PA voltage works great for IRF510. 6W+.

- 0.5W drive @ 29v is also ok'ish. Produces 5W+. After LPF perhaps ~4W.

- 250mW drive @ 29v is also decent. Produces 3W+. Perhaps 2W after LPF.

Note: We get 400mW from 2SK3475 driver @ 7 MHz.

2SK driver @ 12v produces enough output to drive IRF510 in Class 'A' even at 28
MHz. 9v @ 2SK drain works too.

2SK driver consumes 1.7W at 12v. ~130mA current.

...

RD15HVF1 @ 20v drain in Class 'A' @ 28 MHz. Gate bias of 4.04v which produces
Idq of around 290 mA. Note: Current consumption remains below 600mA it seems!
Consumes around 8W DC, and produces around of ~5W power (before LPF). Probably
around 4W with LPF attached. 47.2 Vpp on scope.

Around 1.5W @ 12v drain. The `maximum safe voltage` for RD15HVF1 is 15.2v based
on the reading of the datasheet.

No input or output matching done. Just 47uH drain choke (using SMD inductor) which
is also too much inductance!

Heat is very manageable barring the IRF510 case @ 30v drain which consumes 20W
DC IN!

With 20v drain, Idq == 395mA, and ~250mW gate drive, we get ~5W on the power
meter and 54Vpp on scope.

With 20v drain, Idq == low 10mA, and ~250mW gate drive, we get 4.2W+ on the
power meter.

[NEW] With 20v drain, Idq == low 2mA, and ~125mW gate drive (total attenuation
of 3 dB + 6 dB + 3 dB with 2W RF input from Alinco DX-10), we get 4.2W+ on the
power meter.

Learning: For RD15 @ 28 MHz, a gate drive of 125mW is plenty fine!

With 17v drain, Idq == low 10mA, and ~250mW gate drive, we get 3W+ on the power
meter and 40Vpp on scope.

With 15v drain, Idq == low 10mA, and ~250mW gate drive, we get 2.3W+ on the
power meter (safest combination probably).

With higher gate driver (500mW), there is a chance that RD15HVF1 may
auto-oscillate after a TX cycle is complete (and there is no more any external
RF excitation at gate)! More gate drive isn't better, and does NOT increase the
RF output power.

[June-2013] Current proposed TX chain -> Si5351 -> Band specific LPF -> 2SK3475
driver -> Band specific output LPF -> RD15HVF1 operating in Class A with 15v to
20v drain. For SWR protection, we will be doing current-consumption-monitoring
using INA219.

...

AFT09MS015N with 20v drain voltage produces 4W @ 28 MHz with ~250mW of gate
drive (from Alinco DX-10). No gate resistor used nor required (it seems). Class
'C' operation. With 17v at drain, we get 3W RF OUTPUT. Simple RFC of 3R3 or 4R7
value - no matching at output.

Can we get better results @ 17v drain when operating in Class 'A'? Nope - No
improvement found in the amount of RF power output!

...

Learning: We may need a strong LPF after the 74ACT244N based 250mW PA!

...

[July 2023] RD16HHF1 @ 15.2v drain in Class 'A' @ 28 MHz. Gate bias which
produces Idq of around 20 mA. Note: Current consumption remains around 500mA
it seems! Consumes around 7.6W DC, and produces around of ~5W power (before
LPF). Probably around 4W with LPF attached. Learning: Input drive matters too!
I had to slightly increase the power output from Alinco DX-10 (running into 6dB
attenuator) to get these results. I used LC matching at the output side too.

[Another July 2023 update] With LC matching at output (100nH + 200pF), we can
easily get around 8W RF output @ 28 MHz at 13.8 drain voltage with around 13W
DC IN! Crazy improvement - thanks to Sandeep Lohia for the tutorial on LC
matching.

Other results:

With 250mW from https://github.com/kholia/Easy-Beacons-STEM project, we get 6W
output @ 7MHz @ 13.8 drain, despite the LC match being calculated for 28 MHz ;)

With 250mW from https://github.com/kholia/Easy-Beacons-STEM project, we get ~9W
output @ 28MHz @ 13.8 drain and 7W even @ 10v drain!

Gate bias was around 3.3v with Idq of very few milliamps.
