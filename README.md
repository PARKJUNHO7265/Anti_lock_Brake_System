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
먼저 차량에 대한 방정식을 구해보자.

![image](https://user-images.githubusercontent.com/87568714/207838567-5519928c-20d6-4bf0-99a4-43a4a5e94645.png)</br>
Ff는 차량의 바퀴와 지면과의 마찰력, Fi는 차량의 관성력, N은 수직력, W는 차량의무게이다.</br>
이때 다음과 같은 방정식이 성립한다.</br>
F_f = F_i ~~~ N = W</br>
Ff는 다음과 같이 나타낼수 있다.(g는 중력가속도, mv는 차량무게(kg))</br>
F_f = μ ⋅ N ~~~ W = m_v ⋅ g ~~~ F_f = μ ⋅ m_v ⋅ g</br>
Fi는 mv와 차량가속도의 곱으로 나타낼수 있으므로 다음과 같이 나타낼수 있다.</br>
F_i = m_v ⋅ a_v = m_v ⋅ dv_v / dt</br>
Ff와 Fi 두 식을 조합하면 차량의 가속도에 대한 방정식을 아래와 같이 구할수 있다.</br>
① dv_v / dt = 1 / m_v ⋅ (μ ⋅ m_v ⋅ g)</br>

다음은 바퀴에 대한 방정식이다.

![image](https://user-images.githubusercontent.com/87568714/207837124-c55f4b68-7dae-4f1e-86dd-a93b8b28a2e1.png)</br>
rw는 바퀴의 반지름, Ww는 바퀴의 각속도, Tb는 브레이크 토크이다.
이때 다음과 같은 방정식이 성립한다.
T_b – F_f ⋅ r_w – J_w ⋅ dω_w / dt = 0
이를 정리하면 바퀴 가속도에 대한 방정식을 다음과 같이 구할수 있다.</br>
② dω_w / dt = 1 / J_w ⋅ (T_b – F_f ⋅ r_w)
마지막으로 슬립에 대한 방정식은 아래와 같다.</br>
③ s = 1 – ω_w / ω_v
<h3>ABS 모델링</h3>
먼저 바퀴에 대한 모델링이다. 타이어 토크와 브레이크 토크의 차를 적분한것이 바퀴 속도와 같다.

![image](https://user-images.githubusercontent.com/87568714/208230797-e4c8bc26-98f6-42f6-9635-6fe560c1dcd3.png)</br>

다음은 슬립을 계산하는 모델이다. 바퀴 바퀴각속도를 차량의 각속도로 나누고 이를 1에서 뺀 것이 슬립이다.

![image](https://user-images.githubusercontent.com/87568714/208231399-24ced8ad-df65-4c9f-bffb-3527ac13818c.png)</br>

다음은 차량의 속도, 타이어 토크 등을 계산하는 모델이다. 해당 모델을 통해 타이어 토크, 차량의 각속도, 정지거리 등을 구할 수 있다.

![image](https://user-images.githubusercontent.com/87568714/208232813-e52ce906-bd2f-494f-9fcf-2ca25940b453.png)

마지막으로 제어기 모델이다. Bang-Bang controller를 사용하며 error값을 받아 브레이크 토크를 출력한다.

![image](https://user-images.githubusercontent.com/87568714/208232549-78d1c22f-beaf-4766-a58b-d51146cfd73b.png)

최종적으로 완성된 모델은 다음과 같다.

![image](https://user-images.githubusercontent.com/87568714/208232833-e82bc6bc-a112-40ec-b0e5-57e77e165df5.png)

<h3>ABS를 적용한 시뮬레이션 결과</h3>
25초 동안 위 모델을 시뮬레이션 하였으며 slip에 대한 그래프는 다음과 같았다.

![image](https://user-images.githubusercontent.com/87568714/208233133-afb2d3c8-fa36-43a1-80c3-b852abd19611.png)

대략 20초 동안 slip이 0.2에 가깝도록 제어되고 22초 가량에 차량이 완전히 정지된것을 확인할 수 있다.
다음은 바퀴와 차량의 속도에 대한 그래프이다.

![image](https://user-images.githubusercontent.com/87568714/208233291-f8eaddb1-471a-461d-888c-985bd90fb18c.png)

바퀴의 속도가 급격하게 감소하여 잠기는 현상을 방지하는 제어기가 잘 작동되는것을 확인할 수 있다.

<h3>ABS를 제외한 시뮬레이션 결과</h3>

![image](https://user-images.githubusercontent.com/87568714/208233543-efb0b125-283e-4db8-9cd3-2c350d198b06.png)

위와 같이 슬립에 대한 오차를 조정하는 부분에 Gain을 0으로 주어 ABS를 제거하고 시뮬레이션 해보았다.
결과는 다음과 같았다. slip은 원하는 값인 0.2에서 벗어나 꾸준히 증가하였으며,</br>
![image](https://user-images.githubusercontent.com/87568714/208233638-6a1a15d6-8cc4-496e-b315-d841b302b9f6.png)

![image](https://user-images.githubusercontent.com/87568714/208233515-fd8eb0fd-d23b-4b0e-b730-ce3e46b1b043.png)

바퀴의 속도 또한 매우 급격하게 줄어들어 잠김 현상이 발생하였다.
최종적으로 정지거리를 비교해보자.</br>
첫번째 사진은 ABS를 적용하지 않았을때 정지거리 그래프이며 두번째는 ABS를 적용한 경우이다.

![image](https://user-images.githubusercontent.com/87568714/208233746-71cc6d84-0be9-4565-be2c-33ba63b1e7ef.png)
![image](https://user-images.githubusercontent.com/87568714/208233814-64b3ca4b-018a-41c3-8f03-d447ffa1359c.png)

ABS를 적용한 경우가 대략 50m 정도 정지거리가 더 짧은것을 확인할 수 있다.

