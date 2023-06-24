// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18 ;


//1. 숫자형 변수 a를 선언하고 a를 바꿀 수 있는 함수를 구현하세요.
//한번 바꾸면 그로부터 10분동안은 못 바꾸게 하는 함수도 같이 구현하세요.


    
contract Q71{

    uint public a ;

    uint a_time = block.timestamp - 600 ;

    function setA( uint _a ) public {

        require( a_time + 600 < block.timestamp ) ;

        a_time = block.timestamp ;
        a = _a ;

    }

}

    
//.  contract에 돈을 넣을 수 있는 deposit 함수를 구현하세요. 해당 contract의 돈을 인출하는 함수도 구현하되 오직 owner만 할 수 있게 구현하세요.
// owner는 배포와 동시에 배포자로 설정하십시오. 한번에 가장 많은 금액을 예치하면 owner는 바뀝니다.
// 예) A (배포 직후 owner), B가 20 deposit(B가 owner), C가 10 deposit(B가 여전히 owner), D가 50 deposit(D가 owner),
//    E가 20 deposit(D), E가 45 depoist(D), E가 65 deposit(E가 owner)
    
contract Q72{

    address c_owner ;
    uint max = 0 ;

    constructor(){ c_owner = msg.sender ; }

    modifier chk_owner(){

        require( c_owner == msg.sender ) ;
        _ ;

    }
    
    function deposit() public payable {
        if( msg.value > max ){ 
            max = msg.value ;
            c_owner = msg.sender ;
        }
    }

    function withdraw() public chk_owner{

        payable( msg.sender ).transfer( address( this ).balance ) ;
    
    }

}
    
// 위의 문제의 다른 버전입니다. 누적으로 가장 많이 예치하면 owner가 바뀌게 구현하세요.
//  예) A (배포 직후 owner), B가 20 deposit(B가 owner), C가 10 deposit(B가 여전히 owner),
// D가 50 deposit(D가 owner), E가 20 deposit(D), E가 45 depoist(E가 owner, E 누적 65), E가 65 deposit(E)
    
contract Q73{

    address c_owner ;
    uint max = 0 ;
    mapping( address => uint ) balance ;

    constructor(){ c_owner = msg.sender ; }

    modifier chk_owner(){

        require( c_owner == msg.sender ) ;
        _ ;

    }
    
    function deposit() public payable {
        balance[ msg.sender ] += msg.value ;
        if( balance[ msg.sender ] > max ){
            max = balance[ msg.sender ] ;
            c_owner = msg.sender ;
        } 
    }

    function withdraw() public chk_owner{

        payable( msg.sender ).transfer( address( this ).balance ) ;
    
    }

}
    
// 어느 숫자를 넣으면 항상 10%를 추가로 더한 값을 반환하는 함수를 구현하세요.
// 예) 20 -> 22(20 + 2, 2는 20의 10%), 0 // 50 -> 55(50+5, 5는 50의 10%), 0
// 42 -> 46(42+4), 4 (42의 10%는 4.2 -> 46.2, 46과 2를 분리해서 반환) // 27 => 29(27+2), 7 (27의 10%는 2.7 -> 29.7, 29와 7을 분리해서 반환)

contract Q74{

    function A( uint _input ) public pure returns( uint , uint ) {

        return ( _input * 11 / 10 , ( _input * 11 ) % 10 ) ;

    }

}    

// 문자열을 넣으면 n번 반복하여 쓴 후에 반환하는 함수를 구현하세요.
// 예) abc,3 -> abcabcabc // ab,5 -> ababababab
    
contract Q75{

    function A( string memory _input , uint _n ) public pure returns( string memory ) {

        bytes memory rt_value ;

        for( uint i = 0 ; i < _n ; i ++ ) {
            rt_value = abi.encodePacked( rt_value , bytes( _input ) ) ;
        }

        return string( rt_value ) ;

    }

} 

// 1. 숫자 123을 넣으면 문자 123으로 반환하는 함수를 직접 구현하세요.

    
contract Q76{

    function A( uint _input ) public pure returns( string memory ) {

        bytes memory rt_value ;

        for( uint i = 0 ; i < 3 ; i ++ ) {
            rt_value = abi.encodePacked( rt_value , abi.encodePacked( ( _input % 10 ) + uint8( bytes1( '0' ) ) ) ) ;
            _input /= 10 ;
        }

        // 거꾸로 뒤집기.. 

        ( rt_value[ 0 ] , rt_value[ 2 ] ) = ( rt_value[ 2 ] , rt_value[ 0 ] ) ;

        return string( rt_value ) ;

    }

}

//1. 위의 문제와 비슷합니다. 이번에는 openzeppelin의 패키지를 import 하세요.
//    힌트 : import "@openzeppelin/contracts/utils/Strings.sol";

import "@openzeppelin/contracts/utils/Strings.sol" ;
contract Q77{

    // using <library> for <type>;
    using Strings for uint ;

    function A( uint _input ) public pure returns( string memory ) {

        return _input.toString() ;
        // ?? toString( _input ) ; 아님??
        // 라이브러리 공부 체크

    }

}

// 1. 숫자만 들어갈 수 있는 array를 선언하세요. array 안 요소들 중 최소 하나는 10~25 사이에 있는지를 알려주는 함수를 구현하세요.
// 예) [1,2,6,9,11,19] -> true (19는 10~25 사이) // [1,9,3,6,2,8,9,39] -> false (어느 숫자도 10~25 사이에 없음)

contract Q78{ 

    uint[] array ;

    function Apush( uint _input ) public {
        array.push( _input ) ;
    }

    function getB() public view returns( bool ) {

        for( uint i = 0 ; i < array.length ; i ++ ) {

            if( array[ i ] > 9 && array[ i ] < 26 ) return true ; 

        }

        return false ;

    }

}

// 1. 3개의 숫자를 넣으면 그 중에서 가장 큰 수를 찾아내주는 함수를 Contract A에 구현하세요.
// Contract B에서는 이름, 번호, 점수를 가진 구조체 학생을 구현하세요.
// 학생의 정보를 3명 넣되 그 중에서 가장 높은 점수를 가진 학생을 반환하는 함수를 구현하세요.
// 구현할 때는 Contract A를 import 하여 구현하세요.

import "contract/solidity_71~80.sol" ;

contract Q79_A{

    function findMax( uint _a , uint _b , uint _c ) public pure returns( uint ){

        uint rt = _a > _b ? _a : _b ;
        rt = rt > _c ? rt : _c ;
        return rt == _a ? 0 : ( rt == _b ? 1 : 2 ) ;

    }

    function re() public view returns( address ){
        return msg.sender ;
    }

}

contract Q79_B{

    struct student{

        string name ;
        uint number ;
        uint score ;

    }

    student[] db ;

    Q79_A public A = new Q79_A() ;
    // 완전히 새로운 컨트렉트가 선언되는거 같다..?
    // 가스비 2번 먹는지 체크

    function s_push( string memory name , uint score ) public {

        db.push( student( name , db.length + 1 , score ) ) ;

    }

    function f( uint _a , uint _b , uint _c ) public view returns( student memory ) {
        uint t = A.findMax( db[ _a ].score , db[ _b ].score , db[ _c ].score ) ;
        return t == 0 ? db[ _a ] : ( t == 1 ? db[ _b ] : db[ _c ] ) ;
    }

    function T() public view returns( address ){
        return A.re() ;
    }
    // 상속, msg.sender 공부를 좀 더 해야할듯

}


// 1. 지금은 동적 array에 값을 넣으면(push) 가장 앞부터 채워집니다.
//  1,2,3,4 순으로 넣으면 [1,2,3,4] 이렇게 표현됩니다. 그리고 값을 빼려고 하면(pop) 끝의 숫자부터 빠집니다.
//  가장 먼저 들어온 것이 가장 마지막에 나갑니다. 이런 것들을FILO(First In Last Out)이라고도 합니다.
//  가장 먼저 들어온 것을 가장 먼저 나가는 방식을 FIFO(First In First Out)이라고 합니다. push와 pop을 이용하되 FIFO 방식으로 바꾸어 보세요.

contract Q80{

}