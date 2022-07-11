pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals
template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  
   signal output c;  

   // Constraints.  
   c <== a * b;  
}

template Multiplier3 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal input c;
   signal output d;  
   // We have to define multiplier3 out of two multiplier 2:
   component mult1 = Multiplier2();
   component mult2 = Multiplier2();
  


   // Constraints.
   //We assign the mult1 to be a*b
   mult1.a <== a;
   mult1.b <== b;
   //Then we use the second multiplier to do ab*c thanks to mult1 output
   mult2.a <== mult1.c;
   mult2.b <== c;
   //Finally we retrieve the multiplier3 output signal
   d <== mult2.c;
}

component main = Multiplier3();