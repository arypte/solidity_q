// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// uint 형이 들어가는 array를 선언하고, 짝수만 들어갈 수 있게 걸러주는 함수를 구현하세요.
contract Q11 {

    uint[] array ;

    function even_push( uint _input ) public {

        if( _input % 2 == 0 ) array.push( _input ) ;

    }

}

// 숫자 3개를 더해주는 함수, 곱해주는 함수 그리고 순서에 따라서 a*b+c를 반환해주는 함수 3개를 각각 구현하세요.
contract Q12 {

    function plus( uint _a , uint _b , uint _c ) public pure returns( uint ) {

        return ( _a + _b + _c ) ;

    }

    function mul( uint _a , uint _b , uint _c ) public pure returns( uint ) {

        return ( _a * _b * _c ) ;

    }

    function order( uint _a , uint _b , uint _c ) public pure returns( uint ) {

        return ( _a * _b + _c ) ;

    }

}

// 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
contract Q13 {

    function f( uint _input ) public pure returns( string memory ) {

        if( _input % 3 == 0 ) return "A" ;
        else if( _input % 3 == 1 ) return "B" ;
        return "C" ; 

    }

}

// 학번, 이름, 듣는 수험 목록을 포함한 학생 구조체를 선언하고 학생들을 관리할 수 있는 array를 구현하세요.
// array에 학생을 넣는 함수도 구현하는데 학생들의 학번은 1번부터 순서대로 2,3,4,5 자동 순차적으로 증가하는 기능도 같이 구현하세요.
contract Q14 {

    struct s_type {

        uint id ;
        string name ;
        string[] classes ;

    }

    s_type[] students ;

    function pushStudent(string memory _name, string[] memory classes) public {
		students.push( s_type( students.length+1 , _name, classes ) ) ;
	}

}

// 배열 A를 선언하고 해당 배열에 0부터 n까지 자동으로 넣는 함수를 구현하세요. 
contract Q15 {

    uint[] A ;

	function fillA( uint _n ) public {
		for( uint i = 0 ; i < _n + 1 ; i ++ ) A.push( i ) ;
	}

}

// 숫자들만 들어갈 수 있는 array를 선언하고 해당 array에 숫자를 넣는 함수도 구현하세요. 또 array안의 모든 숫자의 합을 더하는 함수를 구현하세요.
contract Q16 {

    uint[] array ;

	function input( uint _input ) public {
		array.push( _input ) ;
	}

    function sum_array() public view returns( uint ) {

        uint sum = 0 ;

        for( uint i = 0 ; i < array.length ; i ++ ) sum += array[ i ] ;

        return sum ;

    }

}

// string을 input으로 받는 함수를 구현하세요. 이 함수는 true 혹은 false를 반환하는데 Bob이라는 이름이 들어왔을 때에만 true를 반환합니다. 
contract Q17 {

    function f( string memory _input ) public pure returns( bool ) {
        return keccak256( bytes( _input ) ) == keccak256( bytes( "Bob" ) ) ;
    }

}

// 이름을 검색하면 생일이 나올 수 있는 자료구조를 구현하세요. (매핑) 해당 자료구조에 정보를 넣는 함수, 정보를 볼 수 있는 함수도 구현하세요.
contract Q18 {

 	mapping( string => uint ) birthday ;

	function setBirthday( string memory _name , uint _birthday ) public {
		birthday[ _name ] = _birthday ;
    }

}

// 숫자를 넣으면 2배를 반환해주는 함수를 구현하세요. 단 숫자는 1000이상 넘으면 함수를 실행시키지 못하게 합니다.
contract Q19 {

	function doubleIt( uint _n ) public pure returns( uint ) {

		require( _n < 1000 ) ;
		return _n * 2 ;

	}

}

// 숫자만 들어가는 배열을 선언하고 숫자를 넣는 함수를 구현하세요. 15개의 숫자가 들어가면
// 3의 배수 위치에 있는 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현하세요.(for 문 응용 → 약간 까다로움)
contract Q20 {

	uint[] numbers ;
	function pushNumbers( uint _n ) public {

		numbers.push( _n ) ;

        if( numbers.length == 15 ) { 
		
		    for(uint i = 3 ; i < 15 ; i += 2 ) {
    			delete numbers[ i - 1 ] ;
		    }

        }

	}

}



