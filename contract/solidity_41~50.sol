// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.18;

// 숫자만 들어갈 수 있으며 길이가 4인 배열을 (상태변수로)선언하고 그 배열에 숫자를 넣는 함수를 구현하세요. 배열을 초기화하는 함수도 구현하세요.
// (길이가 4가 되면 자동으로 초기화하는 기능은 굳이 구현하지 않아도 됩니다.)
contract Q41 {

    uint[ 4 ] public array ;
    uint cnt = 0 ;

    function f( uint _input ) public {

        array[ cnt ++ ] = _input ;

    }

    function Reset() public {

        delete array ;

    }


}
    
// 이름과 번호 그리고 지갑주소를 가진 '고객'이라는 구조체를 선언하세요. 새로운 고객 정보를 만들 수 있는 함수도 구현하되 이름의 글자가 최소 5글자가 되게 설정하세요.
contract Q42 {

    struct u_type{

        string name ;
        uint number ;
        address add ;

    }

    mapping( address => u_type ) db ;
    uint u_cnt = 0 ;

    function new_user( string memory _name ) public {

        require( bytes( _name ).length >= 5 ) ;

        db[ msg.sender ].number = u_cnt ++ ;
        db[ msg.sender ].name = _name ;
        db[ msg.sender ].add = msg.sender ;

    }

}

// 은행의 역할을 하는 contract를 만드려고 합니다. 별도의 고객 등록 과정은 없습니다.
// 해당 contract에 ether를 예치할 수 있는 기능을 만드세요.
// 또한, 자신이 현재 얼마를 예치했는지도 볼 수 있는 함수 그리고 자신이 예치한만큼의 ether를 인출할 수 있는 기능을 구현하세요.
contract Q43 {

        function deposit() public payable {}
    
        mapping( address => uint ) balances ;
    
        function chk_b() public view returns( uint ) {
            return balances[ msg.sender ] ;
        }
    
        function withDraw(uint _amount) public {
            require(balances[msg.sender] >= _amount);
            balances[msg.sender] -= _amount;
        }
}
    
// string만 들어가는 array를 만들되, 4글자 이상인 문자열만 들어갈 수 있게 구현하세요.
contract Q44 {
    string[] public letter ;
    
    function setLetters( string memory _input ) public {
        require( bytes( _input ).length >= 4 ) ;
        letter.push( _input ) ;
    }
}

    
// 숫자만 들어가는 array를 만들되, 100이하의 숫자만 들어갈 수 있게 구현하세요.
contract Q45{

    uint[] numbers ;
    
    function setNumber( uint _input ) public {
        require( _input <= 100 ) ;
        numbers.push( _input ) ;
    }

}
    
// 3의 배수이거나 10의 배수이면서 50보다 작은 수만 들어갈 수 있는 array를 구현하세요.
// (예 : 15 -> 가능, 3의 배수 // 40 -> 가능, 10의 배수이면서 50보다 작음 // 66 -> 가능, 3의 배수 // 70 -> 불가능 10의 배수이지만 50보다 큼)
    
contract Q46 {
    uint[] public numbers;
 
    function pushNumbers( uint _input ) public {

        require( _input % 3 == 0 || _input % 10 == 0 && _input < 50 ) ;
        numbers.push( _input ) ;

    }

}
    
// 배포와 함께 배포자가 owner로 설정되게 하세요. owner를 바꿀 수 있는 함수도 구현하되 그 함수는 owner만 실행할 수 있게 해주세요.
contract Q47 {

    address owner;
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require( msg.sender == owner ) ;
        _ ;
    }
    
    function changeOwner( address _newOwner ) public onlyOwner {
            owner = _newOwner ;
        }
}
    
// A라는 contract에는 2개의 숫자를 더해주는 함수를 구현하세요. B라고 하는 contract를 따로 만든 후에 A의 더하기 함수를 사용하는 코드를 구현하세요.
contract Q48_A {

    function add( uint _a, uint _b ) public pure returns( uint ) {
        return _a +_b ;
    }

}

contract Q48_B {

    Q48_A a;
    
    function addFromA( uint _c , uint _d ) public view returns( uint ) {
        return a.add( _c , _d ) ;
    }

}

    
/// 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.
//  예) 459273 → 273 // 492871 → 871 // 92218 → 218
    
contract Q49 {

        function f (uint _input ) public pure returns( uint ) {
            return _input % 1000 ;
        }
}

    
// 숫자 3개가 부여되면 그 3개의 숫자를 이어붙여서 반환하는 함수를 구현하세요. 
// 예) 3,1,6 → 316 // 1,9,3 → 193 // 0,1,5 → 15 
  
contract Q50 {

    function f( uint _a , uint _b , uint _c ) public pure returns( uint ) {

        return ( _a * 100 + _b * 10 + _c ) ;

    }
    
}