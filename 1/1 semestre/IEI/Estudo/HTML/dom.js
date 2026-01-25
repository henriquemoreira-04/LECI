// dom.js
var x = document.getElementById( "op1" );
var y = document.getElementById( "op2" );
console.log(parseFloat(x.value));
console.log(parseFloat(y.value));


function soma(x,y){
    return x+y;
    }
    var res = soma(parseFloat(x.value),parseFloat(y.value));



    document.getElementById( "res" ).value = res;
    console.log(res);