---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/international/CBT_KOR_Double.lua
-- 更新时间:	10/31/11 14:51:12
-- 更新用户:	LILIN1-PC
-- 脚本说明:	韩文版CBT测试活动增加双倍阅历buff
----------------------------------------------------------------------<


function IsTimeForAddBuff()
	local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	if tTime.hour >= 20 and tTime.hour < 22 then
		return true
	end
	
	return false
end

function GetDoubleBuffLastTime()
	local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	local nLineTime = DateToTime(tTime.year, tTime.month, tTime.day, 22, 0, 0)
	if nTime >= nLineTime then
		return 1
	end
	
	return nLineTime - nTime
end

function IsOtherDoubleBuffExist(player)
	local buff = player.GetBuff(2864, 0)
	if buff then
		return true
	end
	
	return false
end

function DelActivityDoubleBuff(player, dwBuffID, nBuffLevel)
	local buff = player.GetBuff(dwBuffID, nBuffLevel)
	if buff then
		player.DelBuff(dwBuffID, nBuffLevel)
	end
end

function AddActivityDoubleBuff(player, dwBuffID, nBuffLevel)
	if player.GetBuff(dwBuffID, nBuffLevel) then
		return
	end
	local nLastTime = GetDoubleBuffLastTime()
	player.AddBuff(0, 99, dwBuffID, nBuffLevel, nLastTime)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local dwBuffID = 3421
	local nBuffLevel = 1
	if not IsTimeForAddBuff() or IsOtherDoubleBuffExist(player) then
		DelActivityDoubleBuff(player, dwBuffID, nBuffLevel)
		return
	end
	
	AddActivityDoubleBuff(player, dwBuffID, nBuffLevel)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local dwBuffID = 3421
	local nBuffLevel = 1
	DelActivityDoubleBuff(player, dwBuffID, nBuffLevel)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com