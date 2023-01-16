//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract structure{
struct Book{
    string title;
    string author;
    uint bookID;
    uint price;
}
Book book;
function setBook() public{
    book=Book("BlockChain for Begineers","INeuron",4,1000);
}
function getBookId() public view returns(uint){
    return book.bookID;
}

}