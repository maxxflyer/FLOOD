contract ADV{
mapping(address => adv[])public advs;
uint start;

struct ADV{
uint end;
string addr;
}

function Zika(){start=0;}

function addAdv(address a,string s) returns (bool){
adv Tadv=advs[a][0];
if(block.number>Tadv.end){
uint i=start;
for(uint x=start;x<i+1;x++){
Tadv=advs[a][x];
if(block.number>Tadv.end){i++;start++;}
}
}
advs.push({0,0,s});
return true;
}

function getAdv(address a)constant returns (string){
adv Tadv=advs[a][start];
string Ts;
uint i=start;
if(block.number>Tadv.end){
for(uint x=start;x<i+1;x++){
Tadv=advs[a][x];
if(block.number>Tadv.end)i++;
}
}

return Tadv.addr;
}

function removeAdv(){
//effettua chiamata esterna
//individua owner
//se non è owner throw
address a;
if(msg.sender!=a)throw;
start++;
}

function censorAndCover(address a,uint u,string default){
//effettua chiamata esterna
//individua owner
//se non è owner throw
address a;
if(msg.sender!=a)throw;
advs[address][u]=default;
}

}
