---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/TodayZhanChang_Refresh.lua
-- 更新时间:	2017/5/31 20:20:55
-- 更新用户:	qingfupei
-- 脚本说明:
----------------------------------------------------------------------<

local tGlobleToday_BF_ACT_LIST = { -- [战场地图ID] = 日历ID
	[38] = 70, -- 神农洇
	[48] = 71, -- 九宫棋谷
	[52] = 72, -- 70云湖天池
	[50] = 75, -- 丝绸之路
	[135] = 121, -- 三国古战场
	[186] = 246, -- 浮香丘
	--	[120] = 84, -- 英雄珍珑棋谷
	--	[121] = 86, -- 英雄神农洇
	--	[173] = {205},	--齐物阁
	--	[181] = {206}, -- 狼影殿
}

local tGlobleToday_ZhanchangList = {	--当天战场全局表
	[38] = false, -- 神农洇
	[48] = false, -- 九宫棋谷
	[52] = false, -- 70云湖天池
	[50] = false, -- 丝绸之路
	[135] = false, -- 三国古战场
	[186] = false, -- 浮香丘
	--	[120] = 84, -- 英雄珍珑棋谷
	--	[121] = 86, -- 英雄神农洇
	--	[173] = {205},	--齐物阁
	--	[181] = {206}, -- 狼影殿
}

--刷新全局表
function On_ZhanChang_RefreshTodayZhanchang()
	for k, v in pairs(tGlobleToday_BF_ACT_LIST) do
		if IsActivityOn(tGlobleToday_BF_ACT_LIST[k])  then
			tGlobleToday_ZhanchangList[k] = true
		else
			tGlobleToday_ZhanchangList[k] = false
		end
	end
end

function GetToday_ZhanchangList()
	return tGlobleToday_ZhanchangList
end

function GetZhanchang_ActList()
	return tGlobleToday_BF_ACT_LIST
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com