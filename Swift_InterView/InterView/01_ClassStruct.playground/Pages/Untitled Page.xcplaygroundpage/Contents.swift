import UIKit

/*
 1. What are the values of tutorial1.difficulty and tutorial2.difficulty? Would this be any different if Tutorial was a class? Why or why not?
 
 */
struct Tutorial {
  var difficulty: Int = 1
}

var tutorial1 = Tutorial()
var tutorial2 = tutorial1
tutorial2.difficulty = 2

/*
  구조체는 값타입으로 복사되어 진다. 코드/스택에 저장
    tutorial1.difficulty = 1
    tutorial2.difficulty = 2
  클래스는 코드/힙(인스턴스)/스택(인스턴스주소)에 저장
 */


/*
 힙
  Heap에 메모리를 할당하려면, 실제로 Heap 데이터 구조를 검색(search)하여 사용되지 않는 적절한 크기의 블록을 찾아야해요.
 그리고 모든 작업이 끝나고, 할당을 해제하려면 해당 메모리를 또 적절한 위치로 다시 삽입(reinsert)해야해요.
 검색하고..재삽입하고..딱봐도 Stack보다 복잡한 것을 볼 수 있습니다. 하지만 지금말한 것들은 Heap 할당과 관련된 주요 비용들은 아니에요;;;;
 가장 큰 복잡함은, 여러 쓰레드가 동시에 Heap에 메모리를 할당 할 수 있기때문에, Heap은 locking 또는 기타 동기화 메커니즘을 사용해서 무결성(integrity)을 보호해야합니다;; 이게 Heap 할당에서 가장 큰 비용이라고 할 수 있어요.



 출처: https://zeddios.tistory.com/596
 */
//string 은 Struct 인데 왜 힙에 저장? https://babbab2.tistory.com/35
//https://www.slideshare.net/YongHaYoo/ss-63881606
/*
 String은 value semantics 이지만, 내부 storage로 class 타입을 가지고 있음
 Copy시 해당 프로퍼티에 reference counting 이 작동한다.
 Array, Dictionary도마찬가지 이다.
 
 */
var view1 = UIView()
view1.alpha = 0.5

let view2 = UIView()
view2.alpha = 0.5 // Will this line compile?


