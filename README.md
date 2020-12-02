# HAPPY HOUSE (Back-End)  

---  

## Overview
> SSAFY 1학기 관통 프로젝트로 시작하였으며 부동산 매물 정보를 가지고 와서 보여주는 웹 페이지를 만드는 프로젝트이다.
> Back-end를 RESTful하게 구현하였으며 REST 서버에서는 회원, 게시판, 찜, 지역 정보에 대한 request에 response한다.  

## Enviroment
> ### Spring Boot  
> - __dependency__
>  &nbsp; &nbsp; Spring Boot JDBC, Spring Boot WEB, Spring Boot Services, Spring Boot Mybatis, Spring Boot DevTools, JSTL, MySQL, JSON
> - 스프링 부트를 사용하여 위와 같은 다양한 라이브러리를 사용했다. DB와 연동하기 위해 MyBatis를 사용했다.  
> ### MySQL
> - __ERD__
> (img/최종 ERD(사진).JPG)
> - 시/도, 구/군, 동 코드에 대한 데이터를 가지고 있다.
> - 회원 정보와 회원 마다의 찜 목록(+ 찜한 매물에 대한 데이터), 게시판 데이터를 가지고 있다.
