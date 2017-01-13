//sound chain
SndBuf ting => JCRev tingrev => Pan2 tingpan => dac;
SndBuf snare => JCRev snarerev => Pan2 snarepan => dac;
SndBuf kick => JCRev kickrev => Pan2 kickpan => dac;
SndBuf pkengo => NRev pkengorev => dac;
Moog s1 => NRev s1r => dac;
Wurley s2 => dac;
HevyMetl s3 => dac;
Rhodey s4 => Pan2 s4p => dac;
Bowed s5 => LPF s5f => PRCRev s5r => Pan2 s5p => dac;
BlowBotl e1 => NRev e1r => LPF e1f => dac;
TubeBell b1 => JCRev b1r => BiQuad b1f =>  Pan2 b1p => dac;
TriOsc build => dac;


me.dir() + "ting.aiff" => ting.read;
me.dir() + "hat.wav" => snare.read;
me.dir() + "boos.aiff" => kick.read;
me.dir() + "pkango.aiff" => pkengo.read;

ting.samples() => ting.pos;
snare.samples() => snare.pos;
kick.samples() => kick.pos;
pkengo.samples() => pkengo.pos;

.05 => tingrev.mix;
.1 => snarerev.mix;
.1 => kickrev.mix;
.1 => s5r.mix;
.2 => s1r.mix;
1 => pkengorev.mix;

2000 => e1f.freq;
700 => s5f.freq;

.7 => ting.gain;
.3 => snare.gain;
.3 => kick.gain;
0 => build.gain;

-.3 => tingpan.pan;
.2 => snarepan.pan;
.05 => kickpan.pan;
-.1 => b1p.pan;
.3 => s4p.pan;
-.1 => s5p.pan;

275::ms => dur ei;

Std.mtof(33) => float A1;
Std.mtof(38) => float D2;
Std.mtof(39) => float Eb2;
Std.mtof(40) => float E2;
Std.mtof(41) => float F2;
Std.mtof(42) => float Gb2;
Std.mtof(43) => float G2;
Std.mtof(44) => float Ab2;
Std.mtof(45) => float A2;
Std.mtof(47) => float B2;
Std.mtof(48) => float C3;
Std.mtof(49) => float Db3;
Std.mtof(50) => float D3;
Std.mtof(51) => float Eb3;
Std.mtof(52) => float E3;
Std.mtof(53) => float F3;
Std.mtof(54) => float Gb3;
Std.mtof(55) => float G3;
Std.mtof(56) => float Ab3;
Std.mtof(57) => float A3;
Std.mtof(59) => float B3;
Std.mtof(60) => float C4;

fun void offbeat(float vel){
    A2 => b1.freq;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    E2 => b1.freq;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
    vel => b1.noteOn;
    ei * 4 => now;
    0 => ting.pos;
    ei * 4 => now;
}


fun void blow(float vel, int var, int drop){
    A3 => e1.freq;
    vel => e1.noteOn;
    ei * 4 => now;
    A3-var => e1.freq;
    ei * 4 => now;
    A3 => e1.freq;
    ei * 4 => now;
    A3+var => e1.freq;
    ei * 4 => now;
    A3 => e1.freq;
    ei * 4 => now;
    A3-var => e1.freq;
    ei * 4 => now;
    A3 => e1.freq;
    if(drop == 1){vel*.85 => e1.noteOn;}
    ei * 4 => now;
    if(drop == 1){vel*.65 => e1.noteOn;}
    A3+var => e1.freq;
    ei * 2 => now;
    if(drop == 1){vel*.4 => e1.noteOn;}
    ei * 2 => now;
    vel => e1.noteOff;
}

fun void melody(float vel){
    ei * 4 => now;
    A3 => s4.freq;
    vel => s4.noteOn;
    ei * 6 => now;
    G3 => s4.freq;
    vel => s4.noteOn;
    ei * 2 => now;
    F3 => s4.freq;
    vel => s4.noteOn;
    ei * 6 => now;
    E3 => s4.freq;
    vel => s4.noteOn;
    ei * 2 => now;
    D3 => s4.freq;
    vel => s4.noteOn;
    ei * 8 => now;
    vel => s4.noteOn;
    ei * 4 => now;
    ei * 4 => now;
    A2 => s4.freq;
    vel+.1 => s4.noteOn;
    ei * 6 => now;
    G2 => s4.freq;
    vel+.1 => s4.noteOn;
    ei * 2 => now;
    F2 => s4.freq;
    vel+.1 => s4.noteOn;
    ei * 6 => now;
    E2 => s4.freq;
    vel+.1 => s4.noteOn;
    ei * 2 => now;
    D2 => s4.freq;
    vel+.1 => s4.noteOn;
    ei * 8 => now;
    vel+.1 => s4.noteOn;
    ei * 4 => now;
    vel+.1 => s4.noteOff;
}


fun void banded(float vel){
    E3 => s5.freq;
    vel-.1 => s5.noteOn;
    ei * 8 => now;
    A3 => s5.freq;
    vel-.1 => s5.noteOn;
    ei * 8 => now;
    G3 => s5.freq;
    vel-.1 => s5.noteOn;
    ei * 8 => now;
    D3 => s5.freq;
    vel-.1 => s5.noteOn;
    ei * 8 => now;
    E3 => s5.freq;
    vel => s5.noteOn;
    ei * 8 => now;
    A3 => s5.freq;
    vel => s5.noteOn;
    ei * 8 => now;
    G3 => s5.freq;
    vel => s5.noteOn;
    ei * 8 => now;
    D3 => s5.freq;
    vel => s5.noteOn;
    ei * 8 => now;
}


fun void down(float vel1, float vel2, float vel3){
    E3 => s1.freq;
    E3 * 2 => build.freq;
    A3 => s2.freq;
    C4 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 1 => now;
    G2/2 => b1.freq;
    vel2*1.5 => b1.noteOn;
    ei * 1 => now;
    Ab2/2 => b1.freq;
    vel2*1.5 => b1.noteOn;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 1 => now;
    G2/2 => b1.freq;
    vel2*1.5 => b1.noteOn;
    ei * 1 => now;
    Gb2/2 => b1.freq;
    vel2*1.5 => b1.noteOn;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel2*2 => b1.noteOff;
    F3 => s1.freq;
    F3 * 2 => build.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    E3 => s1.freq;
    E3 * 2 => build.freq;
    Ab3 => s2.freq;
    B3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    Eb3 => s1.freq;
    Eb3 * 2 => build.freq;
    Eb2/2 => b1.freq;
    Gb3 => s2.freq;
    A3 => s3.freq;
    vel2*1.5 => b1.noteOn;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    D3 => s1.freq;
    D2/2 => b1.freq;
    D3 * 2 => build.freq;
    F3 => s2.freq;
    Ab3 => s3.freq;
    vel2 * 1.5 => b1.noteOn;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    C3 => s1.freq;
    C3 * 2 => build.freq;
    E3 => s2.freq;
    A3 => s3.freq;
    vel2 * 2 => b1.noteOff;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 2 => now;
    A1 => s1.freq;
    0 => build.gain;
    vel1 => s1.noteOn;
    ei * 2 => now;
    ei * 2 => now;
    vel1 => s1.noteOff;
    vel2 => s2.noteOff;
    vel3 => s3.noteOff;
}



fun void buildup(){
    0 => float buildgain;
    for( 0 => int index; index < 128; index ++){
        buildgain => build.gain;
        (index*2) + 100 => build.freq;
        .002 +=> buildgain;
        ei / 4 => now;
    }
}


fun void end(float vel1, float vel2, float vel3){
    //146
    A2 => s1.freq;
    D3 => s2.freq;
    Gb3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 6 => now;
    //135
    A2 => s1.freq;
    Db3 => s2.freq;
    E3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 6 => now;
    //725
    Ab2 => s1.freq;
    B2 => s2.freq;
    E3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 6 => now;
    //136
    A2 => s1.freq;
    Db3 => s2.freq;
    Gb3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * 6 => now;
}

fun void perc(){
    0 => kick.pos;
    ei * 3 => now;
    0 => snare.pos; 
    ei * 5 => now;
    0 => kick.pos;
    ei * 1 => now;
    0 => snare.pos;
    ei * 3 => now; 
}


fun void perc2(){
    0 => kick.pos;
    ei * 3 => now;
    0 => snare.pos; 
    ei * 3 => now;
    0 => kick.pos;
    ei * 1 => now;
    0 => snare.pos;
    ei * 2 => now; 
}


fun void end2(float vel1, float vel2, float vel3, int mes1, 
int mes2, float mes3, float mes4){
    //146
    A2 => s1.freq;
    D3 => s2.freq;
    Gb3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * mes1 => now;
    //135
    A2 => s1.freq;
    Db3 => s2.freq;
    E3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * mes2 => now;
    //725
    Ab2 => s1.freq;
    B2 => s2.freq;
    E3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * mes3 => now;
    //136
    A2 => s1.freq;
    Db3 => s2.freq;
    Gb3 => s3.freq;
    vel1 => s1.noteOn;
    vel2 => s2.noteOn;
    vel3 => s3.noteOn;
    ei * mes4 => now;
}


fun void endperc(){
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
    ei * 2 / 3 => now;
    0 => snare.pos;
    ei * 2 / 3 => now;
}



//HID
Hid hi;
HidMsg msg;

0 => int device;
if( !hi.openKeyboard( device ) ) me.exit();
<<< "r e a d y b o i s" >>>;

0 => int start;
while(start == 0){
    A3 => e1.freq;
    .2 => e1.noteOn;
    hi => now;
    while( hi.recv( msg) ){
        if( msg.isButtonDown() ){
            <<< msg.which >>>;
            1 +=> start;
        }
    }
}

spork ~ offbeat(.4);
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ offbeat(.4);
spork ~ melody(.2);
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ offbeat(.4);
spork ~ melody(.2);
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ offbeat(.4);
spork ~ melody(.2);
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ offbeat(.4);
spork ~ melody(.2);
spork ~ blow(.2, 6, 0);
spork ~ banded(1);
ei * 32 => now;
spork ~ blow(.2, 6, 1);
spork ~ buildup();
ei * 32 => now;

spork ~ down(.3, .6, .4);
4000 => pkengo.pos;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
1 => s5.noteOff;
spork ~ blow(.2, 6, 0);
ei * 32 => now;
spork ~ blow(.1, 6, 0);
ei * 32 => now;

// number of the device to open (see: chuck --probe)
0 => int device2;

// the midi event
MidiIn min;
// the message for retrieving data
MidiMsg mmsg;

// open the device
if( !min.open( device2 ) ) me.exit();
// print out device that was opened
<<< "MIDI device:", min.num(), " -> ", min.name() >>>;

0 => int cont;
while( cont == 0 )
{
    // wait on the event 'min'
    min => now;
    // get the message(s)
    while( min.recv(mmsg) )
    {
        // print out midi message
        <<< mmsg.data1, mmsg.data2, mmsg.data3 >>>;
        if(mmsg.data1 == 176){1 +=> cont;}
    }
}

spork ~ end(.2, .6, .4);
spork ~ perc();
ei * 12 => now;
spork ~ perc();
ei * 12 => now;
spork ~ end(.2, .6, .4);
spork ~ perc();
ei * 12 => now;
spork ~ perc();
ei * 12 => now;
spork ~ end(.2, .6, .4);
spork ~ perc();
ei * 12 => now;
spork ~ perc();
ei * 12 => now;
spork ~ end(.2, .6, .4);
spork ~ perc();
ei * 12 => now;
spork ~ perc();
ei * 12 => now;
spork ~ end2(.5, .6, .4, 3, 6, 3, 6);
spork ~ perc2();
ei * 9 => now;
spork ~ perc2();
ei * 9 => now; 
spork ~ end2(.5, .6, .4, 6, 6, 3, 6); 
spork ~ perc();
ei * 12 => now;
spork ~ perc2();
ei * 9 => now;
spork ~ end(.5, .6, .4);
spork ~ perc();
ei * 12 => now;
spork ~ perc();
ei * 12 => now;
spork ~ end2(.5, .6, .4, 3, 6, 16, 0);
spork ~ perc2();
ei * 9 => now;
spork ~ endperc();
ei * 16 => now;
.5 => s1.noteOff;
.6 => s2.noteOff;
.4 => s3.noteOff;
ei * 4 => now;

