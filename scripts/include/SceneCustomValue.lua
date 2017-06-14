---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/SceneCustomValue.lua
-- 更新时间:	03/15/11 17:18:06
-- 脚本说明:	注册场景变量的头文件，所有的场景变量注册都在这个文件中，命名规则应该是改场景的拼音大写字母。
----------------------------------------------------------------------<


SCENE_CUSTOM_VALUE_NAME = {
	
	ERSHIWURENGONGZHONGSHENWUYIJI = {		-- 25人宫中神武遗迹
		BOSS_OPEN 								=			{1, 1},			-- BOSS开启状态
		TWO_COUNT 								= 			{2, 2},			-- 第二阶段位置
		MONSTER_1 								= 			{3, 3},			-- 第一波小怪计数
		MONSTER_2								= 			{4, 4},			-- 第二波小怪计数
		MONSTER_3 								= 			{5, 5},			-- 第三波小怪计数
		POWER 									= 			{6, 6},			-- 是否出大招
		HUANLANG_OPEN 							= 			{7, 7},			-- 一闪·幻狼是否可用，false可用，true不可用
		ONE_LIFT_PASS 							= 			{8, 8},			-- 第一阶段是否开启
		TWO_LIFT_PASS 							= 			{9, 9},			-- 第二阶段
		THR_LIFT_PASS 							= 			{10, 10},		-- 第三阶段
		OUT_RESET 								= 			{11, 11},		-- 脱离战斗重置
		CHENGJIU_1405 							= 			{12, 12},		-- 成就1405不中！居合?贯诚
		CHENGJIU_1404 							= 			{13, 13},		-- 成就1404毫发无伤
		ADD_THREAT 								= 			{14, 14},		-- 加仇恨
		ADD_NPC_COUNT 							= 			{15, 15},		-- 第三阶段生成NPC数量
	},
	
--------------------------------------------------------------------------------------------------------------------------------
	
	BALINGXIAN = {								-- 巴陵县
		QUEST_TIERUSHAN 						= 			{0, 0},
		QUEST_MOYU 								= 			{1, 1},
		QUEST_HONGWUXUNZONG 					= 			{2, 2},
	},

--------------------------------------------------------------------------------------------------------------------------------

	BAILONGKOU = {								-- 白龙口
	},
	
--------------------------------------------------------------------------------------------------------------------------------

	BANGHUILINGDI = {							-- 帮会领地
		SOILDATA 								= 			{0, 479},		-- 土地信息
		PLAYER_COUNT 							= 			{480, 480},	-- 场景玩家数
		LAST_DESTROY 							= 			{481, 484},	-- 上次场景销毁时间
		TONG_TECH_TREE 							= 			{485, 548}, 	-- 测试用
		LAST_MONSTER 							= 			{549, 560},	-- 上次小怪刷新时间 * 3
		NEEDT_MONSTER 							= 			{561, 563}, 	-- 剩余刷怪次数 * 3
		CALAMITY_MONSTER 						= 			{564, 564}, 	-- 满级天劫刷怪波数标记
		CALAMITY_PLAYER 						= 			{565, 568}, 	-- 记录渡劫玩家ID
		FISH_ACTIVITY 							= 			{569, 572}, 	-- 记录钓鱼活动开始时间
		BOSS_POINT_INDEX 						= 			{573, 573},	-- Boss所在的路径点编号
		BOSS_POINTS_X 							= 			{574, 577},	-- Boss所在的X坐标
		BOSS_POINTS_Y 							= 			{578, 581},	-- Boss所在的Y坐标 
		BOSS_POINTS_Z 							= 			{582, 585},	-- Boss所在的Z坐标
		BOSS_CREATE_TIME 						= 			{586, 589},	-- Boss刷新时间
		MONSTER_EXIST 							= 			{590, 592},	-- Boss刷新时间
		CANTEEN_DOODAD 							= 			{593, 593}, 	-- 标记是否需要回收食堂Doodad		
		MONSTER_DIE 							= 			{594, 596}, 	-- 标记小怪是否死亡 * 3
		SOIL_LEVEL_COUNT 						= 			{597, 597},	-- 标记4级土地的数量
		PROPHECY_COUNT 							= 			{622, 622},	-- 仙人指路使用次数
		PROPHECY_TIME 							= 			{623, 626},	-- 仙人指路上次刷新时间（固定为每周一晨7时）
		PROPHECY_SUCCEED 						= 			{627, 627},	-- 仙人指路上次刷新时间
		FRAM_WEED_POINT 						= 			{628, 631},	-- 每周上交的发展点
		FRAM_WEED_TIME 							= 			{632, 635},	-- 每周上交的刷新时间
		TONG_MAP_FLAG 							= 			{636, 636}, 	-- 标记帮会是否拥有帮会领地
		TONG_OVERDUE_FLAG 						= 			{637, 637}, 	-- 标记帮会欠费情况
		TONG_MAP_FINANCE 						= 			{638, 639}, 	-- 记录帮会所欠费用
		YESTERDAY_DEVLOPMENT 					= 			{640, 643}, 	-- 记录帮会昨天的发展点总收益
		TONG_TIMER_COUNT 						= 			{644, 644}, 	-- 帮会总计时器计数
	},
	
--------------------------------------------------------------------------------------------------------------------------------
	
	CANGJIANSHANZHUANG = {					-- 藏剑山庄
		QUEST_KENQIUXIONGZHANGFANGSHENGLU		=			{1, 4}, 
		QUEST_YUWENQIANLUZAIHEFANG				=			{5, 8},
		CALL_BOSS_1 							= 			{9, 9},
		CALL_BOSS_2 							= 			{10, 10},
		CALL_BOSS_3 							= 			{11, 11},
		CALL_BOSS_4 							= 			{12, 12},
		CALL_BOSS_5 							= 			{13, 13},
		CALL_BOSS_6 							= 			{14, 14},
		QUEST_ENYUANJINGNIAN_LOCK				=			{15, 15}, 
		QUEST_ZIJING_PLAYERID					=			{16, 20}, 
		QUEST_ZIJING_PLAYERID_COUNT				=			{21, 21},
	},

--------------------------------------------------------------------------------------------------------------------------------

	CHANGAN = {								-- 长安
		EXAM_PLAYER_LIST 						= 			{279, 499},	-- 用于记录科举考试洛阳赛区的前10名名单
		ARENA_REGISTER_FLAG 					= 			{500, 500},	-- 用来记录玩家是否可以申请排队（保护时间内不能注册）
		ARENA_REGISTER_LIST 					= 			{501, 800},	-- 用来记录当天可以参加比赛的玩家列表(8人, 8*26=208B)
		ARENA_FIGHT_CONFIRM_TIME 				= 			{801, 802},	-- 用来记录当前擂台赛前准备确认时间(2B) 65536
		ARENA_FIGHT_TOTALBET 					= 			{803, 806},	-- 用来记录当前擂台总赌金池(4B)
		ARENA_FIGHT_TOTALTAX 					= 			{807, 810},	-- 用来记录当前擂台总税金池(4B)
		ARENA_SCENE_ID 							= 			{811, 814},	-- 用来记录当前场景的ID(4B)
		ARENA_FIGHT_LIST 						= 			{820, 880},	-- 用来记录当前擂台正在比赛的两人(2*26=52B)
		ARENA_FIGHT_LEVEL 						= 			{881, 881},	-- 用来记录当前擂台进行到第几轮(1B)
		ARENA_FIGHT_ROUND 						= 			{882, 882},	-- 用来记录当前擂台进行到第几场(1B)
		ARENA_FIGHT_GETPLAYERLIST 				= 			{883, 883},	-- 用来记录帮会擂台当天是否申请过
		--TONG_COMPETE_BLACK 					= 			{500, 503}, 	-- 用于记录长安帮会擂台黑方选手人气
		--TONG_COMPETE_WHITE 					= 			{504, 507}		-- 用于记录长安帮会擂台白方选手人气
	},

--------------------------------------------------------------------------------------------------------------------------------

	CHENGDU = {								-- 成都
		THE_1_PQ_dwID 							= 			{0, 3},			--第一个PQ的ID
	},

--------------------------------------------------------------------------------------------------------------------------------

	DAOXIANGCUN = {							-- 稻香村 
		SHOW_YANGBAOGE_ID 						= 			{11, 14},		-- 记录表演用阳宝哥的ID
		SHOW_LINMEIMEI_ID 						= 			{15, 18},		-- 记录表演用林妹妹的ID
		MOIVE_STATE 							= 			{32, 35},
		MOIVE_STATRER 							= 			{36, 39},
		MOIVE_TIMERID 							= 			{40, 43},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	DIHUAGONGHOUSHAN = {						-- 荻花宫后山
		ONE_BOSS_SHIREN_COUNT 					= 			{1, 1}, 		--一号boss尸人计数
		TWO_BOSS_HP 							= 			{2, 2},			--二号boss血量阶段
		THR_BOSS_SHOUWEI_COUNT 					= 			{3, 3}, 		--三号boss守卫计数
		THR_BOSS_RESET 							= 			{4, 4},
		FOU_1545_SUCCESS 						= 			{5, 5},
	},

--------------------------------------------------------------------------------------------------------------------------------	

	DIHUAGONGQIANSHAN = {						--荻花宫前山
		THE_NUMBER_OF_EFFIGY 					= 			{8, 9},			-- 记录旋转过圣女像总数
		IS_TRAPED 								= 			{10, 10},		--记录玩家是否触发过trap
		NUM_OF_DIE 								= 			{11, 11},		--记录死了多少个胖子
		NUM_OF_BOOM								= 			{12, 13},		--记录当前场景埋了多少天火雷
		PUZZLE_INDEX 							= 			{14, 14},		-- 记录当前场景的谜题标记
		PUZZLE_STEP_1							= 			{15, 15},		-- 按顺序记录神像的激活顺序
		PUZZLE_STEP_2							= 			{16, 16},
		PUZZLE_STEP_3 							= 			{17, 17},
		PUZZLE_STEP_4 							= 			{18, 18},
		PUZZLE_STEP_5 							= 			{19, 19},
		PUZZLE_STEP_6							= 			{20, 20},
		PUZZLE_HIDE_1 							= 			{21, 21},		-- 需要隐藏的3个数字
		PUZZLE_HIDE_2 							= 			{22, 22},		-- 需要隐藏的3个数字
		PUZZLE_HIDE_3 							= 			{23, 23},		-- 需要隐藏的3个数字
	},

--------------------------------------------------------------------------------------------------------------------------------
	
	DIHUASHENGDIAN = {							--荻花圣殿
		THE_3_BOSS_TARGET 						=		 {1, 4},			--三号BOSS追逐目标
		THE_3_POISON_1 							=		 {5, 5},			--第一个开启毒盅编号
		THE_3_POISON_2 							=		 {6, 6},			--第二个开启毒盅编号
		THE_3_POISON_3							=		 {7, 7},			--第三个开启毒盅编号
		THE_3_POISON_4							=		 {8, 8},			--第四个开启毒盅编号
		QIUXINGGUNSHI_TRAP_LOCK 				=		 {9, 9},			--5号BOSS区球形滚石开关
		QIUXINGGUNSHI_TRAP_PLAYER 				=		 {10, 10}, 			--5号BOSS区球形滚石关闭区域玩家人数
		THE_1_JISI_DEAD_COUNT 					=		 {11, 11}, 			--1号BOSS区域祭祀死亡个数
		THE_5_REPRESENT_LOCK 					=		 {12, 12},			--5号BOSS初始表现开关
	},

--------------------------------------------------------------------------------------------------------------------------------
	
	DONGTAIZHENFA = {							--动态阵法
		--
		ZHENFA_1 								= 		{1, 1}, 			-- 用来记录一号阵眼是否开启
		ZHENFA_2 								= 		{2, 2}, 			-- 二号
		ZHENFA_3 								= 		{3, 3}, 			-- …………
		ZHENFA_4 								= 		{4, 4}, 
		ZHENFA_5 								= 		{5, 5}, 
		ZHENFA_6 								=	 	{6, 6}, 
		ZHENFA_7								= 		{7, 7}, 
		ZHENFA_8								= 		{8, 8}, 
		ZHENFA_9 								= 		{9, 9}, 
		ZHENFA_10 								= 		{10, 10}, 			-- 十号
		PLAYER_1_X 								= 		{11, 14}, 			-- 用来记录释放阵法的玩家nX
		PLAYER_1_Y 								= 		{15, 18}, 			-- 用来记录释放阵法的玩家nY
		PLAYER_1_Z 								= 		{19, 22}, 			-- 用来记录释放阵法的玩家nZ
		PLAYER_1_ID								= 		{23, 26}, 			-- 用来记录释放阵法的玩家ID
		ZHENFA_TIME							 	= 		{27, 27}, 			-- 用来记录阵法持续时间
		ZHENFA_OPEN 							= 		{28, 28}, 			-- 阵法可否使用
		PLAYER_2_ID 							= 		{29, 32}, 			-- 用来记录一号玩家ID
		PLAYER_3_ID 							= 		{33, 36}, 			-- 用来记录二号玩家ID
		PLAYER_4_ID 							= 		{37, 40}, 			-- 用来记录三号玩家ID
		PLAYER_5_ID 							=	 	{41, 44}, 			-- 用来记录四号玩家ID
	},
	
--------------------------------------------------------------------------------------------------------------------------------
	
	DUSHENDIAN = {								-- 毒神殿
		THE_3_BOSS_STAGE_II 					= 		{1, 1},				--进入第二阶段计数
	},
	
--------------------------------------------------------------------------------------------------------------------------------

	ERRENGU = {-- 恶人谷
		CAMP_ACTIVITY_RESULT					=			{74, 74},		--用于记录阵营活动的结果，0为未有结果，1为防守方胜利，2为攻击方胜利 
		CAMP_ACTIVITY_STEP						=			{75, 75},		--用于记录阵营活动记录结果时的阶段数
		NPC_KEREN_DEAD_TIME						=			{76, 79},		--用于记录阵营活动BOSS可人的死亡时间
		NPC_SIKONGZHONGPING_DEAD_TIME			=			{80, 83},		--用于记录阵营活动BOSS司空仲平死亡时间
		NPC_ZHANGZHIYUAN_1_DEAD_TIME			=			{84, 87},		--用于记录阵营活动BOSS张桎辕死亡时间 
		NPC_ZHANGZHIYUAN_2_DEAD_TIME			=			{88, 91},		--用于记录阵营活动BOSS 张桎辕死亡时间
		NPC_ZHAIJIZHEN_DEAD_TIME				=			{92, 95},		--用于记录阵营活动BOSS翟季真死亡时间
		NPC_YUENONGHENG_DEAD_TIME				=			{96, 99},		--用于记录阵营活动BOSS月弄痕死亡时间
		NPC_YING_DEAD_TIME						=			{100, 103},		--用于记录阵营活动BOSS影死亡时间
		NPC_XIEYUAN_DEAD_TIME					=			{104, 107},		--用于记录阵营活动BOSS谢渊死亡时间
		NPC_TAOHANTING_DEAD_TIME				=			{108, 111},		--用于记录阵营活动BOSS陶寒亭死亡时间
		NPC_CHENHESHANG_DEAD_TIME				=			{112, 115},		--用于记录阵营活动BOSS陈和尚死亡时间
		NPC_MILIGULI_DEAD_TIME					=			{116, 119},		--用于记录阵营活动BOSS米丽古丽死亡时间
		NPC_LIUGONGZI_DEAD_TIME					=			{120, 123},		--用于记录阵营活动BOSS柳公子死亡时间
		NPC_SHENMIANFENG_DEAD_TIME				=			{124, 127},		--用于记录阵营活动BOSS沈眠风死亡时间
		NPC_KANGXUEZHU_DEAD_TIME				=			{128, 131},		--用于记录阵营活动BOSS康雪烛死亡时间
		NPC_XIAOYAOER_DEAD_TIME					=			{132, 135},		--用于记录阵营活动BOSS肖药儿死亡时间
		NPC_YAN_DEAD_TIME						=			{136, 139},		--用于记录阵营活动BOSS烟死亡时间
		NPC_MOYU_DEAD_TIME						=			{140, 143},		--用于记录阵营活动BOSS莫雨死亡时间
		NPC_WANGYIFENG_DEAD_TIME				=			{144, 147},		--用于记录阵营活动BOSS王遗风死亡时间
		NPC_BOSS_DEAD_COUNT						=			{148, 148},		--用于记录阵营活动BOSS死亡个数 
		NPC_KEREN_DEAD_NX						=			{149, 152},		--用于记录阵营活动BOSS可人的死亡X坐标
		NPC_KEREN_DEAD_NY						=			{153, 156},		--用于记录阵营活动BOSS可人的死亡Y坐标
		NPC_KEREN_DEAD_NZ						=			{157, 160},		--用于记录阵营活动BOSS可人的死亡Z坐标
		NPC_SIKONGZHONGPING_DEAD_NX				=			{161, 164},		--用于记录阵营活动BOSS司空仲平的死亡X坐标
		NPC_SIKONGZHONGPING_DEAD_NY				=			{165, 168},		--用于记录阵营活动BOSS司空仲平的死亡Y坐标
		NPC_SIKONGZHONGPING_DEAD_NZ				=			{169, 172},		--用于记录阵营活动BOSS司空仲平的死亡Z坐标	 
		NPC_ZHANGZHIYUAN_1_DEAD_NX				=			{173, 176},		--用于记录阵营活动BOSS张桎辕的死亡X坐标
		NPC_ZHANGZHIYUAN_1_DEAD_NY				=			{177, 180},		--用于记录阵营活动BOSS张桎辕的死亡Y坐标
		NPC_ZHANGZHIYUAN_1_DEAD_NZ				=			{181, 184},		--用于记录阵营活动BOSS张桎辕的死亡Z坐标	
		NPC_ZHANGZHIYUAN_2_DEAD_NX				=			{185, 188},		--用于记录阵营活动BOSS张桎辕的死亡X坐标
		NPC_ZHANGZHIYUAN_2_DEAD_NY				=			{189, 192},		--用于记录阵营活动BOSS张桎辕的死亡Y坐标
		NPC_ZHANGZHIYUAN_2_DEAD_NZ				=			{193, 196},		--用于记录阵营活动BOSS张桎辕的死亡Z坐标	
		NPC_ZHAIJIZHEN_DEAD_NX					=			{197, 200},		--用于记录阵营活动BOSS翟季真的死亡X坐标
		NPC_ZHAIJIZHEN_DEAD_NY					=			{201, 204},		--用于记录阵营活动BOSS翟季真的死亡Y坐标
		NPC_ZHAIJIZHEN_DEAD_NZ					=			{205, 208},		--用于记录阵营活动BOSS翟季真的死亡Z坐标	
		NPC_YUENONGHENG_DEAD_NX					=			{209, 212},		--用于记录阵营活动BOSS月弄痕的死亡X坐标
		NPC_YUENONGHENG_DEAD_NY					=			{213, 216},		--用于记录阵营活动BOSS月弄痕的死亡Y坐标
		NPC_YUENONGHENG_DEAD_NZ					=			{217, 220},		--用于记录阵营活动BOSS月弄痕的死亡Z坐标	
		NPC_YING_DEAD_NX						=			{221, 224},		--用于记录阵营活动BOSS影的死亡X坐标
		NPC_YING_DEAD_NY						=			{225, 228},		--用于记录阵营活动BOSS影的死亡Y坐标
		NPC_YING_DEAD_NZ						=			{229, 232},		--用于记录阵营活动BOSS影的死亡Z坐标	
		NPC_XIEYUAN_DEAD_NX						=			{233, 236},		--用于记录阵营活动BOSS谢渊的死亡X坐标
		NPC_XIEYUAN_DEAD_NY						=			{237, 240},		--用于记录阵营活动BOSS谢渊的死亡Y坐标
		NPC_XIEYUAN_DEAD_NZ						=			{241, 244},		--用于记录阵营活动BOSS谢渊的死亡Z坐标	
		NPC_TAOHANTING_DEAD_NX					=			{245, 248},		--用于记录阵营活动BOSS陶寒亭的死亡X坐标
		NPC_TAOHANTING_DEAD_NY					=			{249, 252},		--用于记录阵营活动BOSS陶寒亭的死亡Y坐标
		NPC_TAOHANTING_DEAD_NZ					=			{253, 256},		--用于记录阵营活动BOSS陶寒亭的死亡Z坐标	
		NPC_CHENHESHANG_DEAD_NX					=			{257, 260},		--用于记录阵营活动BOSS陈和尚的死亡X坐标
		NPC_CHENHESHANG_DEAD_NY					=			{261, 264},		--用于记录阵营活动BOSS陈和尚的死亡Y坐标
		NPC_CHENHESHANG_DEAD_NZ					=			{265, 268},		--用于记录阵营活动BOSS陈和尚的死亡Z坐标	
		NPC_MILIGULI_DEAD_NX					=			{269, 272},		--用于记录阵营活动BOSS米丽古丽的死亡X坐标
		NPC_MILIGULI_DEAD_NY					=			{273, 276},		--用于记录阵营活动BOSS米丽古丽的死亡Y坐标
		NPC_MILIGULI_DEAD_NZ					=			{277, 280},		--用于记录阵营活动BOSS米丽古丽的死亡Z坐标	
		NPC_LIUGONGZI_DEAD_NX					=			{281, 284},		--用于记录阵营活动BOSS柳公子的死亡X坐标
		NPC_LIUGONGZI_DEAD_NY					=			{285, 288},		--用于记录阵营活动BOSS柳公子的死亡Y坐标
		NPC_LIUGONGZI_DEAD_NZ					=			{289, 292},		--用于记录阵营活动BOSS柳公子的死亡Z坐标	
		NPC_SHENMIANFENG_DEAD_NX				=			{293, 296},		--用于记录阵营活动BOSS沈眠风的死亡X坐标
		NPC_SHENMIANFENG_DEAD_NY				=			{297, 300},		--用于记录阵营活动BOSS沈眠风的死亡Y坐标
		NPC_SHENMIANFENG_DEAD_NZ				=			{301, 304},		--用于记录阵营活动BOSS沈眠风的死亡Z坐标	
		NPC_KANGXUEZHU_DEAD_NX					=			{305, 308},		--用于记录阵营活动BOSS康雪烛的死亡X坐标
		NPC_KANGXUEZHU_DEAD_NY					=			{309, 312},		--用于记录阵营活动BOSS康雪烛的死亡Y坐标
		NPC_KANGXUEZHU_DEAD_NZ					=			{313, 316},		--用于记录阵营活动BOSS康雪烛的死亡Z坐标	
		NPC_XIAOYAOER_DEAD_NX					=			{317, 320},		--用于记录阵营活动BOSS肖药儿的死亡X坐标
		NPC_XIAOYAOER_DEAD_NY					=			{321, 324},		--用于记录阵营活动BOSS肖药儿的死亡Y坐标
		NPC_XIAOYAOER_DEAD_NZ					=			{325, 328},		--用于记录阵营活动BOSS肖药儿的死亡Z坐标	
		NPC_YAN_DEAD_NX							=			{329, 332},		--用于记录阵营活动BOSS烟的死亡X坐标
		NPC_YAN_DEAD_NY							=			{333, 336},		--用于记录阵营活动BOSS烟的死亡Y坐标
		NPC_YAN_DEAD_NZ							=			{337, 340},		--用于记录阵营活动BOSS烟的死亡Z坐标	
		NPC_MOYU_DEAD_NX						=			{341, 344},		--用于记录阵营活动BOSS莫雨的死亡X坐标
		NPC_MOYU_DEAD_NY						=			{345, 348},		--用于记录阵营活动BOSS莫雨的死亡Y坐标
		NPC_MOYU_DEAD_NZ						=			{349, 352},		--用于记录阵营活动BOSS莫雨的死亡Z坐标	
		NPC_WANGYIFENG_DEAD_NX					=			{353, 356},		--用于记录阵营活动BOSS王遗风的死亡X坐标
		NPC_WANGYIFENG_DEAD_NY					=			{357, 360},		--用于记录阵营活动BOSS王遗风的死亡Y坐标
		NPC_WANGYIFENG_DEAD_NZ					=			{361, 364},		--用于记录阵营活动BOSS王遗风的死亡Z坐标	
		REVIVE_TYPE_LOCK						=			{365, 365},		--用于记录阵营活动期间阵营地图复活点BUFF_TYPE的开关  
		NPC_MOYU_REVIVE_NX						=			{366, 366},		--用于记录阵营BOSS墨鱼的初始创建X坐标
		NPC_MOYU_REVIVE_NY						=			{367, 367},		--用于记录阵营BOSS墨鱼的初始创建Y坐标	 
		NPC_MOYU_REVIVE_NZ						=			{368, 368},		--用于记录阵营BOSS墨鱼的初始创建Z坐标	 	
		NPC_ZHAIJIZHEN_REVIVE_NX				=			{369, 369},		--用于记录阵营BOSS翟季真的初始创建X坐标
		NPC_ZHAIJIZHEN_REVIVE_NY				=			{370, 370},		--用于记录阵营BOSS翟季真的初始创建Y坐标	 
		NPC_ZHAIJIZHEN_REVIVE_NZ				=			{371, 371},		--用于记录阵营BOSS翟季真的初始创建Z坐标	
		NPC_BOSS_REVIVE_LOCK					=			{372, 372},		--用于记录阵营BOSS翟季真和莫雨在活动期间被击杀后重生的开关 	
		NPC_ZHENGOU_DEAD_TIME					=			{373, 376},		--用于记录阵营300WBOSS郑鸥的死亡时间
		NPC_ZHENGOU_DEAD_NX						=			{377, 380},		--用于记录阵营300WBOSS郑鸥的死亡X坐标
		NPC_ZHENGOU_DEAD_NY						=			{381, 384},		--用于记录阵营300WBOSS郑鸥的死亡Y坐标
		NPC_ZHENGOU_DEAD_NZ						=			{385, 388},		--用于记录阵营300WBOSS郑鸥的死亡Z坐标
		NPC_ZHOUFENG_DEAD_TIME					=			{389, 392},		--用于记录阵营300WBOSS周峰的死亡时间
		NPC_ZHOUFENG_DEAD_NX					=			{393, 396},		--用于记录阵营300WBOSS周峰的死亡X坐标
		NPC_ZHOUFENG_DEAD_NY					=			{397, 400},		--用于记录阵营300WBOSS周峰的死亡Y坐标
		NPC_ZHOUFENG_DEAD_NZ					=			{401, 404},		--用于记录阵营300WBOSS周峰的死亡Z坐标
		NPC_TAOJIE_DEAD_TIME					=			{405, 408},		--用于记录阵营300WBOSS陶杰的死亡时间
		NPC_TAOJIE_DEAD_NX						=			{409, 412},		--用于记录阵营300WBOSS陶杰的死亡X坐标
		NPC_TAOJIE_DEAD_NY						=			{413, 416},		--用于记录阵营300WBOSS陶杰的死亡Y坐标
		NPC_TAOJIE_DEAD_NZ						=			{417, 420},		--用于记录阵营300WBOSS陶杰的死亡Z坐标
		NPC_XIEYANKE_DEAD_TIME					=			{421, 424},		--用于记录阵营300WBOSS谢烟客的死亡时间
		NPC_XIEYANKE_DEAD_NX					=			{425, 428},		--用于记录阵营300WBOSS谢烟客的死亡X坐标
		NPC_XIEYANKE_DEAD_NY					=			{429, 432},		--用于记录阵营300WBOSS谢烟客的死亡Y坐标
		NPC_XIEYANKE_DEAD_NZ					=			{433, 436},		--用于记录阵营300WBOSS谢烟客的死亡Z坐标
		NPC_TAOGUODONG_DEAD_TIME				=			{437, 440},		--用于记录阵营300WBOSS陶国栋的死亡时间
		NPC_TAOGUODONG_DEAD_NX					=			{441, 444},		--用于记录阵营300WBOSS陶国栋的死亡X坐标
		NPC_TAOGUODONG_DEAD_NY					=			{445, 448},		--用于记录阵营300WBOSS陶国栋的死亡Y坐标
		NPC_TAOGUODONG_DEAD_NZ					=			{449, 452},		--用于记录阵营300WBOSS陶国栋的死亡Z坐标
		NPC_LVPEIJIE_DEAD_TIME					=			{453, 456},		--用于记录阵营300WBOSS吕沛杰的死亡时间
		NPC_LVPEIJIE_DEAD_NX					=			{457, 460},		--用于记录阵营300WBOSS吕沛杰的死亡X坐标
		NPC_LVPEIJIE_DEAD_NY					=			{461, 464},		--用于记录阵营300WBOSS吕沛杰的死亡Y坐标
		NPC_LVPEIJIE_DEAD_NZ					=			{465, 468},		--用于记录阵营300WBOSS吕沛杰的死亡Z坐标	
		NPC_ZHANGYIYANG_DEAD_TIME				=			{469, 472},		--用于记录阵营300WBOSS张一洋的死亡时间
		NPC_ZHANGYIYANG_DEAD_NX					=			{473, 476},		--用于记录阵营300WBOSS张一洋的死亡X坐标
		NPC_ZHANGYIYANG_DEAD_NY					=			{477, 480},		--用于记录阵营300WBOSS张一洋的死亡Y坐标
		NPC_ZHANGYIYANG_DEAD_NZ					=			{481, 484},		--用于记录阵营300WBOSS张一洋的死亡Z坐标	
		NPC_GUYANE_DEAD_TIME					=			{485, 488},		--用于记录阵营300WBOSS顾延恶的死亡时间
		NPC_GUYANE_DEAD_NX						=			{489, 492},		--用于记录阵营300WBOSS顾延恶的死亡X坐标
		NPC_GUYANE_DEAD_NY						=			{493, 496},		--用于记录阵营300WBOSS顾延恶的死亡Y坐标
		NPC_GUYANE_DEAD_NZ						=			{497, 500},		--用于记录阵营300WBOSS顾延恶的死亡Z坐标	
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	FAWANGKU = { -- 法王窟
	},

--------------------------------------------------------------------------------------------------------------------------------	

	FENGYUDAOXIANGCUN = {-- 风雨稻香村
		SHITAN = {69, 69}
	},

--------------------------------------------------------------------------------------------------------------------------------	
	FENGHUAGU = {-- 枫华谷
		DUNGEON_PLAYER_COUNT = {0, 3},								-- 记录尝试进入副本的玩家数量
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	GONGZHONGSHENWUYIJI = {-- 宫中神武遗迹 
		--
		BOSS_OPEN = {1, 1},			--BOSS开启状态
		TWO_COUNT = {2, 2},			--第二阶段位置
		MONSTER_1 = {3, 3},			--第一波小怪计数
		MONSTER_2 = {4, 4},			--第二波小怪计数
		MONSTER_3 = {5, 5},			--第三波小怪计数
		POWER = {6, 6},				--是否出大招
		HUANLANG_OPEN = {7, 7},		--一闪·幻狼是否可用，false可用，true不可用
		ONE_LIFT_PASS = {8, 8},		--第一阶段是否开启
		TWO_LIFT_PASS = {9, 9},		--第二阶段
		THR_LIFT_PASS = {10, 10},	--第三阶段
		OUT_RESET = {11, 11},		--脱离战斗重置
		CHENGJIU_1405 = {12, 12},	--成就1405不中！居合?贯诚
		CHENGJIU_1404 = {13, 13},	--成就1404毫发无伤
		ADD_THREAT = {14, 14},		--加仇恨
	},
	
--------------------------------------------------------------------------------------------------------------------------------		
	
	HAOQIMENG = {-- 浩气盟
		NPC_LIYUCHUN_DEATH_NX				=			{0, 3}, --用于记录NPC黎遇春死亡时候的X坐标
		NPC_LIYUCHUN_DEATH_NY				=			{4, 7}, --用于记录NPC黎遇春死亡时候的Y坐标
		QUEST_YANHUODAN_TIMER_ID			=			{8, 11}, --用于记录任务反间真相渐明了的计时器ID
		QUEST_YANHUODAN_PLAYER_ID			=			{12, 15}, --用于记录任务反间真相渐明了的玩家ID
		NPC_XIEJIAOWANG_DEATH_NX			=			{16, 19}, --用于记录NPC邪教王死亡时候的X坐标
		NPC_XIEJIAOWANG_DEATH_NY			=			{20, 23}, --用于记录NPC邪教王死亡时候的Y坐标
		NPC_YALONGKUANG_DEATH_NX			=			{24, 27}, --用于记录NPC哑聋狂死亡时候的X坐标
		NPC_YALONGKUANG_DEATH_NY			=			{28, 31}, --用于记录NPC哑聋狂死亡时候的Y坐标
		NPC_TIECHUISANG_DEATH_NX			=			{32, 35}, --用于记录NPC铁锤丧死亡时候的X坐标
		NPC_TIECHUISANG_DEATH_NY			=			{36, 39}, --用于记录NPC铁锤丧死亡时候的Y坐标
		NPC_YANGERNIANG_DEATH_NX			=			{40, 43}, --用于记录NPC杨二娘死亡时候的X坐标
		NPC_YANGERNIANG_DEATH_NY			=			{44, 47}, --用于记录NPC杨二娘死亡时候的Y坐标
		NPC_LUSHANLANG_DEATH_NX				=			{48, 51}, --用于记录NPC鹿山郎死亡时候的X坐标
		NPC_LUSHANLANG_DEATH_NY				=			{52, 55}, --用于记录NPC鹿山郎死亡时候的Y坐标
		NPC_TAOJIUAN_DEATH_NX				=			{56, 59}, --用于记录NPC陶九安死亡时候的X坐标
		NPC_TAOJIUAN_DEATH_NY				=			{60, 63}, --用于记录NPC陶九安死亡时候的Y坐标
		NPC_AO_REVIVE_CONTROL				=			{64, 64}, --用于记录NPC傲刷新控制，每杀20只傲小怪刷新一次
		QUEST_BIAOXIAN_LOCK_707				=			{65, 65}, --用于记录任务“大义灭亲泪痕殇”交任务表现开关
		NPC_ZHANGZHIYUAN_CONTROL_ID_1		=			{66, 69}, --用于记录张桎辕(ID:5193)的ID
		NPC_ZHANGZHIYUAN_CONTROL_ID_2		=			{70, 73}, --用于记录张桎辕(ID:5870)的ID
		CAMP_ACTIVITY_RESULT				=			{74, 74}, --用于记录阵营活动的结果，0为未有结果，1为防守方胜利，2为攻击方胜利 
		CAMP_ACTIVITY_STEP					=			{75, 75}, --用于记录阵营活动记录结果时的阶段数
		NPC_KEREN_DEAD_TIME					=			{76, 79}, --用于记录阵营活动BOSS可人的死亡时间
		NPC_SIKONGZHONGPING_DEAD_TIME		=			{80, 83}, --用于记录阵营活动BOSS司空仲平死亡时间
		NPC_ZHANGZHIYUAN_1_DEAD_TIME		=			{84, 87}, --用于记录阵营活动BOSS张桎辕死亡时间 
		NPC_ZHANGZHIYUAN_2_DEAD_TIME		=			{88, 91}, --用于记录阵营活动BOSS 张桎辕死亡时间
		NPC_ZHAIJIZHEN_DEAD_TIME			=			{92, 95}, --用于记录阵营活动BOSS翟季真死亡时间
		NPC_YUENONGHENG_DEAD_TIME			=			{96, 99}, --用于记录阵营活动BOSS月弄痕死亡时间
		NPC_YING_DEAD_TIME					=			{100, 103}, --用于记录阵营活动BOSS影死亡时间
		NPC_XIEYUAN_DEAD_TIME				=			{104, 107}, --用于记录阵营活动BOSS谢渊死亡时间
		NPC_TAOHANTING_DEAD_TIME			=			{108, 111}, --用于记录阵营活动BOSS陶寒亭死亡时间
		NPC_CHENHESHANG_DEAD_TIME			=			{112, 115}, --用于记录阵营活动BOSS陈和尚死亡时间
		NPC_MILIGULI_DEAD_TIME				=			{116, 119}, --用于记录阵营活动BOSS米丽古丽死亡时间
		NPC_LIUGONGZI_DEAD_TIME				=			{120, 123}, --用于记录阵营活动BOSS柳公子死亡时间
		NPC_SHENMIANFENG_DEAD_TIME			=			{124, 127}, --用于记录阵营活动BOSS沈眠风死亡时间
		NPC_KANGXUEZHU_DEAD_TIME			=			{128, 131}, --用于记录阵营活动BOSS康雪烛死亡时间
		NPC_XIAOYAOER_DEAD_TIME				=			{132, 135}, --用于记录阵营活动BOSS肖药儿死亡时间
		NPC_YAN_DEAD_TIME					=			{136, 139}, --用于记录阵营活动BOSS烟死亡时间
		NPC_MOYU_DEAD_TIME					=			{140, 143}, --用于记录阵营活动BOSS莫雨死亡时间
		NPC_WANGYIFENG_DEAD_TIME			=			{144, 147}, --用于记录阵营活动BOSS王遗风死亡时间
		NPC_BOSS_DEAD_COUNT					=			{148, 148}, --用于记录阵营活动BOSS死亡个数 
		NPC_KEREN_DEAD_NX					=			{149, 152}, --用于记录阵营活动BOSS可人的死亡X坐标
		NPC_KEREN_DEAD_NY					=			{153, 156}, --用于记录阵营活动BOSS可人的死亡Y坐标
		NPC_KEREN_DEAD_NZ					=			{157, 160}, --用于记录阵营活动BOSS可人的死亡Z坐标
		NPC_SIKONGZHONGPING_DEAD_NX			=			{161, 164}, --用于记录阵营活动BOSS司空仲平的死亡X坐标
		NPC_SIKONGZHONGPING_DEAD_NY			=			{165, 168}, --用于记录阵营活动BOSS司空仲平的死亡Y坐标
		NPC_SIKONGZHONGPING_DEAD_NZ			=			{169, 172}, --用于记录阵营活动BOSS司空仲平的死亡Z坐标	 
		NPC_ZHANGZHIYUAN_1_DEAD_NX			=			{173, 176}, --用于记录阵营活动BOSS张桎辕的死亡X坐标
		NPC_ZHANGZHIYUAN_1_DEAD_NY			=			{177, 180}, --用于记录阵营活动BOSS张桎辕的死亡Y坐标
		NPC_ZHANGZHIYUAN_1_DEAD_NZ			=			{181, 184}, --用于记录阵营活动BOSS张桎辕的死亡Z坐标	
		NPC_ZHANGZHIYUAN_2_DEAD_NX			=			{185, 188}, --用于记录阵营活动BOSS张桎辕的死亡X坐标
		NPC_ZHANGZHIYUAN_2_DEAD_NY			=			{189, 192}, --用于记录阵营活动BOSS张桎辕的死亡Y坐标
		NPC_ZHANGZHIYUAN_2_DEAD_NZ			=			{193, 196}, --用于记录阵营活动BOSS张桎辕的死亡Z坐标	
		NPC_ZHAIJIZHEN_DEAD_NX				=			{197, 200}, --用于记录阵营活动BOSS翟季真的死亡X坐标
		NPC_ZHAIJIZHEN_DEAD_NY				=			{201, 204}, --用于记录阵营活动BOSS翟季真的死亡Y坐标
		NPC_ZHAIJIZHEN_DEAD_NZ				=			{205, 208}, --用于记录阵营活动BOSS翟季真的死亡Z坐标	
		NPC_YUENONGHENG_DEAD_NX				=			{209, 212}, --用于记录阵营活动BOSS月弄痕的死亡X坐标
		NPC_YUENONGHENG_DEAD_NY				=			{213, 216}, --用于记录阵营活动BOSS月弄痕的死亡Y坐标
		NPC_YUENONGHENG_DEAD_NZ				=			{217, 220}, --用于记录阵营活动BOSS月弄痕的死亡Z坐标	
		NPC_YING_DEAD_NX					=			{221, 224}, --用于记录阵营活动BOSS影的死亡X坐标
		NPC_YING_DEAD_NY					=			{225, 228}, --用于记录阵营活动BOSS影的死亡Y坐标
		NPC_YING_DEAD_NZ					=			{229, 232}, --用于记录阵营活动BOSS影的死亡Z坐标	
		NPC_XIEYUAN_DEAD_NX					=			{233, 236}, --用于记录阵营活动BOSS谢渊的死亡X坐标
		NPC_XIEYUAN_DEAD_NY					=			{237, 240}, --用于记录阵营活动BOSS谢渊的死亡Y坐标
		NPC_XIEYUAN_DEAD_NZ					=			{241, 244}, --用于记录阵营活动BOSS谢渊的死亡Z坐标	
		NPC_TAOHANTING_DEAD_NX				=			{245, 248}, --用于记录阵营活动BOSS陶寒亭的死亡X坐标
		NPC_TAOHANTING_DEAD_NY				=			{249, 252}, --用于记录阵营活动BOSS陶寒亭的死亡Y坐标
		NPC_TAOHANTING_DEAD_NZ				=			{253, 256}, --用于记录阵营活动BOSS陶寒亭的死亡Z坐标	
		NPC_CHENHESHANG_DEAD_NX				=			{257, 260}, --用于记录阵营活动BOSS陈和尚的死亡X坐标
		NPC_CHENHESHANG_DEAD_NY				=			{261, 264}, --用于记录阵营活动BOSS陈和尚的死亡Y坐标
		NPC_CHENHESHANG_DEAD_NZ				=			{265, 268}, --用于记录阵营活动BOSS陈和尚的死亡Z坐标	
		NPC_MILIGULI_DEAD_NX				=			{269, 272}, --用于记录阵营活动BOSS米丽古丽的死亡X坐标
		NPC_MILIGULI_DEAD_NY				=			{273, 276}, --用于记录阵营活动BOSS米丽古丽的死亡Y坐标
		NPC_MILIGULI_DEAD_NZ				=			{277, 280}, --用于记录阵营活动BOSS米丽古丽的死亡Z坐标	
		NPC_LIUGONGZI_DEAD_NX				=			{281, 284}, --用于记录阵营活动BOSS柳公子的死亡X坐标
		NPC_LIUGONGZI_DEAD_NY				=			{285, 288}, --用于记录阵营活动BOSS柳公子的死亡Y坐标
		NPC_LIUGONGZI_DEAD_NZ				=			{289, 292}, --用于记录阵营活动BOSS柳公子的死亡Z坐标	
		NPC_SHENMIANFENG_DEAD_NX			=			{293, 296}, --用于记录阵营活动BOSS沈眠风的死亡X坐标
		NPC_SHENMIANFENG_DEAD_NY			=			{297, 300}, --用于记录阵营活动BOSS沈眠风的死亡Y坐标
		NPC_SHENMIANFENG_DEAD_NZ			=			{301, 304}, --用于记录阵营活动BOSS沈眠风的死亡Z坐标	
		NPC_KANGXUEZHU_DEAD_NX				=			{305, 308}, --用于记录阵营活动BOSS康雪烛的死亡X坐标
		NPC_KANGXUEZHU_DEAD_NY				=			{309, 312}, --用于记录阵营活动BOSS康雪烛的死亡Y坐标
		NPC_KANGXUEZHU_DEAD_NZ				=			{313, 316}, --用于记录阵营活动BOSS康雪烛的死亡Z坐标	
		NPC_XIAOYAOER_DEAD_NX				=			{317, 320}, --用于记录阵营活动BOSS肖药儿的死亡X坐标
		NPC_XIAOYAOER_DEAD_NY				=			{321, 324}, --用于记录阵营活动BOSS肖药儿的死亡Y坐标
		NPC_XIAOYAOER_DEAD_NZ				=			{325, 328}, --用于记录阵营活动BOSS肖药儿的死亡Z坐标	
		NPC_YAN_DEAD_NX						=			{329, 332}, --用于记录阵营活动BOSS烟的死亡X坐标
		NPC_YAN_DEAD_NY						=			{333, 336}, --用于记录阵营活动BOSS烟的死亡Y坐标
		NPC_YAN_DEAD_NZ						=			{337, 340}, --用于记录阵营活动BOSS烟的死亡Z坐标	
		NPC_MOYU_DEAD_NX					=			{341, 344}, --用于记录阵营活动BOSS莫雨的死亡X坐标
		NPC_MOYU_DEAD_NY					=			{345, 348}, --用于记录阵营活动BOSS莫雨的死亡Y坐标
		NPC_MOYU_DEAD_NZ					=			{349, 352}, --用于记录阵营活动BOSS莫雨的死亡Z坐标	
		NPC_WANGYIFENG_DEAD_NX				=			{353, 356}, --用于记录阵营活动BOSS王遗风的死亡X坐标
		NPC_WANGYIFENG_DEAD_NY				=			{357, 360}, --用于记录阵营活动BOSS王遗风的死亡Y坐标
		NPC_WANGYIFENG_DEAD_NZ				=			{361, 364}, --用于记录阵营活动BOSS王遗风的死亡Z坐标	
		REVIVE_TYPE_LOCK					=			{365, 365}, --用于记录阵营活动期间阵营地图复活点BUFF_TYPE的开关 
		NPC_MOYU_REVIVE_NX					=			{366, 366}, --用于记录阵营BOSS墨鱼的初始创建X坐标
		NPC_MOYU_REVIVE_NY					=			{367, 367}, --用于记录阵营BOSS墨鱼的初始创建Y坐标	 
		NPC_MOYU_REVIVE_NZ					=			{368, 368}, --用于记录阵营BOSS墨鱼的初始创建Z坐标	 	
		NPC_ZHAIJIZHEN_REVIVE_NX			=			{369, 369}, --用于记录阵营BOSS翟季真的初始创建X坐标
		NPC_ZHAIJIZHEN_REVIVE_NY			=			{370, 370}, --用于记录阵营BOSS翟季真的初始创建Y坐标	 
		NPC_ZHAIJIZHEN_REVIVE_NZ			=			{371, 371}, --用于记录阵营BOSS翟季真的初始创建Z坐标	
		NPC_BOSS_REVIVE_LOCK				=			{372, 372}, --用于记录阵营BOSS翟季真和莫雨在活动期间被击杀后重生的开关 	
		NPC_ZHENGOU_DEAD_TIME				=			{373, 376}, --用于记录阵营300WBOSS郑鸥的死亡时间
		NPC_ZHENGOU_DEAD_NX					=			{377, 380}, --用于记录阵营300WBOSS郑鸥的死亡X坐标
		NPC_ZHENGOU_DEAD_NY					=			{381, 384}, --用于记录阵营300WBOSS郑鸥的死亡Y坐标
		NPC_ZHENGOU_DEAD_NZ					=			{385, 388}, --用于记录阵营300WBOSS郑鸥的死亡Z坐标
		NPC_ZHOUFENG_DEAD_TIME				=			{389, 392}, --用于记录阵营300WBOSS周峰的死亡时间
		NPC_ZHOUFENG_DEAD_NX				=			{393, 396}, --用于记录阵营300WBOSS周峰的死亡X坐标
		NPC_ZHOUFENG_DEAD_NY				=			{397, 400}, --用于记录阵营300WBOSS周峰的死亡Y坐标
		NPC_ZHOUFENG_DEAD_NZ				=			{401, 404}, --用于记录阵营300WBOSS周峰的死亡Z坐标
		NPC_TAOJIE_DEAD_TIME				=			{405, 408}, --用于记录阵营300WBOSS陶杰的死亡时间
		NPC_TAOJIE_DEAD_NX					=			{409, 412}, --用于记录阵营300WBOSS陶杰的死亡X坐标
		NPC_TAOJIE_DEAD_NY					=			{413, 416}, --用于记录阵营300WBOSS陶杰的死亡Y坐标
		NPC_TAOJIE_DEAD_NZ					=			{417, 420}, --用于记录阵营300WBOSS陶杰的死亡Z坐标
		NPC_XIEYANKE_DEAD_TIME				=			{421, 424}, --用于记录阵营300WBOSS谢烟客的死亡时间
		NPC_XIEYANKE_DEAD_NX				=			{425, 428}, --用于记录阵营300WBOSS谢烟客的死亡X坐标
		NPC_XIEYANKE_DEAD_NY				=			{429, 432}, --用于记录阵营300WBOSS谢烟客的死亡Y坐标
		NPC_XIEYANKE_DEAD_NZ				=			{433, 436}, --用于记录阵营300WBOSS谢烟客的死亡Z坐标
		NPC_TAOGUODONG_DEAD_TIME			=			{437, 440}, --用于记录阵营300WBOSS陶国栋的死亡时间
		NPC_TAOGUODONG_DEAD_NX				=			{441, 444}, --用于记录阵营300WBOSS陶国栋的死亡X坐标
		NPC_TAOGUODONG_DEAD_NY				=			{445, 448}, --用于记录阵营300WBOSS陶国栋的死亡Y坐标
		NPC_TAOGUODONG_DEAD_NZ				=			{449, 452}, --用于记录阵营300WBOSS陶国栋的死亡Z坐标
		NPC_LVPEIJIE_DEAD_TIME				=			{453, 456}, --用于记录阵营300WBOSS吕沛杰的死亡时间
		NPC_LVPEIJIE_DEAD_NX				=			{457, 460}, --用于记录阵营300WBOSS吕沛杰的死亡X坐标
		NPC_LVPEIJIE_DEAD_NY				=			{461, 464}, --用于记录阵营300WBOSS吕沛杰的死亡Y坐标
		NPC_LVPEIJIE_DEAD_NZ				=			{465, 468}, --用于记录阵营300WBOSS吕沛杰的死亡Z坐标	
		NPC_ZHANGYIYANG_DEAD_TIME			=			{469, 472}, --用于记录阵营300WBOSS张一洋的死亡时间
		NPC_ZHANGYIYANG_DEAD_NX				=			{473, 476}, --用于记录阵营300WBOSS张一洋的死亡X坐标
		NPC_ZHANGYIYANG_DEAD_NY				=			{477, 480}, --用于记录阵营300WBOSS张一洋的死亡Y坐标
		NPC_ZHANGYIYANG_DEAD_NZ				=			{481, 484}, --用于记录阵营300WBOSS张一洋的死亡Z坐标	
		NPC_GUYANE_DEAD_TIME				=			{485, 488}, --用于记录阵营300WBOSS顾延恶的死亡时间
		NPC_GUYANE_DEAD_NX					=			{489, 492}, --用于记录阵营300WBOSS顾延恶的死亡X坐标
		NPC_GUYANE_DEAD_NY					=			{493, 496}, --用于记录阵营300WBOSS顾延恶的死亡Y坐标
		NPC_GUYANE_DEAD_NZ					=			{497, 500}, --用于记录阵营300WBOSS顾延恶的死亡Z坐标	
	},
	
--------------------------------------------------------------------------------------------------------------------------------		
	
	
	HEILONGZHAO = { -- 黑龙沼
	},
	
--------------------------------------------------------------------------------------------------------------------------------		
	
	JIMIETING = {--寂灭厅
	
	},
	
--------------------------------------------------------------------------------------------------------------------------------		
	
	JIANZHONG = {-- 剑冢
		YEFANGZHI_DOODAD = {1, 1}, -- 用来记录叶芳致宝箱是否放了
		PLAYER_TRAP_LOCK = {2, 2}, -- 用来记录剧情TRAP开关 
		XINSHOU			 = {3, 3}, 
		BOSS_1		     = {4, 4}, 
	},
	
--------------------------------------------------------------------------------------------------------------------------------		

	JINSHUIZHEN = {--金水镇
		FIGHT_TIMER = {4, 7},
		FIGHT_TIMER2 = {8, 11},
		FIGHT_TIMER3 = {12, 15},
		CIRCULARIZE_DOODADID = {16, 19},
		CIRCULARIZE_DOODAD_TIMERID = {20, 23},
		WANTED_JING = {44, 47}
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	JIUGONGQIGU = {-- 九宫棋谷
		CHESTS_CREATE_MARK			=		{0, 0}, -- 记录大宝箱刷新时取ID切换的位置
		CHESTS_CREATE_ARRAY			=		{1, 5}, -- 保存大宝箱刷新的序列
		PQ_SAVE_ID					=		{6, 9}, --记录PQID
		CHESTS_TIME_HAOQIMENG		=		{10, 10}, --浩气盟打开宝箱的次数
		CHESTS_TIME_ERENGU			=		{11, 11}, --恶人谷打开宝箱的次数
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	QUTANGXIA = { -- 瞿塘峡
		
		XIAODI_GROUP		= 		{0, 0},    --用于记录瞿塘峡顾全海手下的小弟走巡逻路径组合
		GUSHANJI_TEMPLE		=		{1, 1},
		JIEJIULONGZIZHONGDEREN		=		{2, 2},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	KONGWUFENG = {-- 空雾峰
		SHITAN = {68, 68},
		LAST_BOSS_DIE = {69,69}, --前面的位不要用，橘子直接写在脚本里了
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	KOUDAO = {--寇岛
		DOODAD_FIRE_ID = {300, 319}, 
		TIMER_FIRE_ID = {320, 329}, 
		IS_SPEAK_OF_MAOMAO = {340, 343}, 
		RIGHT_COORDINATE_X = {344, 347}, 
		RIGHT_COORDINATE_Y = {348, 351}, 
		RIGHT_COORDINATE_Z = {352, 355}, 
		WRONG_COORDINATE_X = {356, 359}, 
		WRONG_COORDINATE_Y = {360, 363}, 
		WRONG_COORDINATE_Z = {364, 367}, 
		NUMBER_OF_FIRE = {368, 371}, 
		SNAKE_EVENT = {380, 383}, 
		
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	KUNLUN = { -- 昆仑
		IS_QUEST_BOSS_EXIST = {0, 0},
		QUEST_DANTIAOHAISHIQUNOU = {1, 4},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	KUNLONGLING = {-- 困龙岭
		--
		RD = {6, 6}, --用来记录从第几个开始刷新
		PQ_ID = {1, 4}, -- 用来记录PQID
		COUNT_DOWN = {5, 5}, -- 用来记录开始倒计时步骤
		AI_OPEN = {7, 7},
		RANDOM_NICKNAME = {10, 10}, -- 从这里开始记录每组随机值
		OPEN = {11, 11}, --用来记录场景满足开启条件
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	LINGXIAOXIA = {--灵霄峡
		LAST_BOSS_DIE = {80, 80}, -- 是否开启最后出口,前面的位不要用，橘子直接写在脚本里了
	
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	LONGMENHUANGMO = {--龙门荒漠
		TABLE_ID			= 		{0, 0},    --用于记录龙门客栈有需求的客人所在的桌子ID
		GUEST_CHOOSE		=		{1, 1},    --用于记录龙门客栈客人选择的菜式ID
		HUOHAI_TRAP_ID		=		{2, 3},	   --用于记录火海TRAP的ID
		MUBAN_TRAP_ID		=		{4, 5},    --用于记录马贼刷新TRAP的ID
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	LUODAO = {--洛道
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	LUOYANG = {--洛阳
		EXAM_PLAYER_LIST = {279, 499}, 				-- 用于记录科举考试洛阳赛区的前10名名单
		ARENA_REGISTER_FLAG = {500, 500},			-- 用来记录玩家是否可以申请排队（保护时间内不能注册）
		ARENA_REGISTER_LIST = {501, 800},			-- 用来记录玩家排队申请决斗的列表(10人, 10*22=220B)
		ARENA_FIGHT_CONFIRM_TIME = {801, 802},		-- 用来记录当前擂台阶段场次(2B) 65536
		ARENA_FIGHT_TOTALBET = {803, 806},			-- 用来记录当前擂台总赌金池(4B)
		ARENA_FIGHT_TOTALTAX = {807, 810},			-- 用来记录当前擂台总税金池(4B)
		ARENA_SCENE_ID = {811, 814},				-- 用来记录当前场景的ID(4B)
		ARENA_FIGHT_LIST = {820, 870},				-- 用来记录当前擂台正在比赛的两人(2*22=44B)
		EXAM_PLAYER_LIST = {871, 1041}, 			-- 用于记录科举考试洛阳赛区的前10名名单
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	NANPINGSHAN = {-- 南屏山
		THE_PROTECT_NUMBER = {0, 1},	
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	QIXIU = {-- 七秀
		QIXIUXUNZHAOGEYAO		= 	{100, 100},	-- 寻找葛瑤任务标记位
		QIXIUBULU			= 	{101, 102},	-- 捕鹿取香任务仇恨记录
		QIXIUKANWANGXIAOSAN		= 	{103, 103},	-- 看望小三标记
		QIXIUSHUXIAOYU_PLAYER		=	{104, 107},  	--小语放灯独占任务PLAYER
		QIUXIUSHUXIAOYU_TIMER		=	{108, 111}, 	--小语放灯计时器
		QIUXIUYULOU					=	{112, 179}, 	--使用17个无符号4字节空间记录17个鱼篓的DWID
		QIXIUSHUININGWEIBING		=	{180, 183},  	--七秀水凝为冰任务变量记数
		QIXIUHUSONGXIER_PLAYER		=	{184, 187}, 	--七秀护送喜儿任务玩家ID记录
		QIXIUYANXIAOMOLU_PLAYER		=	{188, 191}, 	--七秀盐枭末路任务玩家ID记录
		QIXIUFENGHUAXUEYUE		=	{192, 195},  	--七秀风花雪月任务玩家ID记录
		QIXIUZHENJIANANFEN		=	{196, 199},  	--七秀真假难分任务玩家ID记录
		QIXIUJINGHUASHUIYUE		=	{200, 203},  	--七秀镜花水月任务玩家ID记录
		QIXIUYAODAZHUANG_PLAYER		=	{204, 207},	--七秀传说中的小七任务玩家ID记录
		QIXIU_YAODAZHUANG		=	{208, 211},	--七秀姚大壮状态计时器ID记录
		QIXIU_BANWU1 = {212, 215}, --水云坊二层伴舞女1号
		QIXIU_BANWU2 = {216, 219}, --水云坊二层伴舞女2号
		QIXIU_BANWU3 = {220, 223}, --水云坊二层伴舞女3号
		QIXIU_BANWU4 = {224, 227}, --水云坊二层伴舞女4号
		QIXIU_BANWU5 = {228, 231},--水云坊二层伴舞女5号
		QIXIU_BANWU6 = {232, 235}, --水云坊二层伴舞女6号
		SHIRENDADA = {236, 236},  --诗人达达念诗状态标记
		QUEST_FENGHUAXUEYUE_TIMER_ID	=	{237, 240}, 	--七秀风花雪月任务计时器ID记录
		QUEST_ZHENJIANANFEN_TIMER_ID	=	{241, 244},		--七秀真假难分任务计时器ID记录
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	RILUNSHANCHENG = {--日轮山城
		NEW_REVIVELOC_FLAG = {200, 201}, 			-- 用来记录新的复活点的开启状态
		EXAM_PLAYER_LIST = {202, 372}, 			-- 用于记录科举考试洛阳赛区的前10名名单
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	RONGTIANLING = {--融天岭
		THE_1_PQ_dwID = {0, 3},		--第一个PQ的ID
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	SHAOLIN = {-- 少林
		KONGFU_SHOW = {4, 7},
		DAOWU_SAY = {8, 11},
		BONZE_NAME = {20, 23},
		BONZE_EAT = {24, 27},
		TIMERID_YOUMENGSUI = {44, 47},
		SCENE_JUMP_RECORD = {48, 407}, 
		KONGFU_SHOW_TIME = {408, 408}, 
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	GAOLAOZHUANG = {--高老庄
		--
		PQ_ID = {1, 4},	-- 用来记录PQID
		COUNT_DOWN = {5, 5},	-- 用来记录开始倒计时步骤
		NPC_COUNT = {6, 6},		-- 用来记录当前是哪个序列
		NPC_NUMBER = {7, 7},		-- 用来记录刷到序列位数的多少波
		ALL_NPC_COUNT = {8, 8},	-- 用来记录总得刷怪序列波次
		OPEN = {9, 9},	--用来记录场景满足开启条件
		START_NPC_COUNT = {80, 80}	-- 用来记录怪顺序的，后面的场景变量千万不要使用！！！！！！！！！！
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	SHOUZHUWEICHANG = {-- 守株围场
		--
		PQ_ID = {1, 4}, 		-- 用来记录PQID
		COUNT_DOWN = {5, 5}, 	-- 用来记录开始倒计时步骤
		IS_START = {7, 7},		--记录是否开始战斗
		RANDOM_NICKNAME = {10, 50},	-- 从这里开始记录每组随机值
		OPEN = {8, 8},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	SICHOUZHILU = {--丝绸之路
		--
		PQ_ID = {1, 4}, 		-- 用来记录PQID
		HAO_PATH = {5, 5},		-- 用来记录 ××浩气盟×× 镖车到达的路径点
		E_PATH = {6, 6},		-- 用来记录 ××恶人谷×× 镖车到达的路径点
		HAO_BIAOCHE = {7, 7},	-- 用来记录 ××浩气盟×× 镖车是否出发
		E_BIAOCHE = {8, 8},		-- 用来记录 ××恶人谷×× 镖车是否出发
		HAO_DEATH = {9, 9},		-- 用来记录 ××浩气盟×× 镖车是否死亡
		E_DEATH = {10, 10},		-- 用来记录 ××恶人谷×× 镖车是否死亡
		OPEN = {11, 11},		-- 用来记录战场是否开始
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	TIANCE = { -- 天策
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	TIANDISANCAIZHEN = {					--天地三才阵
		YIHAOXIANJING = {0, 0}, -- 天雷一号陷阱
		ERHAOXIANJING = {1, 1}, -- 天雷二号陷阱
		SANHAOXIANJING = {2, 2}, -- 天雷三号陷阱
		CHENYONGRENYIDONG = {3, 3}, -- 1号BOSS死亡判断让陈勇仁走出来。
		XINSHOU = {4, 4}, -- 新人召唤BOSS占位标记。
		DIEBOSS2 = {5, 5}, -- 邓文峰死亡标记
		LAST_BOSS_DIE = {6, 6} -- 最后的出口
	},

--------------------------------------------------------------------------------------------------------------------------------	
	
	TIANGONGFANG = {					--天工坊
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	TIANZIFENG = {					-- 天子峰
		BOSS_3_HEIQI_NUMBER			=		{0, 0}, --天子峰BOSS3棋局黑棋剩余数目
		BOSS_3_TIMER_ID				=		{1, 4},	--天子峰BOSS3计时器ID
		BOSS_3_BEGIN_LOCK			=		{5, 5}, --天子峰BOSS3棋局开启开关
		BOSS_4_CREATENPC_LOCK		=		{6, 6}, --天子峰BOSS4刷怪开关
		BOSS_4_TIMER_ID				=		{7, 10}, --天子峰BOSS4
		BOSS_1_YIMING_DIALOGUE_LOCK	=		{11, 11}, --天子峰BOSS1前易明二人组对话开关
		NEW_REVIVELOC_FLAG			=		{12, 12}, --天子峰副本复活点开关
		BOSS_2_XINHAODAN_LOCK		=		{13, 13}, --天子峰BOSS2计时器ID
		BOSS_2_FIGHT_LOCK			=		{14, 14}, --天子峰BOSS2战斗开关
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	WANHUA = { 										--万花
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	WULIANGGONG = {									--无量宫
		BOSS_1_SHOW 								= 		{0, 0}, 		--用于记录1号BOSS是否表现完成
		SNAKE_SHOW 									=		{1, 1}, 		--用于记录蛇是否表现完成
		BOSS_2_SHOW 								= 		{2, 2}, 		--用于记录2号BOSS伊曼云是否表现完成
		BOSS_2_DICHEN_SHOW 							= 		{3, 3}, 		--用于记录2号BOSS翟尘是否表现完成
		BOSS_3_SHOW 								= 		{4, 4}, 		--用于记录3号BOSS是否表现完成
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	WULIANGSHAN = { 								--无量山
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	WUYANDAO = {									--无盐岛
		YINCANG = {67, 67}
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	WUDU = { 										--五毒
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	XIANZHONLIN = {									--仙踪林
		--
		THE_18_COUNT = {1, 1},							--十八波阶段，0初始化为没开始，1为直接刷1号，2为过号后，3为直接刷2号，4为十八波结束
		TWO_BOSS_RESET = {2, 2},						--二号BOSS重置位置
		THR_BOSS_RESET = {3, 3},						--三号BOSS重置位置
		THE_18_FAIL = {4, 4},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	XIANKONGAO = {									-- 陷空坳
		WEALTH_KEY = {1, 1}, --宝藏的位置数
		GRIDE_INDEX = {2, 2}, --随机到得一种九宫格布局索引
		GRIDE_SHOW_INDEX1 = {3, 3}, --
		GRIDE_SHOW_INDEX2 = {4, 4}, 
		GRIDE_SHOW_INDEX3 = {5, 5}, 
		GRIDE_SHOW_INDEX4 = {6, 6}, 
		BOSS_CALL_COUNT = {7, 7}, 
		GUANCAI = {8, 8}, 
		JI_GUAN_REN = {9, 9},
		MU_JIA_REN = {10, 10},
		JI_JIA_SHOU = {11, 11},
		WU_GONG = {12, 12},
		XIE_ZHI = {13, 13},
		ZHI_ZHU = {14, 14},
		WU_SHI = {15, 15},
		OPEN_ORGAN = {16, 16},
		DAO_MU_ZEI = {17, 17},
		BIG_BOSS = {18, 18},
		SHI_SHA = {19, 19},
		PLAYERS_READY = {20, 20},
		JI_JIA_LONG = {21, 21},
		PQ_ID = {22, 25},
		FINISH_JI_FEN = {26, 26},
		JI_JIA_LONG = {27, 27},
		WU_SHI = {28, 28}
	},

--------------------------------------------------------------------------------------------------------------------------------	

	YANGZHOU = {								--扬州
		EXAM_PLAYER_LIST = {279, 499}, 			-- 用于记录科举考试洛阳赛区的前10名名单
		ARENA_REGISTER_FLAG = {500, 500},			-- 用来记录玩家是否可以申请排队（保护时间内不能注册）
		ARENA_REGISTER_LIST = {501, 800},			-- 用来记录当天可以参加比赛的玩家列表(8人, 8*26=208B)
		ARENA_FIGHT_CONFIRM_TIME = {801, 802},		-- 用来记录当前擂台赛前准备确认时间(2B) 65536
		ARENA_FIGHT_TOTALBET = {803, 806},			-- 用来记录当前擂台总赌金池(4B)
		ARENA_FIGHT_TOTALTAX = {807, 810},			-- 用来记录当前擂台总税金池(4B)
		ARENA_SCENE_ID = {811, 814},				-- 用来记录当前场景的ID(4B)
		ARENA_FIGHT_LIST = {820, 880},				-- 用来记录当前擂台正在比赛的两人(2*26=52B)
		ARENA_FIGHT_LEVEL = {881, 881},				-- 用来记录当前擂台进行到第几轮(1B)
		ARENA_FIGHT_ROUND = {882, 882},				-- 用来记录当前擂台进行到第几场(1B)
		ARENA_FIGHT_GETPLAYERLIST = {883, 883},				-- 用来记录帮会擂台当天是否申请过
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YAOXINGPING = {								--邀星坪
		PQ_ID = {1, 4}, 		-- 用来记录PQID
		COUNT_DOWN = {5, 5}, 	-- 用来记录开始倒计时步骤
		COUNT_KILL = {8, 8},
		RANDOM_POSITION = {10, 50},	-- 从这里开始记录每组随机值
		OPEN = {7, 7},
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	WUZIMIJU = { 								-- 五子迷局
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGCHIGUOTIANWANGDIAN = {				-- 英雄持国天王殿
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGDAOXIANCUN = { 					-- 英雄稻香村
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGDIHUAGONGHOUSHAN = {				--英雄荻花宫后山
		ONE_BOSS_SHIREN_COUNT = {1, 1}, --一号boss尸人计数
		TWO_BOSS_HP = {2, 2},			--二号boss血量阶段
		THR_BOSS_SHOUWEI_COUNT = {3, 3}, --三号boss守卫计数
		THR_BOSS_RESET = {4, 4},
		FOU_1545_SUCCESS = {5, 5},
		FINALLY_GUT = {6, 6},				--最终剧情段落，默认FALSE是时间挑战成功，TRUE是挑战失败
		PQ_ENDTIME = {7, 10}, --pq的结束时间--限时PQ脚本 BY:徐烔
		PQ_STATE = {11, 11}, --pq状态 0：未开启。 1：已开启 。2：成功结束。3：失败结束。--限时PQ脚本 BY:徐烔
		PQ_BOSSKILLED = {12, 12}, --记录已击杀的BOSS数，用于PQ进度--限时PQ脚本 BY:徐烔
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	YINGXIONGDIHUAGONGQIANSHAN = {					--英雄荻花宫前山
		ONE_BOSS_SHIREN_COUNT = {1, 1}, --一号boss尸人计数
		TWO_BOSS_HP = {2, 2},			--二号boss血量阶段
		THR_BOSS_SHOUWEI_COUNT = {3, 3}, --三号boss守卫计数
		THR_BOSS_RESET = {4, 4},
		FOU_1545_SUCCESS = {5, 5},
		FINALLY_GUT = {6, 6},				--最终剧情段落，默认FALSE是时间挑战成功，TRUE是挑战失败
		PQ_ENDTIME = {7, 10}, --pq的结束时间--限时PQ脚本 BY:徐烔
		PQ_STATE = {11, 11}, --pq状态 0：未开启。 1：已开启 。2：成功结束。3：失败结束。--限时PQ脚本 BY:徐烔
		PQ_BOSSKILLED = {12, 12}, --记录已击杀的BOSS数，用于PQ进度--限时PQ脚本 BY:徐烔
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGGONGZHONGSHENWUYIJI = {				-- 英雄宫中神武遗迹
		--
		BOSS_OPEN = {1, 1},			--BOSS开启状态
		TWO_COUNT = {2, 2},			--第二阶段位置
		MONSTER_1 = {3, 3},			--第一波小怪计数
		MONSTER_2 = {4, 4},			--第二波小怪计数
		MONSTER_3 = {5, 5},			--第三波小怪计数
		POWER = {6, 6},				--是否出大招
		HUANLANG_OPEN = {7, 7},		--一闪·幻狼是否可用，false可用，true不可用
		ONE_LIFT_PASS = {8, 8},		--第一阶段是否开启
		TWO_LIFT_PASS = {9, 9},		--第二阶段
		THR_LIFT_PASS = {10, 10},	--第三阶段
		OUT_RESET = {11, 11},		--脱离战斗重置
		CHENGJIU_1405 = {12, 12},	--成就1405不中！居合?贯诚
		CHENGJIU_1404 = {13, 13},	--成就1404毫发无伤
		ADD_THREAT = {14, 14},		--加仇恨
		ADD_NPC_COUNT = {15, 15},	--第三阶段生成NPC数量
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGJIANZHONG = {					--英雄剑冢
		BUFF_SPRING_LEVEL					=						{1, 1},			--用于记录春意傲然BUFF的等级 
		BUFF_SUMMER_LEVEL					=						{2, 2}, 			--用于记录夏日炎炎BUFF的等级
		BUFF_AUTUMN_LEVEL					=						{3, 3}, 			--用于记录秋风落叶BUFF的等级
		BUFF_WINTER_LEVEL					=						{4, 4},			--用于记录寒风刺骨BUFF的等级
		BUFF_SPRING_BEGIN_TIME				=						{5, 8}, 			--用于记录春意傲然BUFF的产生时间
		BUFF_SUMMER_BEGIN_TIME				=						{9, 12}, 		--用于记录夏日炎炎BUFF的产生时间
		BUFF_AUTUMN_BEGIN_TIME				=						{13, 16}, 		--用于记录秋风落叶BUFF的产生时间
		BUFF_WINTER_BEGIN_TIME				=						{17, 20}, 		--用于记录寒风刺骨BUFF的产生时间	
		BOSS1								=						{21, 21},		--用于记录BOSS死亡
		BOSS7								=						{22, 22},		--用于记录BOSS死亡
		BOSS2								=						{23, 23},		--用于记录BOSS死亡
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGKONGWUFENG = {							-- 英雄空雾峰
		YINYANGSHI_DOODADA_ID						=				{0, 3},		--记录英雄空雾峰阴阳师关卡DOODAD的ID
		TENGYUANYINGNAI_INVINCIBILITY 				=				{4, 4},		--记录英雄空雾峰藤原樱奈的无敌状态是否消除过
		BOSS_1_DIALOGUE_LOCK						=				{5, 5},		--记录梅剑雄对话TRAP开关
		EXIT_TRAP_LOCK								=				{6, 6}, -- 副本刷新出口TRAP开关 
	},

--------------------------------------------------------------------------------------------------------------------------------	

	YINGXIONGLINGXIAOXIA = {			--英雄灵霄峡
		HUIZHONGJIUROU				= 			{0, 3}, -- 一号BOSS，AI标记使用
		FOXIANGTRAP					= 			{4, 4}, -- 佛像前绕过1号BOSS的TARP
		RUKOUJINGJIE 				=		    {5, 5}, -- 入口处的警戒TARP
		EXIT_TRAP_LOCK				=			{6, 6}, -- 副本刷新出口TRAP开关 
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGRILUNSHANCHENG = {			--英雄日轮山城
		ONE_BOSS_RELIVE = {1, 1}, 		-- 用来记录一号开启状态
		ONE_BOSS_RELIVE_AGAIN = {2, 2}, -- 用来记录一号是否刷新过
		ONE_BOSS_DOWN = {3, 3},			-- 用来记录一号是否通过
		THIRD_BOSS_START = {4, 4},		-- 用来记录三号是否开始
		THIRD_BOSS_DOWN = {5, 5},		-- 用来记录三号是否通过
		HOOK_DOWN_TEST = {6, 6},		-- 用来记录测试陷阱是否开启
		HOOK_DOWN_ALL = {7, 7},			-- 用来记录所有陷阱是否开启
		HOOK_WALL_A_01 = {8, 8},		-- 用来记录壁火A_01是否开启
		HOOK_WALL_A_02 = {9, 9},		-- 用来记录壁火A_02是否开启
		HOOK_WALL_B_01 = {10, 10},		-- 用来记录壁火B_01是否开启
		HOOK_WALL_B_02 = {11, 11},		-- 用来记录壁火B_02是否开启
		HOOK_LIST_BLUE = {12, 12},		-- 用来记录蓝色陷阱是否开启
		HOOK_LIST_RED = {13, 13},		-- 用来记录红色陷阱是否开启
		HOOK_LIST_YELLOW = {14, 14},	-- 用来记录黄色陷阱是否开启
		HOOK_LIST_PURPLE = {15, 15},	-- 用来记录紫色陷阱是否开启
		HOOK_LIST_BLUENESS = {16, 16},	-- 用来记录青色陷阱是否开启
		HOOK_LIST_ALL = {17, 17},		-- 用来记录全部陷阱是否开启
		THIRD_SHOW = {18, 18},			-- 用来记录三号之前的演出状态
		THIRD_ZAYI = {19, 19},			-- 用来记录刷了多少杂役
		ONE_TRACK = {20, 20},			-- 用来记录五芒星阵轨迹状态
		TWO_BOSS_START = {21, 21},		-- 用来记录二号是否开始
		TWO_BOSS_DOWN = {22, 22},		-- 用来记录二号是否通过
		HOOK_LIFT_ALL = {23, 23},		-- 用来记录左侧全部陷阱是否开启
		THIRD_BOSS_FORCE = {24, 24},	-- 用来记录三号是否可以转换状态
		ONE_SKILL_COUNT = {25, 25},		-- 用来记录一号释放技能
		ONE_TRACK_1 = {26, 26},			-- 用来记录是否刷过属性1
		ONE_TRACK_2 = {27, 27},			-- 用来记录是否刷过属性2
		ONE_TRACK_3 = {28, 28},			-- 用来记录是否刷过属性3
		ONE_TRACK_4 = {29, 29},			-- 用来记录是否刷过属性4
		FOUR_SHOW = {30, 30},			-- 用来记录四号表现是否用过
		FOUR_DOWN = {31, 31},			-- 用来记录四号是否已过
		SUCCESS_1167 = {32, 32},		-- 用来记录1167号成就
		SUCCESS_1169 = {33, 33},		-- 用来记录1169号成就
		TWO_BAO = {34, 34},				-- 用来记录二号包裹是否掉落
		PLAYER_1 = {35, 38},			-- 用来记录玩家1的ID
		PLAYER_2 = {39, 42},			-- 用来记录玩家2的ID
		PLAYER_3 = {43, 46},			-- 用来记录玩家3的ID
		PLAYER_4 = {47, 50},			-- 用来记录玩家4的ID
		PLAYER_5 = {51, 54},			-- 用来记录玩家5的ID
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGTIANDISANCAIZHEN = {				--英雄天地三才阵
		YIHAOXIANJING							= 			{0, 0}, -- 神机一号陷阱
		ERHAOXIANJING							= 			{1, 1}, -- 神机二号陷阱
		SANHAOXIANJING							= 			{2, 2}, -- 神机三号陷阱
		SHENJINU 								= 			{3, 3}, -- 标记神机弩机的对话状态。
		EXIT_TRAP_LOCK							=			{4, 4}, -- 副本刷新出口TRAP开关 
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGTIANGONGFAN = {					-- 英雄天宫坊
		EXIT_TRAP_LOCK							=			{10, 10}, -- 副本刷新出口TRAP开关 
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGTIANZIFENG = {						-- 英雄天子峰
		BOSS_3_HEIQI_NUMBER						=			{0, 0}, 		 --天子峰BOSS3棋局黑棋剩余数目
		BOSS_3_TIMER_ID							=			{1, 4},		   	 --天子峰BOSS3计时器ID
		BOSS_3_BEGIN_LOCK						=			{5, 5}, 		 --天子峰BOSS3棋局开启开关
		BOSS_4_CREATENPC_LOCK					=			{6, 6}, 		 --天子峰BOSS4刷怪开关
		BOSS_4_TIMER_ID							=			{7, 10}, 		 --天子峰BOSS4
		BOSS_1_YIMING_DIALOGUE_LOCK				=			{11, 11},		 --天子峰BOSS1前易明二人组对话开关
		NEW_REVIVELOC_FLAG						=			{12, 12}, 		 --天子峰副本复活点开关
		BOSS_2_XINHAODAN_LOCK					=			{13, 13}, 		 --天子峰BOSS2计时器ID
		BOSS_2_FIGHT_LOCK						=			{14, 14}, 		 --天子峰BOSS2战斗开关
		BOSS_3_CONTROL_TIMER_ID					=			{15, 18}, 		 --天子峰BOSS3检索计时器ID
		BOSS_4_DEATH_NX							=			{19, 22}, 		 --天子峰BOSS4死亡位置X坐标
		BOSS_4_DEATH_NY							=			{23, 26},		 --天子峰BOSS4死亡位置Y坐标
		BOSS_3_POINT_NX							=			{27, 27},		 --天子峰BOSS3李尧下棋X坐标
		BOSS_3_POINT_NY							=			{28, 28},		 --天子峰BOSS3李尧下棋Y坐标
		BOSS_3_PLAY_TIMER_ID					=			{29, 32},		 --天子峰BOSS3李尧下棋控制计时器ID
		BOSS_2_BUILD_SCORE						=			{33, 33},		 --天子峰BOSS2建造剩余分数记录
		BOSS_4_DEATH_NFACEDIRECTION				=			{34, 35},		 --天子峰BOSS4死亡时的朝向
		BOSS_6_PERFORM_LOCK						=			{36, 36},		 --天子峰BOSS6表现开关
		BOSS_1_PERFORM_LOCK						=			{37, 37}, 		 --天子峰BOSS1表现开关
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGWUYANDAO = {						-- 英雄无盐岛
		EXIT_TRAP_LOCK							=			{0, 0},			--副本刷新出口TRAP开关 
	},
	
--------------------------------------------------------------------------------------------------------------------------------	
	
	YINGXIONGZHANBAOJIALAN = {					-- 英雄战宝迦兰
		MONK_LEAVE_ONE							=			{0, 0},			-- 小和尚离开trap1已触发标记
		MONK_LEAVE_TWO							=			{1, 1},			-- 小和尚离开trap2已触发标记
		MONK_LEAVE_THREE						=			{2, 2},			-- 小和尚离开trap3已触发标记
		MONK_LEAVE_FOUR							=			{3, 3},			-- 小和尚离开trap4已触发标记
		REVIVE_FLAG								=			{4, 4},			-- 掌火死亡后设置复活点标记，新复活点设置为舞火殿
		LONGJUANFENG_COUNT 						= 			{5, 5},    		-- 龙卷风数量
		BOSS6_DIE								=			{6, 6},			-- 6号Boss死亡标记
	},
	
--------------------------------------------------------------------------------------------------------------------------------	

	ZHANBAOJIALAN = {							-- 战宝迦兰
		MONK_LEAVE_ONE							=			{0, 0},			--小和尚离开trap1已触发标记
		MONK_LEAVE_TWO							=			{1, 1},			--小和尚离开trap2已触发标记
		MONK_LEAVE_THREE						=			{2, 2},			--小和尚离开trap3已触发标记
		MONK_LEAVE_FOUR							=			{3, 3},			--小和尚离开trap4已触发标记
		REVIVE_FLAG								=			{4, 4},			--掌火死亡后设置复活点标记，新复活点设置为舞火殿
		BOSS6_DIE                              	=          	{5,5},     		--老六死后触发进门
	},
	
--------------------------------------------------------------------------------------------------------------------------------		

	ZHENLONGQIGU = {							--珍珑棋谷
		CHESTS_CREATE_MARK						=			{0, 0}, 		-- 记录大宝箱刷新时取ID切换的位置
		CHESTS_CREATE_ARRAY						=			{1, 5}, 		-- 保存大宝箱刷新的序列
		PQ_SAVE_ID								=			{6, 9}, 		--记录PQID
	},
	
}


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com