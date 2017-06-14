local CheckPlayerAttributeAch = function(player, nAttribute, RangeList)
	for k, v in ipairs(RangeList) do
		if nAttribute >= v[1] then
			if not player.IsAchievementAcquired(v[2]) then
				RemoteCallToServer("OnClientAddAchievement", v[3])
			end
		else
			break
		end
	end
end

local CheckPlayerReputeLevelAch = function(player, RangeList)
	for k, v in ipairs(RangeList) do
		if not player.IsReputationHide(v[1]) and player.GetReputeLevel(v[1]) >= v[2] then
			if not player.IsAchievementAcquired(v[3]) then
				RemoteCallToServer("OnClientAddAchievement", v[4])
			end
		end
	end
end

-------------------等级提升-------------------
local LevelRange =
{
	{5, 706, "Level_5"},
	{10, 1, "Level_10"},
	{20, 2, "Level_20"},
	{30, 3, "Level_30"},
	{40, 4, "Level_40"},
	{50, 5, "Level_50"},
	{60, 6, "Level_60"},
	{70, 7, "Level_70"},
	{80, 1877, "Level_80"},
	{90, 3434, "Level_90"},
	{95, 4927, "Level_95"},
}

-------------------获得金钱-------------------
local MoneyRange =
{
	{1000, 371, "Get1000G"},
	{3000, 372, "Get3000G"},
	{5000, 373, "Get5000G"},
	{8000, 890, "Get8000G"},
	{10000, 891, "Get10000G"},
}

---------------获取称号----------------------
local DesignationRange =
{
	{1, 713, "Designation_1"},
	{10, 712, "Designation_10"},
	{20, 151, "Designation_20"},
	{50, 152, "Designation_50"},
}

---------------获取声望----------------------
local ReputeRange =
{
	{35, 7, 503, "Luoyang_Zunjin"}, 		-- 洛阳声望到尊敬
	{36, 7, 504, "Changan_Zunjin"}, 	   	-- 长安声望到尊敬
	{34, 7, 505, "Yangzhou_Zunjin"}, 	   	-- 扬州声望到尊敬
	{11, 7, 506, "Shaolin_Zunjin"}, 	   	-- 少林声望到尊敬
	{14, 7, 507, "Chunyang_Zunjin"}, 	   	-- 纯阳声望到尊敬
	{18, 7, 1346, "Cangjian_Zunjin"}, 	   	-- 藏剑声望到尊敬
	{12, 7, 508, "Wanhua_Zunjin"}, 	   	-- 万花声望到尊敬
	{15, 7, 509, "Qixiu_Zunjin"}, 	   	-- 七秀声望到尊敬
	{13, 7, 510, "Tiance_Zunjin"}, 	   	-- 天策声望到尊敬
	{50, 7, 511, "Haoqimeng_Zunjin"},		-- 浩气盟声望到尊敬
	{49, 7, 512, "Erengu_Zunjin"}, 	   	-- 恶人谷声望到尊敬
	--{38, 3, 513, "Hongyijiao_Zhongli"}, 	   	-- 红衣教声望到中立
	{38, 4, 514, "Hongyijiao_Youshan"}, 	   	-- 红衣教声望到友好
	{46, 4, 815, "Kunlun_Youshan"}, 	   	-- 昆仑声望到友好
	{47, 4, 816, "Daozong_Youshan"}, 	   	-- 刀宗声望到友好
	{46, 5, 817, "Kunlun_qinmi"}, 	   	-- 昆仑声望到亲密
	{47, 5, 818, "Daozong_qinmi"}, 	   	-- 刀宗声望到亲密
	{45, 7, 819, "Changgemen_Zunjin"}, 	   	-- 长歌门声望到尊敬
	{44, 7, 820, "Donglizhai_Zunjin"}, 	   	-- 东篱寨声望到达尊敬
	{48, 7, 821, "Yingyuanhui_Zunjin"}, 	   	-- 隐元会声望到达尊敬
	{43, 7, 822, "Shanghui_Zunjin"}, 	   	-- 商会声望到达尊敬
	{42, 7, 823, "Biaoju_Zunjin"}, 	   	-- 镖局声望到达尊敬
	{16, 7, 1881, "Wudu_Zunjin"}, 	   		-- 五毒声望到达尊敬
	{83, 7, 1879, "Cangjingge_Zunjin"}, 	   		-- 藏经阁声望到达尊敬
	{84, 7, 1880, "Badao_Zunjin"}, 	   		-- 霸刀声望到达尊敬
	{85, 7, 1882, "Daligong_Zunjin"}, 	   		-- 大理宫声望到达尊敬
	{86, 7, 1883, "Tana_Zunjin"}, 	   		-- 塔纳声望到达尊敬
	{87, 7, 1884, "Zhurongdian_Zunjin"}, 	   		-- 祝融殿声望到达尊敬
	{88, 7, 1885, "Tiannanwangjia_Zunjin"}, 	   		-- 天南王家声望到达尊敬
	{89, 7, 1886, "Baihuojiao_Zunjin"}, 	   		-- 拜火教声望到达尊敬
	{90, 7, 1887, "Jiulizu_Zunjin"}, 	   		-- 九黎族声望到达尊敬
	{91, 7, 1888, "Zhennanbiaoju_Zunjin"}, 	   		-- 镇南镖局声望到达尊敬
	{82, 7, 2396, "Xuanyuanshe_Zunjin"}, 	   		-- 轩辕社声望到达尊敬
	{17, 7, 2708, "Tangmen_Zunjin"}, 	   		-- 唐门声望到达尊敬
	{94, 7, 3120, "Wukuinanling_Zunjin"}, 	   		-- 无愧南灵声望到达尊敬
	{93, 7, 3185, "Lihenzhong_Zunjin"}, 	   		-- 塔纳离恨冢声望到达尊敬
	{20, 7, 3306, "Mingjiao_Zunjin"}, 	   		-- 明教声望到达尊敬
	{19, 7, 3541, "Gaibang_Zunjing"}, 	   		-- 丐帮声望到达尊敬
	{103, 7, 3542, "Shuofangjun_Zunjing"}, 	   		-- 朔方军声望到达尊敬
	{104, 7, 3543, "Yijun_Zunjing"}, 	   		-- 义军声望到达尊敬
	{105, 7, 3544, "Langyayanshi_Zunjing"}, 	   		-- 琅琊颜氏声望到达尊敬
	{107, 7, 3545, "Datangbingbu_Zunjing"}, 	   		-- 大唐兵部声望到达尊敬
	{108, 7, 3546, "Litanghuangshi_Zunjing"}, 	   		-- 李唐皇室声望到达尊敬
	{110, 7, 3547, "Tongguanshoubei_Zunjing"}, 	   		-- 潼关守备军声望到达尊敬
	{111, 7, 3548, "Tulanghui_Zunjing"}, 	   		-- 屠狼会声望到达尊敬
	{109, 7, 3549, "Lingyange_Zunjing"}, 	   		-- 凌烟阁声望到达尊敬
	{113, 7, 3894, "DaYanChangAnFu_Zunjing"}, 	   		-- 大燕长安府声望到尊敬
	{115, 7, 3895, "ChangAnShangHui_Zunjing"}, 	   		-- 长安商会声望到尊敬
	{114, 7, 3896, "JingShiJunZhong_Zunjing"}, 	   		-- 靖世军·忠声望到尊敬
	{116, 7, 3897, "JingShiJunYi_Zunjing"}, 	   		-- 靖世军·义声望到尊敬
	{118, 7, 3927, "JunXieJian_Zunjing"}, 	   		-- 军械监声望到尊敬
	{119, 7, 3928, "YingLingTing_Zunjing"}, 	   		-- 英灵厅声望到尊敬
	{121, 7, 4045, "ChaNaQianNian_Zunjing"}, 	   		-- 刹那千年声望到尊敬
	{123, 7, 4053, "MoShiMenTu_Zunjing"}, 	   		-- 墨氏门徒声望到尊敬
	{124, 7, 4054, "YinYuanTianBu_Zunjing"}, 	   		-- 隐元天部声望到尊敬
	{125, 7, 4055, "TaiChuLingShe_Zunjing"}, 	   		-- 太初陵社声望到尊敬
	{97, 7, 4198, "DuanShiShanCheng_Zunjing"}, 	   		-- 段氏山城声望到尊敬
	{126, 7, 4199, "ChangAnFuHao_Zunjing"}, 	   		-- 长安富豪声望到尊敬
	{127, 7, 4334, "CangYun_Zunjing"}, 			-- 苍云门派声望到尊敬
	{132, 7, 4335, "LingWuXianFengJun_Zunjing"}, 			-- 灵武先锋军声望到尊敬
	{133, 7, 4336, "TaiYuanYiShi_Zunjing"}, 			-- 太原义士声望到尊敬
	{134, 7, 4337, "WuLinMeng_Zunjing"}, 			-- 武林盟声望到尊敬
	{135, 7, 4338, "JianNingTieWei_Zunjing"}, 			-- 建宁铁卫声望到尊敬
	{137, 7, 4339, "HeDongShangHui_Zunjing"}, 			-- 河东商会声望到尊敬
	{138, 7, 4340, "TaiYuanLianJun_Zunjing"}, 			-- 太原联军声望到尊敬
	{139, 7, 4341, "LongChengFeiJiang_Zunjing"}, 			-- 太原守军·龙城飞将声望到尊敬
	{140, 7, 4342, "FengHuoBeiWang_Zunjing"}, 			-- 太原守军·烽火北望声望到尊敬
	{141, 7, 4646, "JiangNanYeShang_Zunjing"}, 			-- 江南叶商行声望到尊敬
	{128, 7, 5033, "changgemen_Zunjing"}, 			-- 长歌门	
	{142, 7, 5034, "huiheshangdui_Zunjing"}, 			-- 回纥商队
	{143, 7, 5035, "heishuicheng_Zunjing"}, 			-- 跋汗族·黑水城
	{144, 7, 5036, "huainanshanghang_Zunjing"}, 			-- 淮南商行
	{145, 7, 5037, "wuzhehui_Zunjing"}, 			-- 无遮会
	{146, 7, 5038, "yinshanheishi_Zunjing"}, 			-- 阴山黑市
	{147, 7, 5039, "mibaohuimoxibu_Zunjing"}, 			-- 觅宝会漠西部
	{148, 7, 5040, "kongshantang_Zunjing"}, 			-- 恶人谷空山堂
	{149, 7, 5041, "xinyutang_Zunjing"}, 			-- 浩气盟新雨堂
	{150, 7, 5042, "changgeyinxianju_Zunjing"}, 			-- 长歌门·隐贤居
	{151, 7, 5043, "baiyunhui_Zunjing"}, 			-- 白云会
	{152, 7, 5044, "mingsenghui_Zunjing"}, 			-- 名僧会
	{153, 7, 5110, "changgemiyinyuan_Zunjing"}, 			-- 长歌门·觅音明心园
	{154, 7, 5111, "yudailou_Zunjing"}, 			-- 商会·玉带楼
	{155, 7, 5112, "liehunzu_Zunjing"}, 			-- 源氏·狩魂组
	{160, 7, 5336, "yonganshanghang_Zunjing"}, 			-- 永安商行		
	{161, 7, 5444, "lingyunhui_Zunjing"}, 			-- 凌云会			
	{129, 7, 5489, "badao_Zunjing"}, 			-- 霸刀挚友	
	{163, 7, 5490, "guoziyijingwu_Zunjing"}, 			-- 郭子仪部·靖武	
	{164, 7, 5491, "jingjinge_Zunjing"}, 			-- 精金阁	
	{165, 7, 5492, "guangfudangkou_Zunjing"}, 			-- 洛阳光复联军·荡寇	
	{166, 7, 5493, "guangfujinbiao_Zunjing"}, 			-- 洛阳光复联军·旌表
	{167, 7, 5817, "yangminglei_Zunjing"}, 			-- 扬名擂	
	{168, 7, 5818, "beishanhuinutao_Zunjing"}, 			-- 北山会·怒涛堂	
	{169, 7, 5819, "beishanhuinongying_Zunjing"}, 			-- 北山会·弄影堂	
}

-------------------贡献度相关------------------
local ContributionRange =
{
	{10000, 543, "Contribution10000"},
	{35000, 544, "Contribution35000"},
	{70000, 545, "Contribution70000"},
}

---------------获得威望相关-----------------
local PrestigeRange =
{
	{9000, 840, "Prestige9000"},
	{12000, 841, "Prestige12000"},
	{15000, 549, "Prestige15000"},
	{20000, 550, "Prestige20000"},
	{50000, 551, "Prestige50000"},
}

--------------读书相关-----------------------
local aReadBook = 
{
	-- {BookID, nAchievementID, "ReadBook_BookID"},
	{1152, 1063, "ReadBook_1152"},
	{1153, 1064, "ReadBook_1153"},
	{1154, 1065, "ReadBook_1154"},
	{1155, 1066, "ReadBook_1155"},
	{1156, 1067, "ReadBook_1156"},
	{1157, 1068, "ReadBook_1157"},
	{1158, 1069, "ReadBook_1158"},
	{1159, 1070, "ReadBook_1159"},	
	{1160, 1172, "ReadBook_1160"},
	{1161, 1173, "ReadBook_1161"},
	{1162, 1174, "ReadBook_1162"},
	{1163, 1175, "ReadBook_1163"},
	{1164, 1176, "ReadBook_1164"},
	{1165, 1177, "ReadBook_1165"},
	{1166, 1178, "ReadBook_1166"},
	{1167, 1179, "ReadBook_1167"},
	{1192, 2072, "ReadBook_1192"}, -- 红尘恩怨套书
	{1193, 2073, "ReadBook_1193"},
	{1194, 2074, "ReadBook_1194"},
	{1195, 2075, "ReadBook_1195"},
	{1196, 2076, "ReadBook_1196"},
	{1197, 2077, "ReadBook_1197"},
	{1198, 2078, "ReadBook_1198"},
	{1199, 2079, "ReadBook_1199"},	
	{1200, 2081, "ReadBook_1200"}, -- 血龙之谜套书
	{1201, 2082, "ReadBook_1201"},
	{1202, 2083, "ReadBook_1202"},
	{1203, 2084, "ReadBook_1203"},
	{1204, 2085, "ReadBook_1204"},
	{1205, 2086, "ReadBook_1205"},
	{1206, 2087, "ReadBook_1206"},
	{1207, 2088, "ReadBook_1207"},
	{1208, 2090, "ReadBook_1208"}, -- 血龙秘闻：达摩龙窟
	{1209, 2091, "ReadBook_1209"},
	{1210, 2092, "ReadBook_1210"},
	{1211, 2093, "ReadBook_1211"},
	{1212, 2094, "ReadBook_1212"},
	{1213, 2095, "ReadBook_1213"},
	{1214, 2096, "ReadBook_1214"},
	{1215, 2097, "ReadBook_1215"},	
	{1216, 2099, "ReadBook_1216"}, -- 长安客书稿
	{1217, 2100, "ReadBook_1217"},
	{1218, 2101, "ReadBook_1218"},
	{1219, 2102, "ReadBook_1219"},
	{1220, 2103, "ReadBook_1220"},
	{1221, 2104, "ReadBook_1221"},
	{1222, 2105, "ReadBook_1222"},
	{1223, 2106, "ReadBook_1223"},
	{1224, 2108, "ReadBook_1224"}, -- 苗岭异事
	{1225, 2109, "ReadBook_1225"},
	{1226, 2110, "ReadBook_1226"},
	{1227, 2111, "ReadBook_1227"},
	{1228, 2112, "ReadBook_1228"},
	{1229, 2113, "ReadBook_1229"},
	{1230, 2114, "ReadBook_1230"},
	{1231, 2115, "ReadBook_1231"},	
	{1232, 2117, "ReadBook_1232"}, -- 谢渊列传
	{1233, 2118, "ReadBook_1233"},
	{1234, 2119, "ReadBook_1234"},
	{1235, 2120, "ReadBook_1235"},
	{1236, 2121, "ReadBook_1236"},
	{1237, 2122, "ReadBook_1237"},
	{1238, 2123, "ReadBook_1238"},
	{1239, 2124, "ReadBook_1239"},
	{1240, 2126, "ReadBook_1240"}, -- 天之九野
	{1241, 2127, "ReadBook_1241"},
	{1242, 2128, "ReadBook_1242"},
	{1243, 2129, "ReadBook_1243"},
	{1244, 2130, "ReadBook_1244"},
	{1245, 2131, "ReadBook_1245"},
	{1246, 2132, "ReadBook_1246"},
	{1248, 2134, "ReadBook_1248"}, -- 星宿老仙
	{1249, 2135, "ReadBook_1249"},
	{1250, 2136, "ReadBook_1250"},
	{1251, 2137, "ReadBook_1251"},
	{1252, 2138, "ReadBook_1252"},
	{1253, 2139, "ReadBook_1253"},
	{1254, 2140, "ReadBook_1254"},
	{1256, 2142, "ReadBook_1256"}, -- 苗族制蛊秘术
	{1257, 2143, "ReadBook_1257"},
	{1258, 2144, "ReadBook_1258"},
	{1259, 2145, "ReadBook_1259"},
	{1260, 2146, "ReadBook_1260"},
	{1261, 2147, "ReadBook_1261"},
	{1264, 2149, "ReadBook_1264"}, -- 千金方
	{1265, 2150, "ReadBook_1265"},
	{1266, 2151, "ReadBook_1266"},
	{1267, 2152, "ReadBook_1267"},	
	{1268, 2153, "ReadBook_1268"},
	{1272, 2155, "ReadBook_1272"}, --西南神话故事传说
	{1273, 2156, "ReadBook_1273"},
	{1274, 2157, "ReadBook_1274"},
	{1275, 2158, "ReadBook_1275"},
	{1276, 2159, "ReadBook_1276"},
	{1277, 2160, "ReadBook_1277"},
	{1280, 2162, "ReadBook_1280"}, -- 神异经·西荒经套书
	{1281, 2163, "ReadBook_1281"},
	{1282, 2164, "ReadBook_1282"},
	{1283, 2165, "ReadBook_1283"},
	{1288, 2167, "ReadBook_1288"}, -- 大唐军建秘录套书
	{1289, 2168, "ReadBook_1289"},
	{1290, 2169, "ReadBook_1290"},
	{1291, 2170, "ReadBook_1291"},
	{1292, 2171, "ReadBook_1292"},	
	{1296, 2173, "ReadBook_1296"}, -- 段族旧事套书
	{1297, 2174, "ReadBook_1297"},
	{1298, 2175, "ReadBook_1298"},
	{1299, 2176, "ReadBook_1299"},
	{1300, 2177, "ReadBook_1300"},
	{1301, 2178, "ReadBook_1301"},
	{1302, 2179, "ReadBook_1302"},
	{1303, 2180, "ReadBook_1303"},
	{1304, 2182, "ReadBook_1304"}, --  红尘遗秘
	{1305, 2183, "ReadBook_1305"},
	{1306, 2184, "ReadBook_1306"},
	{1307, 2185, "ReadBook_1307"},
	{1308, 2186, "ReadBook_1308"},
	{1309, 2187, "ReadBook_1309"},
	{1310, 2188, "ReadBook_1310"},
	{1311, 2189, "ReadBook_1311"},	  
	{1312, 2191, "ReadBook_1312"}, -- 蛮人志异
	{1313, 2192, "ReadBook_1313"},
	{1314, 2193, "ReadBook_1314"},
	{1315, 2194, "ReadBook_1315"},
	{1316, 2195, "ReadBook_1316"},
	{1317, 2196, "ReadBook_1317"},
	{1318, 2197, "ReadBook_1318"},
	{1319, 2198, "ReadBook_1319"},
	{1320, 2200, "ReadBook_1320"}, -- 五仙圣地套书
	{1321, 2201, "ReadBook_1321"},
	{1322, 2202, "ReadBook_1322"},
	{1323, 2203, "ReadBook_1323"},
	{1324, 2204, "ReadBook_1324"},
	{1325, 2205, "ReadBook_1325"},
	{1328, 2207, "ReadBook_1328"}, -- 牡丹套书
	{1329, 2208, "ReadBook_1329"},	
	{1330, 2209, "ReadBook_1330"},
	{1331, 2210, "ReadBook_1331"},
	{1336, 2212, "ReadBook_1336"}, -- 圣蛇·姬无双
	{1337, 2213, "ReadBook_1337"},
	{1338, 2214, "ReadBook_1338"},
	{1339, 2215, "ReadBook_1339"},
	{1344, 2217, "ReadBook_1344"}, -- 慕容追风套书
	{1345, 2218, "ReadBook_1345"},
	{1346, 2219, "ReadBook_1346"},
	{1347, 2220, "ReadBook_1347"},   
	{1352, 2222, "ReadBook_1352"}, -- 卫栖梧套书
	{1353, 2223, "ReadBook_1353"},
	{1354, 2224, "ReadBook_1354"},
	{1355, 2225, "ReadBook_1355"},    
	{1360, 2227, "ReadBook_1360"}, -- 阿萨辛套书
	{1361, 2228, "ReadBook_1361"},	
	{1362, 2229, "ReadBook_1362"},
	{1363, 2230, "ReadBook_1363"},
	{1364, 2231, "ReadBook_1364"},
	{1368, 2233, "ReadBook_1368"}, -- 沙利亚套书
	{1369, 2234, "ReadBook_1369"},
	{1370, 2235, "ReadBook_1370"},
	{1371, 2236, "ReadBook_1371"},
	{1376, 2238, "ReadBook_1376"}, -- 慕容夫人套书
	{1377, 2239, "ReadBook_1377"},
	{1378, 2240, "ReadBook_1378"},
	{1379, 2241, "ReadBook_1379"},
	{1384, 2243, "ReadBook_1384"}, -- 乌蒙贵之标本作品集
	{1385, 2244, "ReadBook_1385"},
	{1386, 2245, "ReadBook_1386"},
	{1387, 2246, "ReadBook_1387"},
	{1392, 2248, "ReadBook_1392"},	-- 辽东第一擂
	{1393, 2249, "ReadBook_1393"},
	{1394, 2250, "ReadBook_1394"},
	{1395, 2251, "ReadBook_1395"},
	{1400, 2253, "ReadBook_1400"}, -- 龙渊第2擂·杂贺三忍
	{1401, 2254, "ReadBook_1401"},
	{1402, 2255, "ReadBook_1402"},
	{1403, 2256, "ReadBook_1403"},
	{1408, 2258, "ReadBook_1408"}, -- 龙渊第3擂·风魔兄弟
	{1409, 2259, "ReadBook_1409"},
	{1410, 2260, "ReadBook_1410"},
	{1411, 2261, "ReadBook_1411"},
	{1416, 2263, "ReadBook_1416"}, -- 龙渊第4擂·南诏双雄
	{1417, 2264, "ReadBook_1417"},
	{1418, 2265, "ReadBook_1418"},
	{1419, 2266, "ReadBook_1419"},     
	{1424, 2268, "ReadBook_1424"}, -- 龙渊第5擂
	{1425, 2269, "ReadBook_1425"},
	{1426, 2270, "ReadBook_1426"},
	{1427, 2271, "ReadBook_1427"},
	{1432, 2606, "ReadBook_1432"}, -- 把酒问月
	{1433, 2607, "ReadBook_1433"}, -- 饮中八仙歌
	{1434, 2608, "ReadBook_1434"}, -- 貂蝉拜月
	{1435, 2609, "ReadBook_1435"}, -- 中秋燃灯
	{1488, 3809, "ReadBook_1488"}, -- 四书五经小札·卷一
	{1489, 3810, "ReadBook_1489"},
	{1490, 3811, "ReadBook_1490"},
	{1491, 3812, "ReadBook_1491"},
	{1492, 3813, "ReadBook_1492"},
	{1493, 3814, "ReadBook_1493"},
	{1494, 3815, "ReadBook_1494"},
	{1495, 3816, "ReadBook_1495"},
	{1496, 3817, "ReadBook_1496"}, -- 四书五经小札·卷二
	{1497, 3818, "ReadBook_1497"},
	{1498, 3819, "ReadBook_1498"},
	{1499, 3820, "ReadBook_1499"},
	{1500, 3821, "ReadBook_1500"},
	{1501, 3822, "ReadBook_1501"},
	{1502, 3823, "ReadBook_1502"},
	{1688, 4189, "ReadBook_1688"}, -- 有情世界
	{1689, 4190, "ReadBook_1689"}, -- 剑的心
	{1690, 4191, "ReadBook_1690"}, -- 阳宝哥小传
	{1691, 4192, "ReadBook_1691"}, -- 鸦碎碎念
	{1692, 4193, "ReadBook_1692"}, -- 珞山传
	{1693, 4194, "ReadBook_1693"}, -- 乐冬传
	{1694, 4195, "ReadBook_1694"}, -- 香菜菜传
	{1695, 4196, "ReadBook_1695"}, -- 星空随笔
}

--------------挂件相关-----------------------
local ExtendRange = 
{
	{1, 730, "Extend_1"}, 
	{5, 731, "Extend_5"}, 
	{10, 732, "Extend_10"}, 
	{20, 733, "Extend_20"}, 
	{30, 1903, "Extend_30"}, 
	{50, 1904, "Extend_50"}, 
	{70, 1905, "Extend_70"}, 
	{80, 1906, "Extend_80"}, 
	{100, 1907, "Extend_100"}, 
	{150, 1908, "Extend_150"}, 
}

--------------修为相关-----------------------
local VenationTrain = 
{
	-- {nTrain, dwAchievementID, "KeyName"}, 		-- 修为值，成就ID，Key字符串名
	{5000, 99, "Venation_5000"}, 		-- 小周天
	{10000, 100, "Venation_10000"}, 		-- 大周天
	{20000, 101, "Venation_20000"}, 		-- 神功初成
	{50000, 102, "Venation_50000"}, 		-- 气聚丹田
	{98000, 103, "Venation_98000"}, 		-- 内息澎湃
}

local CheckReadBook = function(player)
	for k, v in ipairs(aReadBook) do
		if not player.IsAchievementAcquired(v[2]) and player.IsBookMemorized(GlobelRecipeID2BookID(v[1])) then
			RemoteCallToServer("OnClientAddAchievement", v[3])
		end
	end
end
	
--------------做成函数表，分散负载-----------
local ActiveFunctionList = 
{
	function(player) CheckPlayerAttributeAch(player, player.nLevel, LevelRange) end,
	function(player) CheckPlayerAttributeAch(player, player.GetMoney().nGold, MoneyRange) end,
	function(player) CheckPlayerAttributeAch(player, player.GetAcquiredDesignationCount(), DesignationRange) end,
	function(player) CheckPlayerReputeLevelAch(player, ReputeRange) end,
	function(player) CheckPlayerAttributeAch(player, player.nContribution, ContributionRange) end,
	function(player) CheckPlayerAttributeAch(player, player.nCurrentPrestige, PrestigeRange) end,
	function(player) CheckPlayerAttributeAch(player, #player.GetAllWaistPendent(true) + #player.GetAllBackPendent(true) + #player.GetAllFacePendent(true), ExtendRange) end,
	CheckReadBook,
	function(player) CheckPlayerAttributeAch(player, player.nCurrentTrainValue, VenationTrain) end,
}

local nActiveIndex = 1

-- 客户端玩家周期性调用,注意,只有客户端主角玩家才会调用,调用周期为1秒
function Activate(player)
	nActiveIndex = nActiveIndex or 1
	if nActiveIndex > #ActiveFunctionList then
		nActiveIndex = 1
	end
	ActiveFunctionList[nActiveIndex](player)
	nActiveIndex = nActiveIndex + 1
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com