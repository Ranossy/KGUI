---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/skill调用/极泉返修为调用.lua
-- 更新时间:	06/07/10 13:24:29
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/PlayerCustomValueName.lh")

tQixueToBuffAll = 
{
    [ 1]  = {qijing = 1975, xiaoguo = 1985, biaoxian = 2048}, --下极俞+点穴修为
    [2]  = {qijing = 1972, xiaoguo = 1982, biaoxian = 2045}, --崇骨+传功
    [3]  = {qijing = 1969, xiaoguo = 1979, biaoxian = 2042}, --气端+跑速
    [4]  = {qijing = 1974, xiaoguo = 1984, biaoxian = 2047}, --腰眼+气血
    [5]  = {qijing = 1968, xiaoguo = 1978, biaoxian = 2041}, --抬肩+减伤
    [6]  = {qijing = 1966, xiaoguo = 1976, biaoxian = 2039}, --睛中+运功不被打退
    [7]  = {qijing = 1973, xiaoguo = 1983, biaoxian = 2046}, --曲泉+外功会心
    [8]  = {qijing = 1970, xiaoguo = 1980, biaoxian = 2043}, --龙玄+外功攻击
    [9]  = {qijing = 1971, xiaoguo = 1981, biaoxian = 2044}, --极泉+内功会心
    [10] = {qijing = 1967, xiaoguo = 1977, biaoxian = 2040}, --合阳+内功攻击
	[11]  = {qijing = 2001, xiaoguo = 2011, biaoxian = 2058}, --下极俞+点穴修为
	[12]  = {qijing = 1998, xiaoguo = 2008, biaoxian = 2055}, --崇骨+传功
	[13]  = {qijing = 1995, xiaoguo = 2005, biaoxian = 2052}, --气端+跑速
	[14]  = {qijing = 2000, xiaoguo = 2010, biaoxian = 2057}, --腰眼+气血
	[15]  = {qijing = 1994, xiaoguo = 2004, biaoxian = 2051}, --抬肩+减伤
	[16]  = {qijing = 1992, xiaoguo = 2002, biaoxian = 2049}, --睛中+运功不被打退
	[17]  = {qijing = 1999, xiaoguo = 2009, biaoxian = 2056}, --曲泉+外功会心
	[18]  = {qijing = 1996, xiaoguo = 2006, biaoxian = 2053}, --龙玄+外功攻击
	[19]  = {qijing = 1997, xiaoguo = 2007, biaoxian = 2054}, --极泉+内功会心
	[20] = {qijing = 1993, xiaoguo = 2003, biaoxian = 2050}, --合阳+内功攻击
}



function Apply(dwCharacterID)  --返还效果结束时候调用，返还效果必须按不同BUFF分别调用
	local player = GetPlayer(dwCharacterID)
	local dwBuffID = player.GetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID)
	local buff = player.GetBuff(2029, 1)
	local dwBiaoxianID = 0
	if buff then
		local nValue = buff.nCustomValue
		local nStackNum = math.floor(nValue / 100000) --当前剩余返还次数
		player.AddBuff(0, 99, dwBuffID, 1)
		local buff_new = player.GetBuff(dwBuffID, 1)
		if buff_new then
			buff_new.nCustomValue = nValue
		end
		player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, 0)
		for k, v in pairs(tQixueToBuffAll) do 
			if v.xiaoguo == dwBuffID then
				dwBiaoxianID = v.biaoxian
			end
		end
		if dwBiaoxianID ~= 0 and nStackNum >= 1 then
			for i = 1, nStackNum do 
				player.AddBuff(0, 99, dwBiaoxianID, 1)
			end
		end
	end
end

function UnApply(dwCharacterID) 
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com