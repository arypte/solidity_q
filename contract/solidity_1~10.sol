// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// 1. 더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요
contract Q1 {

    function plus( uint _a , uint _b ) public pure returns( uint ) {
        return _a + _b ;
    }

    function minus( uint _a , uint _b ) public pure returns( uint ) {
        return _a - _b ;
    }

    function mul( uint _a , uint _b ) public pure returns( uint ) {
        return _a * _b ;
    }

    function div( uint _a , uint _b ) public pure returns( uint ) {
        return _a / _b ;
    }

    function sqr( uint _a ) public pure returns( uint ) {
        return _a ** 2 ;
    }

}

// 2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.
contract Q2 {

    function plus( uint _a , uint _b ) public pure returns( uint ) {
        return _a + _b ;
    }

    function minus( uint _a , uint _b ) public pure returns( uint ) {
        return _a - _b ;
    }

    function mul( uint _a , uint _b ) public pure returns( uint ) {
        return _a * _b ;
    }

    function div( uint _a , uint _b ) public pure returns( uint ) {
        return _a / _b ;
    }

    function sqr( uint _a ) public pure returns( uint ) {
        return _a ** 2 ;
    }

}

// 1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.
contract Q3 {

    function sqr( uint _a ) public pure returns( uint ) {
        return _a ** 2 ;
    }

    function tre( uint _a ) public pure returns( uint ) {
        return _a ** 3 ;
    }

}

// 이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 그 구조체들을 관리할 수 있는 array, students를 선언하세요
contract Q4 {

    struct student{

        string name ;
        uint number ;
        string[] classes ;

    }

    student[] students ;

}

/*
1. 아래의 함수를 만드세요
    
    1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
    
    4~6을 입력하면 입력한 수의 2배를 반환받습니다.
    
    7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
    */

contract Q5 {

   function cal( uint _input ) public pure returns( uint ) {

       if( _input >= 1 && _input <= 3 ) return _input ** 2 ;
       else if( _input >= 4 && _input <= 6 ) return _input * 2 ;
       else if( _input >= 7 && _input <= 9 ) return _input % 3 ;
       else return 0 ;

   }

}

// 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
contract Q6 {

    uint[] numbers ;

    function f() public {    
    for( uint i = 0 ; i < 10 ; i ++ ) numbers.push( i ) ;
    }

}

// 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
contract Q7 {

    uint[] numbers ;

    function setzerotofive() public returns( uint ){

        uint rt_value = 0 ;
        for( uint i = 0 ; i <= 5 ; i ++  ){
            numbers.push( i ) ;
            rt_value += i ;
        }

        return rt_value ;

    }

}

/*
1. 아래의 함수를 만드세요
    
    1~10을 입력하면 “A” 반환받습니다.
    
    11~20을 입력하면 “B” 반환받습니다.
    
    21~30을 입력하면 “C” 반환받습니다.
    */
contract Q8 {
	function returnABC(uint _n) public pure returns(string memory) {
		if(1<=_n && _n <=10) {
			return "A" ;
		} else if(11<= _n && _n <= 20) {
			return "B" ;
		} else if(21<=_n && _n <=30) {
			return "C" ;
		} else {
			// "Out of range" ; // require 응용해도됨
		}
	}
}

// 문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.
contract Q9 {

    function f( string memory _input ) public pure returns( bytes memory ) {
        return bytes( _input ) ;        
    }

}

// 숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
contract Q10{

    uint[] numbers ;

    function push( uint _input ) public {

        numbers.push( _input ) ;

    }

    function pop() public {
        
        numbers.pop() ;

    }

    function gets( uint _n ) public view returns( uint )  {
        return numbers[ _n ] ;
    }

}