# SwiftUI 이슈 해결 및 테스트를 위한 프로젝트

1. Divider

- 기본으로 제공되는 SwiftUI의 Divider의 이슈를 확인하고 커스텀 Divider를 만들기 위해 테스트
- 기본 제공되는 divider의 경우 HStack, VStack에 따라 적용되며 기본 형태로 사용하기에 적합하다
- 단, frame 으로 size를 변경하는 작업이 불가능하여, frame 및 background Modifier를 사용하거나, frame, overlay를 사용하면 된다.
- 그러나 투명도를 설정하면 디폴트 divider 가 내부에 보이기 때문에 커스텀 디바이더를 만들어서 사용하면 좋다.

2. NavigationView

- NavigationView의 루트 이동을 변수를 Coordinator에 담아 처리 하기 위한 테스트
- NavigationLink의 isActive로 전달된 값은 네비게이션 이동이 따라 false -> true로 변경된다
- 변경된 값이 true이면 루트가 아직 활성화 상태를 의미하면 해당 값을 false로 바꾸는 순간 네비게이션 동작을 끝내고 RootView로 돌아가게 된다
