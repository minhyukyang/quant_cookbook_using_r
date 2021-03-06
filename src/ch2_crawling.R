# Chapter 2 크롤링을 위한 기본 지식 -----
# - https://hyunyulhenry.github.io/quant_cookbook/%ED%81%AC%EB%A1%A4%EB%A7%81%EC%9D%84-%EC%9C%84%ED%95%9C-%EA%B8%B0%EB%B3%B8-%EC%A7%80%EC%8B%9D.html

# 2.1 인코딩의 이해와 R에서 UTF-8 설정하기 -----

# 2.2.1 인간과 컴퓨터 간 번역의 시작, ASCII -----

# 2.1.2 한글 인코딩 방식의 종류 -----

# 2.1.3 R에서 UTF-8 설정하기 -----

# R Studio의 [Tools → Global Options] 메뉴에서 [Code → Saving] 항목 중 [Default text encodings] 항목을 통해 기본 인코딩을 UTF-8로 변경합니다.

# 2.2 웹의 동작 방식 -----

# 2.2.1 HTTP -----

# 클라이언트가 각기 다른 방법으로 데이터를 요청한다면, 서버는 해당 요청을 알아듣지 못할 것입니다. 이를 방지하기 위해 규정된 약속이나 표준에 맞추어 데이터를 요청해야 합니다. 이러한 약속을 HTTP(HyperText Transfer Protocol)라고 합니다.

# HTTP 요청 방식과 설명
# - GET	: 특정 정보 조회
# - POST	: 새로운 정보 등록
# - PUT	: 기존 특정 정보 갱신
# - DELETE : 기존 특정 정보 삭제

# HTTP 상태 코드 그룹 별 내용
# 1xx	: Informational (조건부 응답)	- 리퀘스트를 받고, 처리 중에 있음
# 2xx	: Success (성공)	- 리퀘스트를 정상적으로 처리함
# 3xx	: Redirection (리디렉션)	- 리퀘스트 완료를 위해 추가 동작이 필요함
# 4xx	: Client Error (클라이언트 오류)	- 클라이언트 요청을 처리할 수 없어 오류 발생
# 5xx	: Server Error (서버 오류)	- 서버에서 처리를 하지 못하여 오류 발생

# 2.3 HTML과 CSS -----

# 2.3.1 HTML 기본 구조 -----

# ```
# <html>
#   <head>
#   <title>Page Title</title>
#   </head>
#   
#   <body>
#   <h2> This is page heading </h2>
#   <p> THis is first paragraph text </p>
#   </body>
# </html>
# ```

# 2.3.2 태그와 속성  -----

# HTML 코드는 태그와 속성, 내용으로 이루어져 있습니다. 크롤링한 데이터에서 특정 태그의 데이터만을 찾는 방법, 특정 속성의 데이터만을 찾는 방법, 뽑은 자료에서 내용만을 찾는 방법 등 내용을 찾는 방법이 모두 다르기 때문에 태그와 속성에 대해 좀 더 자세히 살펴보겠습니다.

# 2.3.3 h 태그와 p 태그 -----

# h 태그는 폰트의 크기를 나타내는 태그이며, p 태그는 문단을 나타내는 태그입니다. 이를 사용한 간단한 예제는 다음과 같습니다. h 태그의 숫자가 작을수록 텍스트 크기는 커지는 것이 확인되며, 숫자는 1에서 6까지 지원됩니다. p 태그를 사용하면 각각의 문단이 만들어지는 것이 확인됩니다.

# ```
# <html>
#   <body>
#   
#   <h1>Page heading: size 1</h1>
#   <h2>Page heading: size 2</h2>
#   <h3>Page heading: size 3</h3>
#   
#   <p>Quant Cookbook</p>
#   <p>By Henry</p>
#   
#   </body>
#   </html>
# ```

# 2.3.4 리스트를 나타내는 ul 태그와 ol 태그 -----

# ul과 ol 태그는 리스트(글머리 기호)를 만들 때 사용됩니다. ul은 순서가 없는 리스트(unordered list), ol은 순서가 있는 리스트(ordered list)를 만듭니다.
# ul 태그로 감싼 부분은 글머리 기호가 순서가 없는 •으로 표현되며, ol 태그로 감싼 부분은 숫자가 순서대로 표현됩니다. 각각의 리스트는 li를 통해 생성됩니다.

# ```
# <html>
#   <body>
#   
#   <h2> Unordered List</h2>
#   <ul>
#   <li>Price</li>
#   <li>Financial Statement</li>
#   <li>Sentiment</li>
#   </ul>  
#   
#   <h2> Ordered List</h2>
#   <ol>
#   <li>Import</li>
#   <li>Tidy</li>
#   <li>Understand</li>
#   <li>Communicate</li>
#   </ol> 
#   
#   </body>
# </html>
# ```

# 2.3.5 table 태그 -----

# table 태그는 표를 만드는 태그입니다.
# table 태그 내의 tr 태그는 각 행을 의미합니다. 각 셀의 구분은 th 혹은 td 태그를 통해 구분할 수 있습니다. 
# th 태그는 진하게 표현되므로 주로 테이블의 제목에 사용되고, td 태그는 테이블의 내용에 사용됩니다.

# 2.3.6 a 태그와 src 태그 및 속성 ---

# a 태그와 src 태그는 다른 태그와는 다르게, 혼자 쓰이기보다는 속성과 결합해 사용됩니다. 
# a 태그는 href 속성과 결합해 다른 페이지의 링크를 걸 수 있습니다. src 태그는 img 속성과 결합해 이미지를 불러옵니다.
# a 태그 뒤 href 속성의 속성값으로 연결하려는 웹페이지 주소를 입력한 후 내용을 입력하면, 내용 텍스트에 웹페이지의 링크가 추가됩니다. 
# img 태그 뒤 src 속성의 속성값에는 불러오려는 이미지 주소를 입력하며, width 속성과 height 속성을 통해 이미지의 가로세로 길이를 조절할 수도 있습니다. 
# 페이지 내에서 링크된 주소를 모두 찾거나, 모든 이미지를 저장하려고 할 때 속성값을 찾으면 손쉽게 원하는 작업을 할 수 있습니다.

# 2.3.7 div 태그 -----

# div 태그는 화면의 전체적인 틀(레이아웃)을 만들 때 주로 사용하는 태그입니다. 
# 단독으로도 사용될 수 있으며, 꾸밈을 담당하는 style 속성과 결합되어 사용되기도 합니다.
# div 태그를 통해 총 세 개의 레이아웃으로 나누어진 것을 알 수 있습니다. 
# style 속성 중 background-color는 배경 색상을, color는 글자 색상을 의미하며, 각 레이아웃마다 다른 스타일이 적용되었습니다.

# 2.3.8 CSS -----

# CSS는 앞서 설명했듯이 웹페이지를 꾸며주는 역할을 합니다. head에서 각 태그에 CSS 효과를 입력하면 본문의 모든 해당 태그에 CSS 효과가 적용됩니다. 
# 이처럼 웹페이지를 꾸미기 위해 특정 요소에 접근하는 것을 셀렉터(Selector)라고 합니다.
# head 태그 사이에 여러 태그에 대한 CSS 효과가 정의되었습니다. 먼저 body의 전체 배경 색상을 powderblue로 설정했으며, h4 태그의 글자 색상은 파란색(blue)으로 설정했습니다. 
# body 태그 내에서 style에 태그를 주지 않더라도, CSS 효과가 모두 적용되었음이 확인됩니다.

# 2.3.9 클래스와 id -----

# CSS를 이용하면 본문의 모든 태그에 효과가 적용되므로, 특정한 요소(Element)에만 동일한 효과를 적용할 수 없습니다. 
# 클래스 속성을 이용하면 동일한 이름을 가진 클래스에는 동일한 효과가 적용됩니다.

# 셀렉터를 클래스에 적용할 때는 클래스명 앞에 마침표(.)를 붙여 표현합니다. 
# id 또한 이와 비슷한 역할을 하며, HTML 내에서 여러 개의 클래스가 정의될 수 있는 반면, id는 단 하나만 사용하기를 권장합니다.

# 셀렉터를 id에 적용할 때는 클래스명 앞에 샵(#)를 붙여 표현하며, 페이지에서 한 번만 사용된다는 점을 제외하면 클래스와 사용 방법이 거의 동일합니다. 
# 클래스나 id 값을 통해 원하는 내용을 크롤링하는 경우도 많으므로, 각각의 이름 앞에 마침표(.)와 샵(#) 을 붙여야 한다는 점을 꼭 기억하기 바랍니다.
    
# HTML과 관련해 추가적인 정보가 필요하거나 내용이 궁금하다면 아래 웹사이트를 참고하기 바랍니다.
# - w3schools: https://www.w3schools.in/html-tutorial/
# - 웨버 스터디: http://webberstudy.com/

# 2.4 파이프 오퍼레이터(%>%) -----

# 파이프 오퍼레이터는 R에서 동일한 데이터를 대상으로 연속으로 작업하게 해주는 오퍼레이터(연산자)입니다. 
# 크롤링에 필수적인 rvest 패키지를 설치하면 자동으로 magrittr 패키지가 설치되어 파이프 오퍼레이터를 사용할 수 있습니다.

# 예제
# 1. 각 값들의 로그값을 구할 것 : log()
# 2. 로그값들의 계차를 구할 것 : diff()
# 3. 구해진 계차의 지수값을 구할 것 : exp()
# 4. 소수 둘째 자리까지 반올림할 것 : round()

x = c(0.3078, 0.2577, 0.5523, 0.0564, 0.4685,
      0.4838, 0.8124, 0.3703, 0.5466, 0.1703)

x1 = log(x)
x2 = diff(x1)
x3 = exp(x2)
round(x3, 2)
# [1] 0.84 2.14 0.10 8.31 1.03 1.68 0.46 1.48 0.31

round(exp(diff(log(x))), 2)
# [1] 0.84 2.14 0.10 8.31 1.03 1.68 0.46 1.48 0.31

library(magrittr)
x %>% log() %>% diff() %>% exp() %>% round(., 2)
# [1] 0.84 2.14 0.10 8.31 1.03 1.68 0.46 1.48 0.31

# 2.5 오류에 대한 예외처리 -----

# 크롤링을 이용해 데이터를 수집할 때 일반적으로 for loop 구문을 통해 수천 종목에 해당하는 웹페이지에 접속해 해당 데이터를 읽어옵니다. 
# 그러나 특정 종목에 해당하는 페이지가 없거나, 단기적으로 접속이 불안정할 경우 오류가 발생해 루프를 처음부터 다시 실행해야 하는 번거로움이 있습니다. 
# tryCatch() 함수를 이용하면 예외처리, 즉 오류가 발생할 경우 이를 무시하고 넘어갈 수 있습니다.

# tryCatch() 구조
# ```
# result = tryCatch({
#   expr
# }, warning = function(w) {
#   warning-handler-code
# }, error = function(e) {
#   error-handler-code
# }, finally = {
#   cleanup-code
# })
# ```

# 먼저 expr는 실행하고자 하는 코드를 의미합니다. warning은 경고를 나타내며, warning-handler-code는 경고 발생 시 실행할 구문을 의미합니다. 
# 이와 비슷하게 error와 error-handler-code는 각각 오류와 오류 발생 시 실행할 구문을 의미합니다. 
# finally는 오류의 여부와 관계 없이 무조건 수행할 구문을 의미하며, 생략할 수도 있습니다.

# 예제 : 문제
number = data.frame(1,2,3,"4",5, stringsAsFactors = FALSE)
str(number)

for (i in number) {
  print(i^2)
}
# [1] 1
# [1] 4
# [1] 9
# Error in i^2 : 이항연산자에 수치가 아닌 인수입니다

# 예제 : tryCatch() 활용 해결
for (i in number) {
  tryCatch({
    print(i^2)
  }, error = function(e) {
    print(paste('Error:', i))
  })
}
# [1] 1
# [1] 4
# [1] 9
# [1] "Error: 4"
# [1] 25

# expr 부분은 print(i^2)이며, error-handler-code 부분은 오류가 발생한 i를 출력합니다. 
# 해당 코드를 실행하면 문자 4에서 오류가 발생함을 알려준 후 루프가 멈추지 않고 다음으로 진행됩니다.