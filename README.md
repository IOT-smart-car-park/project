# IoT Parking Lot
摘要：
-----
現階段中小型停車場仍重度仰賴成本高昂、但服務品質參差不齊的人工收費管理。對經營者而言，人工收費管理最常見的問題，就是效率偏低，若建置市面上整套現有的智慧停車場系統，有費用過於高昂等問題。另外，在使用者體驗方面，則常見如：缺少空車位導航、在席車位導航、出入口及繳費機永遠大排長龍、票卡遺失無法繳費等等不便之處。為解決上述問題，遂設計一套低成本、低功耗、即時智慧感測與實務解決方案結合之「智慧物聯網停車場系統」，提供使用者「從進場到出場一路到底自動化服務」。

本專案基於「簡單、強大、低功耗」的Raspberry Pi 3B作為主要設備，連結數個感測器，以無線網路傳送各感測訊號至後端資料庫並交互控制各設備之作動。其中，MCU以TCP/IP通訊協定獲取伺服器剩餘車位顯示，並導引貴賓駛入空車位，另可在Web實現繳費、尋車導航等功能。專案中運用OpenALPR、YOLO5 兩套開源程式，分別以串接API及自行訓練模型方式，實現出入口設備(靜態)及車格上方設備(動態)之車牌辨識；使用Node.js函式庫存取資料庫(MySQL)；Web方面以JavaScript、CSS、SVG設計網頁UI介面及優化UX體驗；整套系統以MQTTv 3.1.1通訊協定在各設備與伺服器間交互溝通並作動，以達成「智慧物聯網停車場」建置目的。

關鍵詞：**Raspberry pi 3B、Python3、Yolo5、Pytorch、CUDA、Image Detection、Open CV、Machine Learning、Tesseract、OpenALPR、Node.js、JavaScript、MQTT 、C、Git、MySQL、Html、Css、Linux、Makefile、Cortex-M0、TCP/IP、Bootstrap**

系統架構圖：
![架構圖](https://github.com/IOT-smart-car-park/project/blob/main/structure_%E6%99%BA%E6%85%A7%E5%81%9C%E8%BB%8A%E5%A0%B4.png)
structure by : RAKULO [editor](https://github.com/RAKULO)