# 🌐counter_10000

## 🔍 Project Overview

> 이 프로젝트는 FPGA 기반 10000 카운터 시스템으로, Verilog HDL을 사용하여 구현된 디지털 카운터 및 디스플레이 제어 시스템입니다

## 🎛️ 핵심 설계 기여 

**1. RTL 설계:**
    - **System Block Diagram 설계 :**  
    - **FSM Design**: System block diaram 기반, port mapping, FSM 설계등 수행


**2. Simulation 기반 코드 debugging :**
<img width="649" height="148" alt="image" src="https://github.com/user-attachments/assets/1414b2a5-8bf8-4d9a-a251-ffc760c6beab" />


## 🏗️ System Architecture
<img width="5804" height="2764" alt="image" src="https://github.com/user-attachments/assets/73843993-c1b5-4c0d-9ac4-3482a664b794" />

### 📁 Project Structure
```
**counter_10000_top/**           # 최상위 모듈, fnd_controller & datapath_10000모듈을 mapping.
├── 📁 fnd_controller/      #FND 디스플레이 제어 모듈. 14비트 카운터 입력을 받아 4자리 숫자로 분리하고, mux 및 decoder를 활용해 FND에 표시.
│   ├── clk_div.v               # System clk(100MHz)를 분주하여 1kHz 펄스를 생성. FND의 디지트 스캔 속도를 제어
│   ├── counter_4.v             # counter값이 1kHz clk을 기반으로증가하며, digit_sel으로 사용됨.
│   ├── decoder_2x4.v           # FND의 공통 핀을 제어해 FND의 특정 digit을 활성화. 
│   ├── digit_spliter.v         # 4비트 입력 데이터를 1의 자리, 10의 자리, 100의 자리, 1000의 자리로 분리합니다. 
│   ├── mux_4x1.v      # 각 자리의 bi값을 2비트 셀렉터로 선택해 하나의 4비트 BCD 출력을 생성합니다. Digit의 순환 표시를 위해 사용됨.
│   └── bcd_decodr.v           #4비트 BCD 입력을 7-segment display용 8비트 데이터로 변환(Refer to Datasheet)
│
├── 📁 datapath_10000/             # fnd_controller로 전달할 data(0 ~ 9999) 생성.
    ├── tick_gen_10hz.v              # Sys lk을 받아 10Hz 주기의 틱 신호를 생성. 이는 카운터의 속도를 제어하는 데 사용.
    └── counter_10000.v              #  0부터 9999까지 카운트하는 14비트 카운터. 10Hz 틱 신호로 증가.
```


## 🚀 Key Features
- **Counting Functionality:**: 0부터 9999까지의 14비트 카운터를 10Hz 주기로 증가시키며, 리셋 버튼으로 초기화 가능.
- **Display Functionality:**: 0부터 9999까지의 14비트 카운터를 10Hz 주기로 증가시키며, 리셋 버튼으로 초기화 가능.
- **Timing Control:**: 입력 클럭을 분주하여 10Hz 카운팅 틱과 1kHz 디스플레이 스캔 신호를 생성.


## 📋 Prerequisites
- **Hardware**: Basys3 FPGA Board
- **Software**: 
  - Xilinx Vivado (FPGA 개발용)

## 🚨 Troubleshooting
- Run#0
   - digit_1은 정상적으로 0 ~ 9까지 증가.
   - digit_10의 값이 0 ~ 1 까지만 증가하는 현상 발생.  

## 🛠️ Debugging
- 코드 디버깅 결과, digit_spliter로 입력되는 w_counter가 [3:0]로 선언되어 있어, 17이상의 값이 trunctaion되는 현상이 발생했음.
   -<img width="360" height="354" alt="image" src="https://github.com/user-attachments/assets/fa34ed1c-bb66-4e72-8835-a52412ead35b" />
- w_counter를 [13:0]로 수정한 결과 , 0 ~ 9999의 값이 정상적으로 counting됨을 확인.

---
