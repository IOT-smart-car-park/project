//===========模組載入=======================
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const router = express.Router();
const path = require("path");
const fs = require("fs");
const multer = require("multer");
const Sequelize = require("sequelize");
const mysql = require('mysql');
const mqtt = require('mqtt');
//===========模組載入=========================

//=============環境設定=======================

const client = mqtt.connect('tcp://220.132.124.155:1883');//MQTT broker IP

app.use(bodyParser.urlencoded({ extended: false }))

var con = mysql.createConnection({ host: 'localhost', user: 'adam', password: 'good1234', database: 'car2' });//要連結的資料庫設定

con.connect(function (error) {
  if (error) throw error;//伺服器連線失敗顯示
  console.log("已經連線成功了！"); //伺服器連線成功顯示
});

app.get('/', function (req, res) {
  res.sendFile('index12.html', { root: __dirname });
});//主頁面顯示
//=============環境設定=======================

//===============車輛進場，新增一筆資料===================

var car_enter_no = ""; //宣告全域變數，用於進場的車號確認

app.post('/publish', function (req, res) {

  console.log('車號' + req.body.parameter + '進場了');
  car_enter_no = req.body.parameter;//進場車號傳給全域變數
  var current_date = new Date(Date.now() + 8 * 3600 * 1000);

  var sql = `INSERT INTO car_database (car_no, upload_time, ent_exit) VALUES ('${req.body.parameter}','${current_date.toISOString()}','ENTER');`;//1.將資料上傳到資料庫的程式碼(還沒執行上傳動作)

  con.query(sql, function (error, result) {//2.上傳執行
    if (error) throw error;//2_1 上傳失敗顯示error

    console.log('成功新增了 1 筆車號。');//2_2上傳成功在console顯示字串
  });

  res.writeHead(200, { 'Content-Type': 'application/text' });//3.選擇傳到前端的檔案格式
  res.end(req.body.parameter);//4.將資料傳到前端
});
//===============車輛進場，新增一筆資料===================

//============車輛離場，新增一筆資料======================


app.post('/exit', function (req, res) {

  console.log('車號' + req.body.parameter1 + '離場了');

  var current_date = new Date(Date.now() + 8 * 3600 * 1000);

  var sql = `INSERT INTO car_database (car_no, upload_time, ent_exit) VALUES ('${req.body.parameter1}','${current_date.toISOString()}','EXIT');`;

  con.query(sql, function (error, result) {
    if (error) throw error;

    console.log('成功新增了 1 筆車號。');
  });

  res.writeHead(200, { 'Content-Type': 'application/text' });
  res.end(req.body.parameter1);
});
//============車輛離場，新增一筆資料======================

//====================從資料庫搜尋車號，並計算出費用================================


app.post('/search', function (req, res) {

  console.log('搜尋車號 ' + req.body.parameter2);
  result1 = ""

  var sql_select = `SELECT car_no, upload_time,ent_exit,pay_state FROM car_database`;

  con.query(sql_select, function (error, result) {
    if (error) throw error;

    for (var i = 0; i < result.length; i++) {

      if (req.body.parameter2 == result[i].car_no) {
        console.log(result[i].car_no + ' ' + new Date(result[i].upload_time * 1 + 8 * 3600 * 1000) + ' ' + result[i].ent_exit + ' ' + result[i].pay_state);

        time = parseInt((new Date(Date.now()) - result[i].upload_time) / 1000 / 60 / 60);
        console.log('進場經過' + time + '小時');
        console.log('總計' + time * 20 + '元');

        result1 = { 'car_no': result[i].car_no, 'upload_time': new Date(result[i].upload_time * 1 + 8 * 3600 * 1000), 'ent_exit': result[i].ent_exit, 'pay_state': result[i].pay_state, 'fee': time * 20 };
        result2 = JSON.stringify(result1);

      }
    }

    res.writeHead(200, { 'Content-Type': 'application/json' });
    console.log(result1);
    res.end(result2);

  });
});
//====================從資料庫搜尋車號，並計算出費用================================

//=================繳費更新資料庫============================

app.post('/pay', function (req, res) {

  var sql_pay = `UPDATE car_database SET pay_state = '${req.body.parameter3}' WHERE car_no='${req.body.parameter2}'`;

  con.query(sql_pay, function (error, result) {
    if (error) throw error;

    console.log('繳費成功');
  });

  res.writeHead(200, { 'Content-Type': 'application/text' });
  res.end(req.body.parameter3);
});
//=================繳費更新資料庫============================


//====================從資料庫撈出所有資料================================


app.post('/alldata', function (req, res) {

  var sql_select1 = `SELECT * FROM car_database`;

  con.query(sql_select1, function (error, result) {
    if (error) throw error;


    alldata = JSON.stringify(result);
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(alldata);

  });
});

var all_data = "";

var alldata_update = setInterval(alldata, 1000);
function alldata() {
  var sql_select1 = `SELECT * FROM car_database`;

  con.query(sql_select1, function (error, result) {
    if (error) throw error;
    all_data = result;
  })
}
//====================從資料庫撈出所有資料================================


//=======================彥豪MCU==============================

app.get('/mcu', function (req, res) {
  console.log("MCU send data");
  var j = 0;
  for (i = 0; i < all_data.length; i++) {
    if (all_data[i].ent_exit == "ENTER") { j--; } else { j++; }
  }
  space = 500 + j;
  space_str = space.toString();
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(`left space@${space_str}`);
});

//=======================彥豪MCU==============================

//============應繳費用資料庫更新，於執行時更新一次======================
var fee_update1 = setTimeout(fee_update);
function fee_update() {

  var sql_select2 = 'SELECT * FROM car_database WHERE ent_exit = "ENTER"';

  con.query(sql_select2, function (error, result) {
    if (error) throw error;

    for (i = 0; i < result.length; i++) {
      fee1 = parseInt((new Date(Date.now()) - result[i].upload_time) / 1000 / 60 / 60) * 20;

      var sql_fee = `UPDATE car_database SET fee = '${fee1}' WHERE car_no='${result[i].car_no}' AND ent_exit = "ENTER"`;

      con.query(sql_fee, function (error, result) {
        if (error) throw error;
      })
    }
  })
  console.log("費用更新完成");
}

//===================應繳費用資料庫更新，於執行時更新一次=========

//===================圖片上傳====================================
//===============index.js========================================
//使用 sequelize 來上傳資料到database
const sequelize = new Sequelize("car2", "adam", "good1234", {
  host: "localhost",
  dialect: "mysql",
  operatorsAliases: false,// 設定連線池，因此如果您從單個程序連線到資料庫，理想情況下應該只為每個資料庫建立一個例項
});
const db = {}; //呼叫一個字典

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.images = function (sequelize, DataTypes) {
  const Image = sequelize.define("image", {
    data: {
      type: DataTypes.BLOB("long"),
    },
  });

  return Image;
}(sequelize, Sequelize);

//===============index.js===================================


//================web.js====================================

//----------middleware/upload.js-----------------
//使用 Multer module
const imageFilter = function (req, file, cb) {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb("Please upload only images.", false); //如果傳的不是圖片檔，會報錯。
  }
};

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, __basedir + "/image_storage/");
  },
  filename: function (req, file, cb) {
    cb(null, `車號_${car_enter_no}_+${file.originalname}`);
  },
});

var uploadFile = multer({
  storage: storage,
  fileFilter: imageFilter
});
//----------middleware/upload.js-----------------------

//----------controllers/upload.js----------------------
//照片上傳資料庫，並複製一份到資料夾路徑
const uploadFiles = async function (req, res) {
  try {
    console.log(req.file);

    if (req.file == undefined) {
      return res.send("You must select a file.");
    }

    db.images.create({
      data: fs.readFileSync(
        __basedir + "/image_storage/" + req.file.filename //上傳後照片儲存的路徑
      ),
    }).then(function (image) {
      fs.writeFileSync(
        __basedir + "/image_storage_temp/" + image.name,//上傳後照片儲存的路徑
        image.data
      );
      // console.log("image.data", image.data);
      return res.send(`File has been uploaded.`);
    });
  } catch (error) {
    console.log(error);
    return res.send(`Error when trying upload images: ${error}`);
  }
};

//---------controllers/upload.js----------------------

//===============web.js main==============================
let routes = function (app) {
  router.post("/upload", uploadFile.single("file"), uploadFiles);

  return app.use("/", router);
};

//==============web.js===================================

//===============main===================================
global.__basedir = __dirname;

app.use(express.urlencoded({ extended: true }));
routes(app);

db.sequelize.sync();
db.sequelize.sync({ force: true }).then(function () {
  console.log("Drop and re-sync db.");
});


//========================================================

//=================MQTT===================================
topic = 'sensor/gsensor';
sub_msg = "";

client.on('connect', function () {
  //client.subscribe(topic);
  //當connect這個event被觸發會執行function類似一種callback
  console.log("Connect Broker Successfully!")
});//顯示連線成功的訊息

//subscriber got the topic
client.on('message', function (topic, message) {
  //收到的消息是一個 buffer.
  //如果有message來就執行function
  console.log('received MQTT message: ' + message.toString());//subscribbe或publish都會得到此訊息
  sub_msg = message;//把訊息放到global變數
  //client.end();
});

app.use('/pub', express.static(__dirname + '/public'));  //used for static file(html,jpg,txt,...)
//在express中提供靜態檔案

app.post('/publish1', function (req, res) {  //we use body parser to handling POST body
  //html傳送指令後端SERVER接收
  console.log("%s", new Date());//在console上顯示時間
  console.log(req.body.parameter1);//console印出parameter1
  console.log(req.body.parameter2);//console印出parameter2
  client.publish(req.body.parameter1, req.body.parameter2);
  console.log(req.body.parameter1, req.body.parameter2);
  //client.publish(req.body.parameter1,req.body.parameter2), mqtt:把資料publish給指定topic

  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(req.body.parameter1);


});// *3. 連線到192.168.x.xx/publish/ 

app.post('/subscribe', function (req, res) {  //we use body parser to handling POST body
  //req瀏覽器傳來的資料 res傳回去的資料

  console.log('mqtt subscribe topic:' + req.body.parameter1); //顯示在console上
  client.subscribe(req.body.parameter1);
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(sub_msg); //傳給前端html瀏覽器


});
//==================MQTT==================================

//====================server================================
app.listen(8000, function () {
  console.log('Server is listening on port 8000!');
});
