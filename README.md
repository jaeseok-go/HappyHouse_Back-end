# HAPPY HOUSE (Back-End)  

---  

## Overview
> SSAFY 1학기 관통 프로젝트로 시작하였으며 부동산 매물 정보를 제공하는 웹 페이지를 구현하는 프로젝트이다.
> Back-end를 RESTful하게 구현하였으며 REST 서버에서는 회원, 게시판, 찜, 지역 정보에 대한 request에 response한다.  

## Enviroment
> ### Spring Boot  
> - __dependency__  
>  &nbsp; &nbsp; Spring Boot JDBC, Spring Boot WEB, Spring Boot Services, Spring Boot Mybatis, Spring Boot DevTools, JSTL, MySQL, JSON
> - 스프링 부트를 사용하여 위와 같은 다양한 라이브러리를 사용했다. DB와 연동하기 위해 MyBatis를 사용했다.  
> ### MySQL
> - __ERD__  
> <img src="https://github.com/jaeseok-go/HappyHouse_Back-end/blob/main/img/%EC%B5%9C%EC%A2%85%20ERD(%EC%82%AC%EC%A7%84).JPG" width="500" height="500">  
>  
> - 시/도, 구/군, 동 코드에 대한 데이터를 가지고 있다.
> - 회원 정보와 회원 마다의 찜 목록(+ 찜한 매물에 대한 데이터), 게시판 데이터를 가지고 있다.

## Structure & Flow  
> <img src="https://github.com/jaeseok-go/HappyHouse_Back-end/blob/main/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B5%AC%EC%A1%B0.png" width="500" height="500">  
> 전체적인 서버의 구조는 위와 같다. (직접 구현한 부분만 표시해보았다.)  
> 1. Client의 요청이 도착하면 이에 알맞는 컨트롤러에 디스패쳐서블릿이 지정해준다.  
> 2. 해당 컨트롤러에서 필요한 서비스 빈을 가져와서 그 서비스의 메소드를 호출한다.  
> 3. 해당 서비스에서는 MyBatis 라이브러리를 활용하여 DAO 대신 SqlSession 객체로 매퍼에 접근한다.  
> 4. 매퍼는 서비스에서 요구하는 응답을 받기 위해 DB에 쿼리를 날려서 필요한 결과를 얻어서 반환한다.  
> 5. 반환된 결과는 컨트롤러에게 전달되어 이를 ResponseEntity로 Client에 응답한다.  
