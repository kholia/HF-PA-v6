<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-360,800,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=Wide-LPF.dat>
  <DataDisplay=Wide-LPF.dpl>
  <OpenDisplay=1>
  <Script=Wide-LPF.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 140 290 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 140 320 0 0 0 0>
  <GND * 1 250 320 0 0 0 0>
  <L L1 1 320 210 -26 10 0 0 "262.5nH" 1 "" 0>
  <GND * 1 390 320 0 0 0 0>
  <Pac P2 1 500 290 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 500 320 0 0 0 0>
  <Eqn Eqn1 1 370 400 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <.SP SP1 1 150 390 0 67 0 0 "log" 1 "3.3MHz" 1 "45MHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <C C1 1 250 290 17 -26 0 1 "220pF" 1 "" 0 "neutral" 0>
  <C C2 1 390 290 17 -26 0 1 "220pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <140 210 140 260 "" 0 0 0 "">
  <140 210 250 210 "" 0 0 0 "">
  <250 210 250 260 "" 0 0 0 "">
  <390 210 390 260 "" 0 0 0 "">
  <250 210 290 210 "" 0 0 0 "">
  <350 210 390 210 "" 0 0 0 "">
  <500 210 500 260 "" 0 0 0 "">
  <390 210 500 210 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 480 390 12 #000000 0 "Chebyshev low-pass filter \n 33MHz cutoff, pi-type, \n impedance matching 50 Ohm">
</Paintings>
