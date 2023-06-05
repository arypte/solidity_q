// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18;

//숫자들이 들어가는 배열을 선언하고 그 중에서 3번째로 큰 수를 반환하세요.

contract Q51 {

    uint[] array ;

    function push( uint _input ) public {
        array.push( _input ) ;
    }

    function get() public returns( uint ) {

        require( array.length > 2 ) ;

        for( uint i = 0 ; i < array.length ; i ++ ) {

            for( uint j = i + 1 ; j < array.length ; j ++ )
            if( array[ i ] > array[ j ] ) ( array[ i ] , array[ j ] ) = ( array[ j ] , array [ i ] ) ;

        }

        return array[ 2 ] ;

    }


}
  
// 자동으로 아이디를 만들어주는 함수를 구현하세요. 이름, 생일, 지갑주소를 기반으로 만든 해시값의 첫 10바이트를 추출하여 아이디로 만드시오.

contract Q52 {

    struct ID {

        string name ;
        uint birthday ;
        address addr ;
        bytes10 id ;

    }

    ID i;

    function setID(string calldata _name, uint _birth) public {

        ( i.name , i.birthday , i.addr ) = ( _name , _birth , msg.sender ) ;
        i.id = bytes10( keccak256( abi.encodePacked( _name , _birth , msg.sender ) ) ) ;

    }
}


// 시중에는 A,B,C,D,E 5개의 은행이 있습니다. 각 은행에 고객들은 마음대로 입금하고 인출할 수 있습니다. 각 은행에 예치된 금액 확인, 입금과 인출할 수 있는 기능을 구현하세요.
// 힌트 : 이중 mapping을 꼭 이용하세요.
    
contract Q53{

    mapping( string => mapping( address => uint ) ) balance ;

    function chk_bal( string calldata _bank ) public view returns( uint ) {

        return balance[ _bank ][ msg.sender ] ;

    }

    function deposit( string calldata _bank ) public payable {

        balance[ _bank ][ msg.sender ] += msg.value ;

    }

    function withdraw( string calldata _bank , uint _amount ) public {

        require( balance[ _bank ][ msg.sender ] >= _amount ) ;

        payable( msg.sender ).transfer( _amount ) ;
        balance[ _bank ][ msg.sender ] -= _amount ;

    }


}

    
// 기부받는 플랫폼을 만드세요. 가장 많이 기부하는 사람을 나타내는 변수와 그 변수를 지속적으로 바꿔주는 함수를 만드세요.
// 힌트 : 굳이 mapping을 만들 필요는 없습니다.

contract Q54{

    mapping( address => uint ) balance ;
    uint max = 0 ;
    address maxadd ;

    function donation() public payable {

        balance[ msg.sender ] += msg.value ;

        if( balance[ msg.sender ] > max ){
            max = balance[ msg.sender ] ;
            maxadd = msg.sender ;
        }
    
    }

}

// 배포와 함께 owner를 설정하고 owner를 다른 주소로 바꾸는 것은 오직 owner 스스로만 할 수 있게 하십시오.

contract Q55 {

    address owner ;

    constructor() {

        owner = msg.sender ;

    }

    modifier chk_owner() {

        require( owner == msg.sender ) ;
        _ ;

    }

    function change_owner( address _input ) public chk_owner{

        owner = _input ;

    }

}

// 위 문제의 확장버전입니다. owner와 sub_owner를 설정하고 owner를 바꾸기 위해서는 둘의 동의가 모두 필요하게 구현하세요.

contract Q56 {

    address owner ;
    address sub_owner ;
    bool[ 2 ] agree ;

    constructor( address _input ) {

        owner = msg.sender ;
        sub_owner = _input ;

    }

    function agree_owner( bool _b ) public {
        require( msg.sender == owner ) ;
        agree[ 0 ] = _b ;
    }

    function agree_sub( bool _b ) public {
        require( msg.sender == sub_owner ) ;
        agree[ 1 ] = _b ;
    }

    modifier chk() {

        require( agree[ 0 ] && agree[ 1 ] ) ;
        _ ;

    }

    function change_owner( address _input ) public chk{

        owner = _input ;

    }

}

//. 위 문제의 또다른 버전입니다. owner가 변경할 때는 바로 변경가능하게 sub-owner가 변경하려고 한다면 owner의 동의가 필요하게 구현하세요.

contract Q57 {

    address owner ;
    address sub_owner ;
    bool[ 2 ] agree ;

    constructor( address _input ) {

        owner = msg.sender ;
        sub_owner = _input ;

    }

    function agree_owner( bool _b ) public {
        require( msg.sender == owner ) ;
        agree[ 0 ] = _b ;
    }


    modifier chk() {

        require( agree[ 0 ] && agree[ 1 ] ) ;
        _ ;

    }

    function change_owner( address _input ) public{

        require( msg.sender == owner || agree[ 0 ] == true ) ;

        owner = _input ;

    }

}
    
// A contract에 a,b,c라는 상태변수가 있습니다. a는 A 외부에서는 변화할 수 없게 하고 싶습니다.
// b는 상속받은 contract들만 변경시킬 수 있습니다. c는 제한이 없습니다. 각 변수들의 visibility를 설정하세요.

contract Q58{

    uint private a ; // 상속받은애가 쓸수 있으면 internal 
    uint internal b ;
    uint public c ;

}
    
// 현재시간을 받고 2일 후의 시간을 설정하는 함수를 같이 구현하세요.

contract Q59{

    uint public currentTime ;
    uint public currentTimePlusTwoDays ;

    function setCurrentTime() public {

        currentTime = block.timestamp  ; // 유닉스 시간
        currentTimePlusTwoDays = block.timestamp + 2 days ;

    }

}
    
// 방이 2개 밖에 없는 펜션을 여러분이 운영합니다. 각 방마다 한번에 3명 이상 투숙객이 있을 수는 없습니다.
// 특정 날짜에 특정 방에 누가 투숙했는지 알려주는 자료구조와 그 자료구조로부터 값을 얻어오는 함수를 구현하세요.
// 예약시스템은 운영하지 않아도 됩니다. 과거의 일만 기록한다고 생각하세요. 
// 힌트 : 날짜는 그냥 숫자로 기입하세요. 예) 2023년 5월 27일 → 230527
    
contract Q60{

    mapping( uint => mapping( uint => address[] ) ) db ;

    function update( uint _roomnumber , uint _date ) public {

        require( db[ _date ][ _roomnumber ].length < 3 ) ;
        db[ _date ][ _roomnumber ].push( msg.sender ) ;

    }

    function chk( uint _roomnumber , uint _date ) public view returns( address[] memory ){

        return db[ _date ][ _roomnumber ] ;

    }

}