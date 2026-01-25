// calculator
function calculate(){
    var x = document.getElementById( "op1" );
    var y = document.getElementById( "op2" );
    console.log( parseFloat(x.value) ); 
    console.log( parseFloat(y.value) );
    var z = document.getElementById( "res" );
    z.value = parseFloat(x.value) + parseFloat(y.value);
    console.log(z.value);
}