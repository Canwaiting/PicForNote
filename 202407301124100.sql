-- 1.0.046
ALTER TABLE DBPRODUCT_BEAN ADD shelflife INTEGER;
ALTER TABLE DBPRODUCT_BEAN ADD tare REAL;
ALTER TABLE DBPRODUCT_BEAN ADD vid TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD fyname TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD fyaddress TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD fyphone TEXT;

-- 1.0.048
DROP TABLE IF EXISTS DeliveryInfo;
CREATE TABLE DeliveryInfo
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	shopid				TEXT,
	deliveryplatformid	TEXT,	
	deliveryplatform	TEXT,	
	deliveryshopid		TEXT	
);
DROP TABLE IF EXISTS DeliveryOrders;
CREATE TABLE DeliveryOrders
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	deliveryorderid		TEXT,
	deliveryplatform	TEXT,
	orderid				TEXT,
	orderat				TEXT,
	origintotal			REAL,
	pricetotal			REAL,
	promoamt			REAL,
	payamt				REAL,
	paytype				TEXT,	
	promotioncode		TEXT,
	outercode			TEXT,
	products			TEXT,	
	hasrefunded			INTEGER,
	refundorderid		TEXT,
	refundtime			TEXT,
	salesclerkphone		TEXT,
	shopid				TEXT,
	devicecode			TEXT,
	fromwinpos          TEXT,
	remark				TEXT,
	create_time			TEXT,
	refund_time			TEXT,	
	up_status			INTEGER,
	upload_time			TEXT,
	shift_status		INTEGER,
	up_remark			TEXT,
	refund_phone		TEXT,
	createurlip			TEXT
);
DROP TABLE IF EXISTS UserRecord;
CREATE TABLE UserRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	shopid				TEXT,
	shopname			TEXT,
	devicenum			TEXT,
	operate				INTEGER,
	orderno				TEXT,
	cancelorderno		TEXT,
	refundorderno		TEXT,
	skucodes			TEXT,
	totalamount			REAL,
	memberphone			TEXT,
	operatename			TEXT,
	operatetext			TEXT,
	operatetime			TEXT,
	remark				TEXT,
	createtime			TEXT,
	uploadstatus		INTEGER,
	uploadtime			TEXT,
	uploadremark		TEXT
);
ALTER TABLE DBSWITCH_KEY_BEAN_NEW ADD ishascutter INTEGER;


--1.0.050
ALTER TABLE ActiveSkus ADD purchaselimit REAL;
ALTER TABLE ActiveSkus ADD description TEXT;
ALTER TABLE ShopInfo ADD limitflag INTEGER;
ALTER TABLE ShopInfo ADD defaultbulklimitcount REAL;
ALTER TABLE ShopInfo ADD defaultnormallimitcount REAL;
ALTER TABLE ShopInfo ADD sapshopid TEXT;
ALTER TABLE ShopInfo ADD tracewebdomain TEXT;
ALTER TABLE ShopInfo ADD reportdomain TEXT;
ALTER TABLE SCALE_ACTIVITY ADD FILELIST TEXT;


--1.0.051
ALTER TABLE ShopPromotions ADD purchaselimitbulk REAL;
UPDATE ShopPromotions SET purchaselimit = -1 WHERE purchaselimit = 0;


--1.0.052
ALTER TABLE ShopInfo ADD englishaddress TEXT;
ALTER TABLE ShopInfo ADD englishcompany TEXT;


--1.0.053
DROP TABLE IF EXISTS DeviceStateChangeRecord;
CREATE TABLE DeviceStateChangeRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	clientid			TEXT,
	time				TEXT,
	precashmode			INTEGER,
	currentcashmode		INTEGER,
	changecause			TEXT,
	changetime			TEXT,
	uploadflag			INTEGER,
	uploadtime			TEXT,
	uploadremark		TEXT
);
DROP TABLE IF EXISTS DeviceStateChangeFailRecord;
CREATE TABLE DeviceStateChangeFailRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	clientid			TEXT,
	time				TEXT,
	currentcashmode		INTEGER,
	nextcashmode		INTEGER,
	failreason			TEXT,
	failtime			TEXT
);
DROP TABLE IF EXISTS ShopControlStateChangeRecord;
CREATE TABLE ShopControlStateChangeRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	clientid			TEXT,
	time				TEXT,
	precontrolmode		INTEGER,
	currentcontrolmode	INTEGER,
	changecause			TEXT,
	changetime			TEXT
);
DROP TABLE IF EXISTS SwitchConfig;
CREATE TABLE SwitchConfig
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	time				TEXT,
	version				INTEGER,
	mqttoffthreshold	INTEGER,
	mqttonthreshold		INTEGER,
	apioffthreshold		INTEGER,
	heartbeatinterval	INTEGER,
	whitelist			INTEGER,
	configtime			TEXT
);
INSERT INTO SwitchConfig(time,version,mqttoffthreshold,mqttonthreshold,apioffthreshold,heartbeatinterval,whitelist,configtime) VALUES('0',0,5,100,5,3,0,'默认');
DROP TABLE IF EXISTS ServerControlRecord;
CREATE TABLE ServerControlRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	time				TEXT,
	version				INTEGER,
	precashmode			INTEGER,
	cashmode			INTEGER,
	success				INTEGER,
	reason				TEXT,
	controltime			TEXT
);


--1.0.055
ALTER TABLE DBPRODUCT_BEAN ADD producttype TEXT;
ALTER TABLE OfflineOrders ADD orderid TEXT;
ALTER TABLE OfflineOrders ADD memberinfo TEXT;
DROP TABLE IF EXISTS OctopusRecord;
CREATE TABLE OctopusRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	orderid				TEXT,
	deviceid			TEXT,
	cardid				TEXT,
	oldcardid			TEXT,
	amount				REAL,
	remaining			REAL,
	customerinfo		TEXT,
	extrainfo			TEXT,
	createtime			TEXT,
	createtimefm		TEXT,
	createuser			TEXT,
	buyid				TEXT,
	devicesn			TEXT,
	shopid				TEXT,
	uploadstatus		INTEGER,
	uploadtime			TEXT,
	uploadremark		TEXT
);


--1.0.056
DELETE FROM Property WHERE _key = 'update_times';
DELETE FROM Property WHERE _key = 'application_version';
INSERT INTO Property(_key,value,desc,createtime) VALUES('update_times','0','','2021-03-29');
INSERT INTO Property(_key,value,desc,createtime) VALUES('application_version','0','','2021-03-29');


--1.0.057
DELETE FROM Property WHERE _key = 'update_times';
DELETE FROM Property WHERE _key = 'application_version';
INSERT INTO Property(_key,value,desc,createtime) VALUES('update_times','0','','2021-03-29');
INSERT INTO Property(_key,value,desc,createtime) VALUES('application_version','0','','2021-03-29');
DROP TABLE IF EXISTS OctopusRecord;
CREATE TABLE OctopusRecord
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	ordertype           INTEGER,
	orderid				TEXT,
	deviceid			TEXT,
	cardid				TEXT,
	oldcardid			TEXT,
	amount				REAL,
	remaining			REAL,
	customerinfo		TEXT,
	extrainfo			TEXT,
	createtime			TEXT,
	createtimefm		TEXT,
	createuser			TEXT,
	buyid				TEXT,
	devicesn			TEXT,
	shopid				TEXT,
	uploadstatus		INTEGER,
	uploadtime			TEXT,
	uploadremark		TEXT
);


--1.0.060
ALTER TABLE OfflineOrders ADD couponcode TEXT;
ALTER TABLE OfflineOrders ADD couponamt REAL;


--1.0.065
DROP TABLE IF EXISTS OctopusUnusualOrders;
CREATE TABLE OctopusUnusualOrders
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	orderid				TEXT,
	octopusamt			REAL,
	origintotal			REAL,
	pricetotal			REAL,
	promoamt			REAL,
	cashpayamt			REAL,
	couponcode			TEXT,
	couponamt			REAL,
	customerphone		TEXT,
	customername		TEXT,
	title				TEXT,
	products			TEXT,
	payfailat			TEXT,
	salesclerkphone		TEXT,
	shopid				TEXT,
	devicesn			TEXT,
	remark				TEXT,
	payfailtime			TEXT,
	createurlip			TEXT,
	paystatus			INTEGER,
	paytime				TEXT,
	payremark			TEXT
);
DROP TABLE IF EXISTS DBPRODUCT_SCANCODE_BEAN;
CREATE TABLE DBPRODUCT_SCANCODE_BEAN
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT,
	skuname				TEXT,
	spec				TEXT,
	categoryid			TEXT,
	categoryname		TEXT,
	safepercent			REAL,
	weightflag			INTEGER,
	mainimg				TEXT,
	local_pic			TEXT,
	location			TEXT,
	createdat			TEXT,
	panelflag			TEXT,
	panelshowflag		TEXT,
	shopid				TEXT,
	shopname			TEXT,
	poflag				INTEGER,
	returnflag			INTEGER,
	tagformat			TEXT,
	barcodeformat		TEXT,
	spinfo				TEXT,
	qrcodecontent		TEXT,
	company				TEXT,
	firstcategoryid		TEXT,
	firstcategoryname	TEXT,
	secondcategoryid	TEXT,
	secondcategoryname	TEXT,
	pricetag			TEXT,
	pricetagid			INTEGER,
	salesunit			TEXT,
	originprice			REAL,
	originpricedesc		TEXT,
	origintotal			REAL,
	promoamt			REAL,
	saleprice			REAL,
	salepricedesc		TEXT,
	specnum				REAL,
	strikeout			INTEGER,
	total				REAL,
	remark				TEXT,
	tenantid			TEXT,
	barcode				TEXT,
	specdesc			TEXT,	
	store_type			TEXT,
	goods_id			TEXT,
	special_price		REAL,
	totalstockqty		REAL,
	title				TEXT,
	goodstagid			INTEGER,
	num					REAL,
	spectype			INTEGER,
	ingredient			TEXT,
	producttype			TEXT,
	bestdays			INTEGER,
	shelflife			INTEGER,
	tare				REAL,
	vid 				TEXT,
	fyname 				TEXT,
	fyaddress 			TEXT,
	fyphone 			TEXT,
	specialmessage		TEXT,
	status				INTEGER,
	special_status		INTEGER,
	is_query_barcode	INTEGER,
	create_url_ip		TEXT
);


--1.0.066
ALTER TABLE ShopInfo ADD machineid INTEGER;


--1.0.068
ALTER TABLE ShopPromotions ADD categorylimitinfolist TEXT;


--1.0.070
ALTER TABLE DBPRODUCT_BEAN ADD englishskuname TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD englishsalesunit TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD enlocation TEXT;
ALTER TABLE ShopInfo ADD englishshopname TEXT;


--1.0.072
ALTER TABLE OfflineOrders ADD onlinepayamt REAL;
ALTER TABLE OfflineOrders ADD orderstatus INTEGER;


--1.0.073
ALTER TABLE ShopInfo ADD storetype TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD spellfirstchar TEXT;


--1.0.075
ALTER TABLE ShopInfo ADD latestsapshopid TEXT;
ALTER TABLE OfflineOrders ADD advert TEXT;
DROP TABLE IF EXISTS ReceiptAdvert;
CREATE TABLE ReceiptAdvert
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	id					TEXT,
	adid				TEXT,
	adname				TEXT,
	startat				TEXT,
	endat				TEXT,
	status				TEXT,
	priority			INTEGER,
	createdat			TEXT,
	updatedat			TEXT,
	customerscope		INTEGER,
	amount				REAL,
	amtscope			INTEGER,
	amounttype			INTEGER,
	productrange		TEXT,
	productentities		TEXT,
	adcontent			TEXT
);


--1.0.075（非香港）
ALTER TABLE AdvertInfo ADD launchtype INTEGER;


--1.0.076（非香港）
ALTER TABLE LedPlayContent ADD contenttype INTEGER;
DROP TABLE IF EXISTS LedProduct;
CREATE TABLE LedProduct(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	id					INTEGER,
	skucode				TEXT,
	type 				INTEGER,
	createtime			TEXT,
	updatetime			TEXT
);
DROP TABLE IF EXISTS LedPromotionProduct;
CREATE TABLE LedPromotionProduct(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT,
	skuname				TEXT,
	saleunit			TEXT,
	price 				REAL,
	memberprice  		REAL,
	discount 			REAL
);


--1.0.077
ALTER TABLE LedPlayContent ADD origincontent TEXT;
ALTER TABLE DBPRODUCT_BEAN ADD canweight INTEGER;
ALTER TABLE DBPRODUCT_SCANCODE_BEAN ADD canweight INTEGER;


--1.0.078
ALTER TABLE ActiveSkus ADD isscreen INTEGER;
ALTER TABLE ShopInfo ADD caninvoiceflag INTEGER;


--1.0.080
ALTER TABLE DBPRODUCT_BEAN ADD cansell INTEGER;
ALTER TABLE DBPRODUCT_SCANCODE_BEAN ADD cansell INTEGER;


--1.0.082
DROP TABLE IF EXISTS SelectedPromotionSkus;
CREATE TABLE SelectedPromotionSkus(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT,
	createtime			TEXT,
	updatetime			TEXT
);
DROP TABLE IF EXISTS FruitSkus;
CREATE TABLE FruitSkus(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT,
	skuname 			TEXT,
	saleprice  			REAL,
	mainimg  			TEXT, 
	shopid 				TEXT
);


--1.0.083
ALTER TABLE ShopInfo ADD starlevel INTEGER;
DROP TABLE IF EXISTS ExcludeFruitSkus;
CREATE TABLE ExcludeFruitSkus(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT,
	createtime			TEXT,
	updatetime			TEXT
);


--1.0.084
ALTER TABLE ShopInfo ADD shopproperty TEXT;
ALTER TABLE BasicsRecordDes ADD barcodeflag INTEGER;
ALTER TABLE ShopPromotions ADD goodsstockmode INTEGER;


--1.0.085
DROP TABLE IF EXISTS PettyCash;
CREATE TABLE PettyCash
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	createdate			TEXT,
	amount				REAL,
	createtime			TEXT,
	createuser			TEXT
);


--1.0.086
ALTER TABLE AdvertInfo ADD timeslot TEXT;


--1.0.087
ALTER TABLE ShopInfo ADD dyshopid TEXT;
ALTER TABLE ShopInfo ADD dyshopname TEXT;
ALTER TABLE ShopInfo ADD dyaddress TEXT;
ALTER TABLE FruitSkus ADD originalprice REAL;
ALTER TABLE ReceiptAdvert ADD effectivetype INTEGER;
ALTER TABLE ReceiptAdvert ADD timelimitedeffectivestartat TEXT;
ALTER TABLE ReceiptAdvert ADD timelimitedeffectiveendat TEXT;


--1.0.090
DROP TABLE IF EXISTS ReduceCostSkus;
CREATE TABLE ReduceCostSkus(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	skucode				TEXT
);


--1.0.094
ALTER TABLE ShopInfo ADD companyaddr TEXT;


--1.0.097
ALTER TABLE PettyCash ADD iscollect INTEGER;
ALTER TABLE PettyCash ADD updatetime TEXT;


--1.0.101
ALTER TABLE ShopInfo ADD servicerange INTEGER;
ALTER TABLE OfflineShift ADD onlineordercashamt REAL;
DROP TABLE IF EXISTS Sensors;
CREATE TABLE Sensors 
(
	_id					INTEGER PRIMARY KEY AUTOINCREMENT,
	event				TEXT,
	data				TEXT,
	createurlip			TEXT,
	uploadstatus		INTEGER DEFAULT 0,
	uploadtime			TEXT,
	uploadremark		TEXT,
	createtime			TEXT	
);


--1.0.102
ALTER TABLE BasicsRecordDes ADD skuname TEXT;
ALTER TABLE BasicsRecordDes ADD salesunit TEXT;
ALTER TABLE AdvertInfo ADD carouseltime INTEGER;


--1.0.103
ALTER TABLE Users ADD id TEXT;
INSERT INTO Property(_key,value,desc,createtime) VALUES('initialcash','0','是否需要弹出备用金窗口','2023-10-24');
INSERT INTO Property(_key,value,desc,createtime) VALUES('token','','用户token','2023-10-24');
INSERT INTO Property(_key,value,desc,createtime) VALUES('userid','','用户id','2023-10-24');
INSERT INTO Property(_key,value,desc,createtime) VALUES('virtual_member_date','','使用散客会员价的日期','2023-10-24');


--1.0.111
ALTER TABLE ShopPromotions ADD memberscope TEXT;
ALTER TABLE ShopPromotions ADD membercondition TEXT;
ALTER TABLE ShopPromotions ADD promotiontag TEXT;


--1.0.115
ALTER TABLE DBPRODUCT_BEAN ADD shelfinfo TEXT;
ALTER TABLE ShopPromotions ADD promotionmixtype TEXT;


--1.0.117
ALTER TABLE DBSWITCH_KEY_BEAN_NEW ADD meterstate INTEGER;


--1.0.120
CREATE INDEX index_orderat ON OfflineOrders (orderat);
CREATE INDEX index_offlineorderid ON OfflineOrders (offlineorderid);

--1.0.121
ALTER TABLE OfflineOrders ADD productpromodetail TEXT;
ALTER TABLE OfflineOrders ADD parentorderid TEXT;