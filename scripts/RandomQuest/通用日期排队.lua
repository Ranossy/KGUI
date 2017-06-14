---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/通用日期排队.lua
-- 更新时间:	04/20/11 11:16:45
-- 更新用户:	wangxinfeng
-- 脚本说明:	于乐的排队脚本
----------------------------------------------------------------------<


local BF_TIME_LIST = { 
	--"今天，神农洇双倍！！"
	[1] = 38, --神农洇
	--"今天，九宫棋谷双倍！"
	[2] = 48, --九宫棋谷
	--"今天，70级云湖天池双倍！！"
	[3] = 52, --70云湖天池
	--"今天，丝绸之路双倍！！"
	--[4] = 50, 
}

function Get_BF_Double() 
	local thisTime = 4
	local OneDay = 86400
	local nTime = GetCurrentTime()
	local nNumber = math.floor(nTime / OneDay) % #BF_TIME_LIST + 1
	--print(math.floor(nTime / OneDay), #BF_TIME_LIST, nNumber, dwMapID)
	if BF_TIME_LIST[nNumber] then
		--print("False")
		return true, BF_TIME_LIST[nNumber], thisTime
	else
		--print("False")
		return false, 0, thisTime
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com