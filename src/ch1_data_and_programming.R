# Chapter 1 퀀트 투자의 심장: 데이터와 프로그래밍 -----
# - https://hyunyulhenry.github.io/quant_cookbook/%ED%80%80%ED%8A%B8-%ED%88%AC%EC%9E%90%EC%9D%98-%EC%8B%AC%EC%9E%A5-%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%99%80-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D.html

# 1.1 데이터 구하기 -----
# - 해외 데이터 수집에는 블룸버그 혹은 Factset, 국내 데이터 수집에는 DataGuide가 흔히 사용
# - 아쉽게도 이러한 데이터에서 한국 시장의 정보는 소외되어 있습니다. 
# - 따라서 돈을 들이지 않고 국내 데이터를 얻기 위해서는 직접 발품을 파는 수밖에 없습니다.
# - 야후 파이낸스3(https://finance.yahoo.com/) 혹은 국내 금융 웹사이트에서 제공하는 정보를 크롤링해 데이터를 수집할 수 있습니다.

# 1.2  퀀트 투자와 프로그래밍 ------
# - 엑셀을 이용해도 간단한 형태의 백테스트 및 종목 선정은 얼마든지 가능합니다. 그러나 응용성 및 효율성의 측면에서 엑셀은 매우 비효율적입니다.

# 1.3 R 프로그램 -----
# - R의 장점은 무료라는 점 이외에도 타 언어와 비교할 수 없이 다양한 패키지가 있다는 점입니다. 
# - R은 두터운 사용자층을 기반으로 두고 있어 상상할 수 없을 정도로 패키지가 많으며, 특히 통계나 계량분석과 관련된 패키지는 독보적이라고 할 수 있습니다.

# 1.4 퀀트 투자에 유용한 R 패키지 -----
# - quantmod: 이름에서 알 수 있듯이 퀀트 투자에 매우 유용한 패키지입니다. API를 이용해 데이터를 다운로드하는 getSymbols() 함수는 대단히 많이 사용됩니다. 
#             이 외에도 볼린저밴드, 이동평균선, 상대강도지수(RSI) 등 여러 기술적 지표를 주가 차트에 나타낼 수도 있습니다.
# - PerformanceAnalytics: 포트폴리오의 성과와 위험을 측정하는 데 매우 유용한 패키지입니다. 
#                         Return.portfolio() 함수는 포트폴리오 백테스트에 필수적인 함수입니다.
# - xts: 기본적으로 금융 데이터는 시계열 형태이며, xts 패키지는 여러 데이터를 시계열 형태(eXtensible TimeSeries)로 변형해줍니다.
#        일별 수익률을 월별 수익률 혹은 연도별 수익률로 변환하는 apply.monthly()와 apply.yearly() 함수, 데이터들의 특정 시점을 찾아주는 endpoints() 함수 역시 백테스트에 필수적으로 사용되는 함수입니다. 이 패키지는 PerformanceAnalytics 패키지 설치 시 자동으로 설치됩니다.
# - zoo: zoo 패키지 역시 시계열 데이터를 다루는 데 유용한 함수가 있습니다. rollapply() 함수는 apply() 함수를 전체 데이터가 아닌 롤링 윈도우 기법으로 활용할 수 있게 해주며, NA 데이터를 채워주는 na.locf() 함수는 시계열 데이터의 결측치를 보정할 때 매우 유용합니다.
# - httr & rvest: 데이터를 웹에서 수집하기 위해서는 크롤링이 필수이며, httr과 rvest는 크롤링에 사용되는 패키지입니다. httr은 http의 표준 요청을 수행하는 패키지로서 단순히 데이터를 받는 GET() 함수와 사용자가 필요한 값을 선택해 요청하는 POST() 함수가 대표적으로 사용됩니다. rvest는 HTML 문서의 데이터를 가져오는 패키지이며, 웹페이지에서 데이터를 크롤링한 후 원하는 데이터만 뽑는데 필요한 여러 함수가 포함되어 있습니다.
# - dplyr: 데이터 처리에 특화되어 R을 이용한 데이터 과학 분야에서 많이 사용되는 패키지입니다. 
#          C++로 작성되어 매우 빠른 처리 속도를 보이며, API나 크롤링을 통해 수집한 데이터들을 정리할 때도 매우 유용합니다.
# - ggplot2: 데이터를 시각화할 때 가장 많이 사용되는 패키지입니다. 물론 R에서 기본적으로 내장된 plot() 함수를 이용해도 시각화가 가능하지만, 해당 패키지를 이용하면 훨씬 다양하고 깔끔하게 데이터를 그림으로 표현할 수 있습니다.

pkg = c('magrittr', 'quantmod', 'rvest', 'httr', 'jsonlite',
        'readr', 'readxl', 'stringr', 'lubridate', 'dplyr',
        'tidyr', 'ggplot2', 'corrplot', 'dygraphs',
        'highcharter', 'plotly', 'PerformanceAnalytics',
        'nloptr', 'quadprog', 'RiskPortfolios', 'cccp',
        'timetk', 'broom', 'stargazer', 'timeSeries')

new.pkg = pkg[!(pkg %in% installed.packages()[, "Package"])]

if (length(new.pkg)) {
  install.packages(new.pkg, dependencies = TRUE)}
