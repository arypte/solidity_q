// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
contract Q31 {

    function f( string memory _input ) public pure returns( bool ) {

        // keccak256 해쉬화
        // abi.encodePacked  연속적인 bytes 화
        if( keccak256( abi.encodePacked( _input ) ) == keccak256( abi.encodePacked( "Alice" ) ) ) return true ;
        if( keccak256( abi.encodePacked( _input ) ) == keccak256( abi.encodePacked( "Bob" ) ) ) return true ;
        return false ;

    }

}


    
// 3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
//    예) 3 → o , 9 → o , 15 → o , 30 → x
contract Q32 {

    uint[] number ;

    function f( uint _input ) public {

        require( ( _input % 3 == 0 ) && ( _input % 30 != 0 ) );
        number.push( _input ) ;

    }


}



// 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요. 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
contract Q33 {

    struct u_type{

        string name ;
        uint number ;
        address add ;
        uint birthday ;

    }

    mapping( string => u_type ) user_db ;

    function setU( string memory _name , uint _number , address _add , uint _birthday ) public {

        user_db[ _name ] = u_type( _name , _number , _add , _birthday ) ;

    }

    function getU( string memory _name ) public view returns( u_type memory ){

        return user_db[ _name ] ;

    }

}
    


// 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요. 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
contract Q34 {
    
    struct student_type{

        string name ;
        uint number ;
        uint score ;

    }

    student_type[] db ;

    function getavg() public view returns( uint ){

        uint sum = 0 ;

        for( uint i = 0 ; i < db.length ; i ++ ) sum += db[ i ].score ;

        sum /= db.length ;

        return sum ;

    }

    
}

// 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
// [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]
// [1,2,3,4,5] -> [ 2,4 ]

contract Q35 {

    uint[] array ;

    function geteven() public view returns( uint[] memory ){

        uint[] memory rt_value = new uint[]( array.length / 2 ) ;
        uint count = 0 ;
        for( uint i = 1 ; i < array.length ; i += 2 ) rt_value[ count ++ ] = array[ i ] ;

        return rt_value ;

    }

}

// high, neutral, low 상태를 구현하세요. a라는 변수의 값이 7이상이면 high, 4이상이면 neutral 그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.
contract Q36 {

    enum status{ high , neutral , low }

    status now = status.low ;
    uint public a = 0 ;

    function a_plus() public a_update() {

        a ++ ;

    }

    function a_minus() public a_update() {

        a -- ;

    }

    modifier a_update() {

        _ ;
        if( a >= 7 ) now = status.high ;
        else if( a >= 4 ) now = status.neutral ;
        else now = status.low ;

    }

}

// 1 wei를 기부하는 기능, 1finney를 기부하는 기능 그리고 1 ether를 기부하는 기능을 구현하세요.
// 최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 다른 이들은 못하게 막는 함수도 구현하세요.
// (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)

contract Q37 {

    address public owner ;

    constructor() {

        owner = msg.sender ;

    }

    function donation_1ether() public payable{ // 1이더 기부

        require( msg.value == 1 ether ) ;

    }

    function with() public {

        require( owner == msg.sender ) ;

        payable( msg.sender ).transfer( address( this ).balance ) ;

    }


}

// 상태변수 a를 "A"로 설정하여 선언하세요. 이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요.
// 단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
// (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)

contract Q38 {

    string public a = 'A' ;
    address owner ;

    constructor(){
        
        owner = msg.sender ;

    }

    modifier owner_chk(){

        require( msg.sender == owner ) ;
        _ ;

    }

    function seta_B() public owner_chk {

        a = 'B' ;

    }

    function seta_C() public owner_chk {

        a = 'C' ;

    }

}

// 특정 숫자의 자릿수까지의 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
// 예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개) // 100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)
contract Q39 {

    function f( uint _input ) public pure returns( uint , uint , uint , uint ){

        uint two = 0 ;
        uint three = 0 ;
        uint five = 0 ;
        uint seven  = 0 ;

        for( uint i = 2 ; i <= _input ; i ++ ){

            if( _input % 2 == 0 ) two ++ ;
            if( _input % 3 == 0 ) three ++ ;
            if( _input % 5 == 0 ) five ++ ;
            if( _input % 7 == 0 ) seven ++ ;

        }

        return ( two , three , five , seven ) ;

    }

}

// 숫자를 임의로 넣었을 때 오름차순으로 정렬하고 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
// 예) [5,2,4,7,1] -> [1,2,4,5,7], 4 // [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 // [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
contract Q40{

    uint[] public array ;

    function push( uint _input ) public {

        array.push( _input ) ;

    }

    function get_m1() internal view returns( uint ) {

        return array[ array.length / 2 ] ;

    }

    function get_m2() internal view returns( uint , uint ) {

        return ( array[ array.length / 2 - 1 ] , array[ array.length / 2 ] ) ;

    }

    function f() public returns( uint[] memory ){

        for( uint i = 0 ; i < array.length ; i ++ ) {
            for( uint j = i + 1 ; j < array.length ; j ++ )
                if( array[ i ] > array[ j ] ) ( array[ i ] , array[ j ] ) = ( array[ j ] , array[ i ] ) ;
        }

        uint[] memory rt_value ;
        if( array.length % 2 == 0 ){

            rt_value = new uint[]( 2 ) ;
            rt_value[ 0 ] = array[ array.length / 2 - 1 ] ;
            rt_value[ 1 ] = array[ array.length / 2 ] ;

        } else {

            rt_value = new uint[]( 1 ) ;
            rt_value[ 0 ] = array[ array.length / 2 ] ;

        }
        
        return rt_value ;

    }

}