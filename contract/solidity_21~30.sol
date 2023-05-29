// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// 3의 배수만 들어갈 수 있는 array를 구현하세요.
contract Q21 {

	uint[] numbers ;
	
	function only3( uint _n ) public {
		require( _n % 3 == 0 ) ;

		numbers.push( _n ) ;
	}

}

// 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
contract Q22 {

	function sub( uint _a , uint _b ) public pure returns( uint ) {

        return _a > _b ? _a - _b : _b - _a ;
		
	}

}

// 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
contract Q23 {

	function f( uint _input ) public pure returns( string memory ){

		if( _input % 3 == 0 ) return 'A' ;
		else if( _input % 3 == 1 ) return 'B' ;
		else return 'C' ;

	}

}

// string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요
contract Q24 {

	function f( string memory _input ) public pure returns ( bool ) {

		if( keccak256( abi.encodePacked( _input ) ) == keccak256( abi.encodePacked( "Alice" ) ) ) return true ;
		
		return false ;

	}

}

// 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
contract Q25 {

	uint[] A ;

	function f( uint _n ) public {

		for( uint i = _n ; i > 0 ; i -- ) A.push( i ) ;
		A.push( 0 ) ;

	}
	// 182841 gas 158992 137788

}

contract Q25_2 {

	uint[] A ;

	function f( uint _n ) public {

		for( ; _n > 0 ; _n -- ) A.push( _n ) ;
		A.push( 0 ) ;

	} 
	// 182827 158980 137776

}

// 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때
// 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
contract Q26 {

	uint[] even ; // 짝수
	uint[] odd ; // 홀수

	function f( uint _input ) public {

		if( _input % 2 == 0 ) even.push( _input ) ;
		else odd.push( _input ) ;
	
	}

}

// string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요.
// 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
contract Q27 {

	mapping( string => bytes32 ) mapping_test ;

	function push( string memory _key , bytes32 _value ) public {

		mapping_test[ _key ] = _value ;

	}

	function pop( string memory _key ) public {

		delete mapping_test[ _key ] ;

	}

	function get( string memory _key ) public view returns( bytes32 ) {

		return mapping_test[ _key ] ;

	}

}

// ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
contract Q28 {

	function f( string memory _ID , string memory _PW ) public pure returns( bytes32 ){

		return keccak256( abi.encodePacked( _ID , _PW ) ) ;

	}

}
    
// 숫자형 변수 a와 문자형 변수 b를 각각 10
// 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
contract Q29{

	uint a ;
	string b ;

	constructor() {

		a = 10 ;
		b = 'A' ;

	}

}

// 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
// (sorting 코드 응용 → 약간 까다로움)
// 예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
contract Q30 {

	uint[] public numbers ;

	function sorting( uint[] memory ) public {

        for( uint i = 0 ; i < numbers.length - 1 ; i++ ) {

            for(uint j= i + 1 ; j < numbers.length ; j ++ ) {

                if( numbers[ i ] < numbers[ j ] ) 
				( numbers[ i ] , numbers[ j ] ) = ( numbers[ j ] , numbers[ i ] ) ;

	        }

        }

	}

}