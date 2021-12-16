<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-420,1264,440,1.61051,0,58>
  <Grid=10,10,1>
  <DataSet=Shortcut-LPF.dat>
  <DataDisplay=Shortcut-LPF.dpl>
  <OpenDisplay=1>
  <Script=Shortcut-LPF.m>
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
  <Pac P1 1 380 60 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 380 90 0 0 0 0>
  <GND * 1 490 90 0 0 0 0>
  <L L1 1 560 -20 -26 10 0 0 "260nH" 1 "" 0>
  <GND * 1 630 90 0 0 0 0>
  <Pac P2 1 740 60 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 740 90 0 0 0 0>
  <.SP SP1 1 390 160 0 67 0 0 "log" 1 "3.3MHz" 1 "330MHz" 1 "201" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 610 170 -28 15 0 0 "dBS21=dB(S[2,1])" 1 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <C C1 1 490 60 17 -26 0 1 "220pF" 1 "" 0 "neutral" 0>
  <C C2 1 630 60 17 -26 0 1 "220pF" 1 "" 0 "neutral" 0>
</Components>
<Wires>
  <380 -20 380 30 "" 0 0 0 "">
  <380 -20 490 -20 "" 0 0 0 "">
  <490 -20 490 30 "" 0 0 0 "">
  <630 -20 630 30 "" 0 0 0 "">
  <490 -20 530 -20 "" 0 0 0 "">
  <590 -20 630 -20 "" 0 0 0 "">
  <740 -20 740 30 "" 0 0 0 "">
  <630 -20 740 -20 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 860 -90 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "">
	<"dBS11" #0000ff 0 3 0 0 0>
	<"dBS21" #ff0000 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 720 160 12 #000000 0 "Chebyshev low-pass filter \n 33MHz cutoff, pi-type, \n impedance matching 50 Ohm">
</Paintings>
