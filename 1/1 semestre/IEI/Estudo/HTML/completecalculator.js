var op = "+";
function operation() {
    var e = document.getElementById( "operation" );
    op = e.value
    console.log( "operarion: "+op);
    var opt = document.getElementById( "op-view" );
    opt.innerHTML = op

}

function calculate(){
    var x = document.getElementById( "op1" );
    var y = document.getElementById( "op2" );
    var r = document.getElementById( "res" );
    var valorx = parseFloat(x.value);
    var valory = parseFloat(y.value);
    if ( op =="+"){
        r.value = (valorx+valory)
    } else{
        r.value = (valorx-valory)
    }
}

function move(){
    var e = document.getElementById( "btn" );
    e.style.position = "absolute";
    e.style.top = (Math.random() * window.innerHeight)+"px";
    e.style.left = (Math.random() * window.innerWidth)+"px";
}
    