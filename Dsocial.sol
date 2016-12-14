pragma solidity ^0.4.2;
contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }

contract Companion{
address owner;
mapping(address => bool)public TOS; 
function Companion(){owner=msg.sender;}
function acceptTOS(address a,bool b){if(msg.sender==owner)TOS[a]=b;}
}

//controller manager - contiene gli hypercoin accettati senza coinvolgere la privacy
contract ControllerManager{
address[] controllers;
mapping(address => bool)public controllersCheck;
function ControllerManager(){}
function getController(uint contr)constant returns(address){address temp=0x0;if(controllersCheck[controllers[contr]])temp=controllers[contr];return temp;}
function addController(address a,bool b){if(b)controllers.push(a);controllersCheck[a]=b;}
}


//10 social disclaimer
contract Dsocial{
address owner;
Pretorian Pretorivs;
address controller;

mapping(address => mapping(uint => string))public socialInfo;
mapping(uint => string)public infoLabels;

mapping(address => mapping(uint => uint))public socialQuantity; 
mapping(uint => string)public quantityLabels;

mapping(address => mapping(uint => bool))public socialCheck;
mapping(uint => string)public boolLabels;

mapping(address => mapping(uint => address))public socialAddress;
mapping(uint => string)public addressLabels;

mapping(address => mapping(uint => string[]))public socialInfoList;
mapping(uint => string[])public infoListLabels;

mapping(address => mapping(uint => uint[]))public socialQuantityList; 
mapping(uint => string[])public quantityListLabels;

mapping(address => mapping(uint => bool[]))public socialCheckList;
mapping(uint => string[])public boolListLabels;

mapping(address => mapping(uint => address[]))public socialAddressList;
mapping(uint => string[])public addressListLabels;



function Dsocial(address p){owner=msg.sender;Pretorivs=Pretorian(p);}

function addInfo(address addr,uint index,string info){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialInfo[addr][index]=info;
}

function addQuantity(address addr,uint index,uint quant){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialQuantity[addr][index]=quant;
}

function addCheck(address addr,uint index,bool check){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialCheck[addr][index]=check;
}

function addAddress(address addr,uint index,address addr){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialAddress[addr][index]=addr;
}

function addInfoListItem(address addr,uint index,string check){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialList[addr][index].push(check);
}

function addBoolListItem(address addr,uint index,bool check){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialList[addr][index].push(check);
}

function addAddressListItem(address addr,uint index,address addr){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialList[addr][index].push(addr);
}

function addQuantityListItem(address addr,uint index,uint u){
if((msg.sender!=Pretorivs.coins_owner(addr))&&(msg.sender!=controller))throw;
socialList[addr][index].push(u);
}

function readInfo(address addr,uint index)constant returns (string,string){
return (socialInfo[addr][index],infosLabels[index]);
}

function readQuantity(address addr,uint index)constant returns (uint,string){
return (socialQuantity[addr][index],quantityLabels[index]);
}

function readCheck(address addr,uint index)constant returns (bool,string){
return (socialCheck[addr][index],boolsLabels[index]);
}

function readAddress(address addr,uint index)constant returns (bool,string){
return (socialAddress[addr][index],addressLabels[index]);
}

function readInfoList(address addr,uint index,uint item)constant returns (string,string){
return (socialInfoList[addr][index][item],infosListLabels[index][item]);
}

function readQuantityList(address addr,uint index,uint item)constant returns (uint,string){
return (socialQuantityList[addr][index][item],quantityListLabels[index][item]);
}

function readCheckList(address addr,uint index,uint item)constant returns (bool,string){
return (socialCheckList[addr][index][item],boolsListLabels[index][item]);
}

function readAddressList(address addr,uint index,uint item)constant returns (bool,string){
return (socialAddressList[addr][index][item],addressListLabels[index][item]);
}





function setLabel(uint labeltype,uint labelindex,uint listitem,string label)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(labeltype==100){infoLabels[labelindex]=label;}
if(labeltype==101){quantityLabels[labelindex]=label;}
if(labeltype==102){boolLabels[labelindex]=label;}
if(labeltype==103){addressLabels[labelindex]=label;}

if(labeltype==110){infoListLabels[labelindex][listitem]=label;}
if(labeltype==111){quantityListLabels[labelindex][listitem]=label;}
if(labeltype==112){boolListLabels[labelindex][listitem]=label;}
if(labeltype==113){addressListLabels[labelindex][listitem]=label;}
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
