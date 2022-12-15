<h3>주제</h3>
ABS 모델링
<h3>내용</h3>
ABS의 equation을 분석하고 이를 통해 ABS를 모델링해보자
<h3>사용언어</h3>  
MATLAB & SIMULINK

<h3>Anti Lock Brake System(ABS)는 무엇인가?</h3>
빠르게 달리는 자동차에서 브레이크를 강하게 밟아 제동을 걸면 바퀴가 노면에서 미끌어짐과 동시에 차량이 쭉 밀리게 되는데
이때 바퀴는 잠금상태에 있어 운전자가 조향을 통제하기도 어려울뿐만 아니라 제동거리도 길어지게되어 사고 발생 가능성이 높아진다.
따라서 브레이크를 나눠 밟게 되면 보다 안정적으로 조향을 통제할수 있으며 제동거리 또한 짧아지게된다.
ABS는 운전자가 브레이크를 강하게 밟았다 하더라도 자동적으로 브레이크를 나눠서 밟게 해주는 시스템이다.

<h3>ABS equation</h3>

![image](https://user-images.githubusercontent.com/87568714/207833777-cb9fe8bb-a6a9-43a5-8abf-a4486f081fda.png)</br>
Ff는 차량의 바퀴와 지면과의 마찰력, Fi는 차량의 관성력, N은 수직력, W는 차량의무게이다.
이때 다음과 같은 방정식이 성립한다.

![image](https://user-images.githubusercontent.com/87568714/207834535-4ed7cad8-6d61-4bcc-ac9a-e69a0f681269.png) ![image](https://user-images.githubusercontent.com/87568714/207834635-1d298d76-db3e-4fc9-857a-0aa73ffe8aff.png)</br>
Ff는 다음과 같이 나타낼수 있다.(g는 중력가속도, mv는 차량무게(kg))

![image](https://user-images.githubusercontent.com/87568714/207835332-644ef0b7-af65-4f31-afdd-2dc585b5a744.png) ![image](https://user-images.githubusercontent.com/87568714/207835434-88b8a1d9-021f-4deb-8796-062fcd98e732.png) ![image](https://user-images.githubusercontent.com/87568714/207835507-4d2c0dc4-33b7-4ed2-81bc-fd6dbf47bff9.png)
Fi는 mv와 차량가속도의 곱으로 나타낼수 있으므로 다음과 같이 나타낼수 있다.

![image](https://user-images.githubusercontent.com/87568714/207836191-0cfd896c-c808-477e-a72e-bb531d59734c.png)
Ff와 Fi 두 식을 조합하면 차량의 가속도에 대한 방정식을 아래와 같이 구할수 있다.

![image](https://user-images.githubusercontent.com/87568714/207836543-0ff3523c-e5f8-4255-9a87-d9a3ed73eade.png)
