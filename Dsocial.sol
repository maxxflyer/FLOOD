pragma solidity ^0.4.2;

contract Dsocial{
address public owner;
Pretorian Pretorivs;
address public controller;

mapping(address => mapping(uint => string))public socialInfo;
mapping(uint => string)public infosLabels;

mapping(address => mapping(uint => uint))public socialQuantity; 
mapping(uint => string)public quantityLabels;

mapping(address => mapping(uint => bool))public socialCheck;
mapping(uint => string)public boolsLabels;

function Dsocial(address p){owner=msg.sender;Pretorivs=Pretorian(p);}

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

function setLabel(uint labeltype,uint labelindex,string label)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(labeltype==100){infosLabels[labelindex]=label;}
if(labeltype==101){quantityLabels[labelindex]=label;}
if(labeltype==102){boolsLabels[labelindex]=label;}
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
