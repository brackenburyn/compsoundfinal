//test.ck



//HID
Hid hi;
HidMsg msg;

0 => int device;
if( !hi.openKeyboard( device ) ) me.exit();
<<< "r e a d y b o i s" >>>;

0 => int start;
while(start == 0){
    hi => now;
    while( hi.recv( msg) ){
        if( msg.isButtonDown() ){
            <<< msg.which >>>;
            1 +=> start;
        }
    }
}

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
        if(mmsg.data1 == 176 && mmsg.data3 == 0){1 +=> cont;}
    }
}