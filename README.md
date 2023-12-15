# SwiftUI 이슈 해결 및 테스트를 위한 프로젝트

1. Divider

- 기본으로 제공되는 SwiftUI의 Divider의 이슈를 확인하고 커스텀 Divider를 만들기 위해 테스트

2. NavigationView

- NavigationView의 루트 이동을 변수를 Coordinator에 담아 처리 하기 위한 테스트
- NavigationLink의 isActive로 전달된 값은 네비게이션 이동이 따라 false -> true로 변경된다
- 변경된 값이 true이면 루트가 아직 활성화 상태를 의미하면 해당 값을 false로 바꾸는 순간 네비게이션 동작을 끝내고 RootView로 돌아가게 된다
