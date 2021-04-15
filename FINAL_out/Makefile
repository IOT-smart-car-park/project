CC=gcc
INC=-I./ -I./include  #! -I/path就是要搜尋相關的include檔案  **補充  預設值是放置在 /usr/include 底下，除非你的 include 檔案放置在其他路徑
CFLAG=-lpthread -L./src  #! 表示我要-l link libpthread.o 這個函數庫時(lib和.o不寫), 請到-L./src去找  **補充  注意的是，由於 Linux 預設是將函式庫放置在 /lib 與 /lib64 當中，所以你沒有寫 -L/lib 與 -L/lib64 也沒有關係的！不過，萬一哪天你使用的函式庫並非放置在這兩個目錄下，那麼 -L/path 就很重要了！否則會找不到函式庫喔！
DEBUG=-DMYDEBUG  #! -D定義聚集名稱
SERVO=-I../../src -lmosquitto -D_PI2_

.PHONY: all clean install

VPATH= src

app: mqtt+motor+oled.c liboled.a  
	$(CC) $< -loled -o $@ $(INC) $(CFLAG) $(SERVO)
	#! gcc main+motor+oled.c -loled -o app -I./ -I./include -lpthread -L./src -I../../src -lmosquitto -D_PI2_
	#! $< 第一個必要條件的檔名 , $@ 工作目標檔名
liboled.a:
	$(MAKE) -C src 
	#! 用 $(MAKE) 變數，代替可能是其他名稱的Make執行檔 , 像Windows上可能是 mingw32-make，而非 make。
	#! -C 代表只把程式碼編譯成目的檔.o
clean:
	-rm -rf app;rm -rf *.o
	$(MAKE) -C src clean

#install: 
#	cp app /bin

#app: main.c liboled.a  
#	gcc $< -loled -o $@ -I./ -I./include -lpthread -L./src
# ============================================================================================================
##下面for mqtt+servo用
## gcc -o mqtt+motor -I../pi-sensor/src ../pi-sensor/src/bcm2835.c mqtt+motor.c -lmosquitto -D_PI2_