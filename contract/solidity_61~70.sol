// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18 ;

// a의 b승을 반환하는 함수를 구현하세요.

contract Q61 {

    function power( uint _a , uint _b ) public pure returns( uint ) {
        return _a ** _b ;

    }

}
    
// 2개의 숫자를 더하는 함수, 곱하는 함수 a의 b승을 반환하는 함수를 구현하는데
// 3개의 함수 모두 2개의 input값이 10을 넘지 않아야 하는 조건을 최대한 효율적으로 구현하세요.
    
contract Q62 {

    modifier chk( uint _a , uint _b ) {

        require( _a <= 10 && _b <= 10 ) ;
        _ ;

    }

    function plus( uint _a , uint _b ) public pure chk( _a , _b ) returns( uint ) {

        return ( _a + _b ) ;

    }

    function mul( uint _a , uint _b ) public pure chk( _a , _b ) returns( uint ) {

        return ( _a * _b ) ;

    }

    function power( uint _a , uint _b ) public pure chk( _a , _b ) returns( uint ) {

        return ( _a ** _b ) ;

    }

}
    
// 2개 숫자의 차를 나타내는 함수를 구현하세요.

contract Q63 {

    function f( uint _a , uint _b ) public pure returns( uint ) {

        if( _a > _b ) return ( _a - _b ) ;
        
        return ( _b - _a ) ;

    }

}

// 지갑 주소를 넣으면 5개의 4bytes로 분할하여 반환해주는 함수를 구현하세요.

contract Q64 {

    function splitAddress(address wallet) public pure returns (bytes4[5] memory) {
        bytes4[5] memory parts;
        bytes20 addressBytes = bytes20(wallet);
        //0x 5B38Da6a 701c5685 45dCfcB0 3FcB875f 56beddC4 //40개인데 20bytes로 묶는다 
        //4byte = 16진수 8자리 = 2진수 32자리
        // 1bytes = 8bit = 16진수 2자리 = 2진수 8자리
        // 2bytes = 16bit = 16진수 4자리 = 2진수 16자리
    
        // 5B38Da6a 701c5685 45dCfcB0 3FcB875f 56beddC4
        // 5B38Da6a 701c5685 45dCfcB0 3FcB875f 56beddC4

        // 0 = 5B = uint8 ( 5B ) = 16 * 5 + 11 = 91 = 0101 1011
        // 91 << 24
        // uint32(0101 1011) = 0101 1011 0000 0000 0000 0000 0000 0000
        // 1 = 38 =            0000 0000 0011 1000 0000 0000 0000 0000 
        // 2 = DA              
        // 3 = 6a

        // 0101  1011 , 0011 1000 , 0000 0000 , 0000 0000

        // 1byte = 8bit
        // 2^4 = 0~15 = 16진수 2개가 1byte

        // 가스비는 연산 + 코드양
        // 연산 동일, 코드양 줄어듬

        for( uint i = 0 ; i < 5 ; i ++ ) {
            parts[i] = bytes4(uint32(uint8(addressBytes[i*4])) << 24 |
                uint32(uint8(addressBytes[i*4+1])) << 16 |
                uint32(uint8(addressBytes[i*4+2])) << 8 |
                uint32(uint8(addressBytes[i*4+3])));
        }

        // i = 0    0 , 1 , 2 , 3
        // i = 1    4 , 5 , 6 , 7
        // i = 2    8 , 9 , 10 ,11
        
        return parts;
    }
}

    
// 숫자 3개를 입력하면 그 제곱을 반환하는 함수를 구현하세요.
// 그 3개 중에서 가운데 출력값만 반환하는 함수를 구현하세요.
// 예) func A : input → 1,2,3 // output → 1,4,9 | func B : output 4 (1,4,9중 가운데 숫자) 

contract Q65 {

    function A( uint _a , uint _b , uint _c ) public pure returns( uint , uint , uint ) {

        return ( _a * _a , _b * _b , _c * _c ) ;

    }

    function B( uint _a , uint _b , uint _c ) public pure returns( uint ) {

        uint[ 3 ] memory array ;
        ( array[ 0 ] , array[ 1 ] , array[ 2 ] ) = A( _a , _b , _c ) ;

        for( uint i = 0 ; i < 3 ; i ++ )
        for( uint j = i + 1 ; j < 3 ; j ++ )
            if( array[ i ] > array[ j ] ) ( array[ i ] , array[ j ] ) = ( array[ j ] , array[ i ] ) ;

        return array[ 1 ] ;
    
    }

}
    
// 특정 숫자를 입력했을 때 자릿수를 알려주는 함수를 구현하세요.
// 추가로 그 숫자를 5진수로 표현했을 때는 몇자리 숫자가 될 지 알려주는 함수도 구현하세요.

contract Q66 {

    function A( string memory _input ) public pure returns( uint ) {

        bytes memory temp = bytes( _input ) ;
        return temp.length ;

    }

    function B( uint _input ) public pure returns( uint ) {

        uint cnt = 0 ;

        while( _input > 0 ) {

            _input /= 5 ;
            cnt ++ ;

        }

        return cnt ;

    }
    
}


// 자신의 현재 잔고를 반환하는 함수를 보유한 Contract A
// 와 다른 주소로 돈을 보낼 수 있는 Contract B를 구현하세요.
// B의 함수를 이용하여 A에게 전송하고 A의 잔고 변화를 확인하세요.

contract Q67_A {

    //function 


}
    
// 계승(팩토리얼)을 구하는 함수를 구현하세요. 계승은 그 숫자와 같거나 작은 모든 수들을 곱한 값이다. 
// 예) 5 → 1*2*3*4*5 = 60, 11 → 1*2*3*4*5*6*7*8*9*10*11 = 39916800

contract Q68{

    function f( uint _input ) public pure returns( uint ) {

        uint rt_value = 1 ;

        while( _input > 0 ){

            rt_value *= _input ;
            _input -- ;

        }

        return rt_value ;

    }

}
    
// 숫자 1,2,3을 넣으면 1 and 2 or c 라고 반환해주는 함수를 구현하세요.

contract Q69 {

    function f( uint _a , uint _b , uint _c ) public pure returns( string memory ){

        return string( abi.encodePacked( _a + 48 , ' and ' , _b + 48 , ' or ' , _c + 96 ) ) ;

    }

}    


// 번호와 이름 그리고 bytes로 구성된 고객이라는 구조체를 만드세요.
// bytes는 번호와 이름을 keccak 함수의 input 값으로 넣어 나온 output값입니다.
// 고객의 정보를 넣고 변화시키는 함수를 구현하세요. 

contract Q70 {

    struct u_type{

        uint number ;
        string name ;
        bytes32 pwd ;

    }

    uint u_cnt = 0 ;
    mapping( address => u_type ) db ;

    function set( string memory _name ) public {

        db[ msg.sender ].name = _name ;
        db[ msg.sender ].number = ++ u_cnt ;
        db[ msg.sender ].pwd = keccak256( abi.encodePacked( u_cnt , _name ) );

    }

    function get() public view returns( u_type memory ){

        return db[ msg.sender ] ;

    }
    
}