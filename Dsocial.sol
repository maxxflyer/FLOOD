pragma solidity ^0.4.2;

contract Dsocial{
address owner;
Pretorian Pretorivs;
address controller;

mapping(address => bool)public freeWallets;

mapping(address => mapping(uint => string))public socialInfo;
mapping(uint => string)public infosLabels;

mapping(address => mapping(uint => uint))public socialQuantity; 
mapping(uint => string)public quantityLabels;

mapping(address => mapping(uint => bool))public socialCheck;
mapping(uint => string)public boolsLabels;

mapping(address => mapping(uint => string))public social1;
mapping(uint => string)public social1Labels;

mapping(address => mapping(uint => string))public social2;
mapping(uint => string)public social2Labels;

mapping(address => mapping(uint => string))public social3;
mapping(uint => string)public social3Labels;

mapping(address => mapping(uint => string))public social4;
mapping(uint => string)public social4Labels;

mapping(address => mapping(uint => string))public social5;
mapping(uint => string)public social5Labels;

mapping(address => mapping(uint => string))public social6;
mapping(uint => string)public social6Labels;

mapping(address => mapping(uint => string))public social7;
mapping(uint => string)public social7Labels;

mapping(address => mapping(uint => string))public social8;
mapping(uint => string)public social8Labels;

function Dsocial(address p){owner=msg.sender;Pretorivs=Pretorian(p);}

function addWallet(){
freeWallets[msg.sender]=true;
}

function removeWallet(){
freeWallets[msg.sender]=false;
}

function addInfo(address coin,uint index,string info){
if((msg.sender!=Pretorivs.coins_owner(coin))&&(msg.sender!=controller))throw;
socialInfo[coin][index]=info;
}

function addQuantity(address coin,uint index,uint quant){
if((msg.sender!=Pretorivs.coins_owner(coin))&&(msg.sender!=controller))throw;
socialQuantity[coin][index]=quant;
}

function addCheck(address coin,uint index,bool check){
if((msg.sender!=Pretorivs.coins_owner(coin))&&(msg.sender!=controller))throw;
socialCheck[coin][index]=check;
}

function readInfo(address coin,uint index)constant returns (string,string){
return (socialInfo[coin][index],infosLabels[index]);
}

function readQuantity(address coin,uint index)constant returns (uint,string){
return (socialQuantity[coin][index],quantityLabels[index]);
}

function readCheck(address coin,uint index)constant returns (bool,string){
return (socialCheck[coin][index],boolsLabels[index]);
}


function readSocial1(address coin,uint index)constant returns (string,string){
return (social1[coin][index],social1Labels[index]);
}
function readSocial2(address coin,uint index)constant returns (string,string){
return (social2[coin][index],social2Labels[index]);
}

function readSocial3(address coin,uint index)constant returns (string,string){
return (social3[coin][index],social3Labels[index]);
}

function readSocial4(address coin,uint index)constant returns (string,string){
return (social4[coin][index],social4Labels[index]);
}

function readSocial5(address coin,uint index)constant returns (string,string){
return (social5[coin][index],social5Labels[index]);
}

function readSocial6(address coin,uint index)constant returns (string,string){
return (social6[coin][index],social6Labels[index]);
}

function readSocial7(address coin,uint index)constant returns (string,string){
return (social7[coin][index],social7Labels[index]);
}

function readSocial8(address coin,uint index)constant returns (string,string){
return (social8[coin][index],social8Labels[index]);
}

function setLabel(uint labeltype,uint labelindex,string label)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(labeltype==100){infosLabels[labelindex]=label;}
if(labeltype==101){quantityLabels[labelindex]=label;}
if(labeltype==102){boolsLabels[labelindex]=label;}
if(labeltype==1){social1Labels[labelindex]=label;}
if(labeltype==2){social2Labels[labelindex]=label;}
if(labeltype==3){social3Labels[labelindex]=label;}
if(labeltype==4){social4Labels[labelindex]=label;}
if(labeltype==5){social5Labels[labelindex]=label;}
if(labeltype==6){social6Labels[labelindex]=label;}
if(labeltype==7){social7Labels[labelindex]=label;}
if(labeltype==8){social8Labels[labelindex]=label;}
return true;
}

function setOwner(address o)returns(bool){
if(msg.sender!=owner)throw;
owner=o;
return true;
}

function setController(address c)returns(bool){
if(msg.sender!=owner)throw;
controller=c;
return true;
}

}
