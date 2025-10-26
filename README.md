# 🧓 잼잼 JAMJAM

![jamjam](https://github.com/user-attachments/assets/a7c78b6f-e0a1-41c8-a3e4-6a44600aa689)

> **"잊혀지는 경력이 아니라, 이어지는 기회가 되도록"**  
고령층의 삶을 더 풍요롭고 연결되게 만드는 플랫폼,  
**잼잼**이 그 시작을 만들어갑니다.

<br>

## 🚀 프로젝트 소개

잼잼은 고령층이 쌓아온 삶의 경험과 전문성을  
쉽고 빠르게 외주 서비스로 연결하는  
생성형 AI 기반 **경력 재발견 플랫폼**입니다.

복잡한 디지털 환경에 익숙하지 않아도,  
몇 가지 입력만으로 나만의 서비스 페이지가 완성되고,  
곧바로 고객과 연결될 수 있도록 돕습니다.

<br>

## 👥 팀원 소개
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/itwillbeoptimal.png" width="80"><br>
      <a href="https://github.com/itwillbeoptimal"><b>김지훈</b></a>
    </td>
    <td align="center">
      <img src="https://github.com/Kwon-HyeongIl.png" width="80"><br>
      <a href="https://github.com/Kwon-HyeongIl"><b>권형일</b></a>
    </td>
    <td align="center">
      <img src="https://github.com/kokeunho.png" width="80"><br>
      <a href="https://github.com/kokeunho"><b>고근호</b></a>
    </td>
    <td align="center">
      <img src="https://github.com/leesy010504.png" width="80"><br>
      <a href="https://github.com/leesy010504"><b>이상윤</b></a>
    </td>
  </tr>
  <tr>
    <td align="center">FE · 팀장</td>
    <td align="center">iOS</td>
    <td align="center" colspan="2">BE</td>
  </tr>
</table>

<br>

## 🔥 문제 인식

- **고령 사회로 빠르게 진입하는 우리 사회**  
- 그러나 고령층은 여전히 디지털 외주 시장에서 소외되고 있습니다.
- 경력과 전문성은 충분하지만,  
  이력서 작성, 자기소개, 이미지 제작 같은 진입 장벽이 높아  
- 수많은 잠재력이 사회에서 사장되고 있는 상황입니다.

<br>

## 💡 우리의 솔루션

- **간단한 텍스트 입력 → AI 자동 콘텐츠 생성**  
- **직관적인 UI/UX**로 누구나 쉽게 검토 및 수정 가능하며,  
- 곧바로 **외주 서비스 등록**까지 이어집니다.

<br>

## 🎯 기대 효과

- 고령층의 **사회적 고립 완화** 및 새로운 역할 부여  
- 고령층의 **풍부한 경력을 시장과 연결해 자립 지원**  
- 생성형 AI의 **윤리적·사회적 활용 사례** 제시

<br>

## ⚙️ 기술적인 부분 (iOS)

- **Keychain 기반 보안 토큰 관리**: 액세스 토큰을 Keychain에 저장·갱신·삭제하는 로직을 AuthCore에 통합하여 자동 로그인/로그아웃 흐름과 사용자 식별까지 안전하게 유지하도록 설계하고, 토큰 재발급 시에도 Keychain을 통해 갱신된 토큰을 저장하도록 구현했습니다. 또한 FCM 디바이스 토큰 등 디바이스 단위 식별 정보도 AuthCore 레벨에서 관리하도록 구조화하였습니다. 

- **실시간 채팅 인프라**: WebSocket 기반 STOMP 클라이언트인 SwiftStomp를 사용해 자동 재연결, ping, 연결 상태 스트리밍, 메시지 수신 스트림을 포함한 실시간 채팅 파이프라인을 구축하고, STOMP 연결 상태와 채팅 메시지를 Combine 기반 Publisher로 뷰모델에 브로드캐스트하여 UI가 실시간으로 갱신되도록 구현하였습니다. 

- **AI 기반 외주 홍보 컨텐츠 자동 생성**: OpenAI API를 활용한 2단계 서버 파이프라인(서비스 소개 / 썸네일 이미지 자동 생성 / 제목 추천 등)을 iOS 클라이언트와 연결하고, 생성된 결과물을 바로 서비스 등록 플로우에서 활용할 수 있도록 등록 및 검수까지 한 번에 이어지는 UX를 구성했습니다. 

- **인앱 WYSIWYG 뷰어**: WebView로 서비스 소개 컨텐츠 뷰어를 내장하고, iOS 화면에서 웹 화면 실제 렌더 형태 그대로 편집·확인할 수 있는 WYSIWYG 뷰어 기능을 구현했습니다. 

- **선택적 알림 구독**: FCM 토픽 구독 상태에 따른 알림 관리 서버와 iOS 클라이언트를 연결하여 특정 토픽 알림만 수신하도록 하는 기능을 구현했습니다.

