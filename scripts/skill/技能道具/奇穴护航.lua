---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/奇穴护航.lua
-- 更新时间:	06/08/10 11:25:40
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/PlayerCustomValueName.lh")

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	
	--气劲列表，用于记录不同奇穴对应的修为值
	local tItemToBuff = 
	{
		[7005] = {BuffID = 1966, DebuffID = 1976, SkillID = 43}, 
		[7006] = {BuffID = 1967, DebuffID = 1977, SkillID = 170}, 
		[7007] = {BuffID = 1968, DebuffID = 1978, SkillID = 42}, 
		[7008] = {BuffID = 1969, DebuffID = 1979, SkillID = 40}, 
		[7009] = {BuffID = 1970, DebuffID = 1980, SkillID = 45}, 
		[7010] = {BuffID = 1971, DebuffID = 1981, SkillID = 46}, 
		[7011] = {BuffID = 1972, DebuffID = 1982, SkillID = 1206}, 
		[7012] = {BuffID = 1973, DebuffID = 1983, SkillID = 44}, 
		[7013] = {BuffID = 1974, DebuffID = 1984, SkillID = 41}, 
		[7014] = {BuffID = 1975, DebuffID = 1985, SkillID = 9}, 
		[7015] = {BuffID = 1992, DebuffID = 2002, SkillID = 43}, 
		[7016] = {BuffID = 1993, DebuffID = 2003, SkillID = 170}, 
		[7017] = {BuffID = 1994, DebuffID = 2004, SkillID = 42}, 
		[7018] = {BuffID = 1995, DebuffID = 2005, SkillID = 40}, 
		[7019] = {BuffID = 1996, DebuffID = 2006, SkillID = 45}, 
		[7020] = {BuffID = 1997, DebuffID = 2007, SkillID = 46}, 
		[7021] = {BuffID = 1998, DebuffID = 2008, SkillID = 1206}, 
		[7022] = {BuffID = 1999, DebuffID = 2009, SkillID = 44}, 
		[7023] = {BuffID = 2000, DebuffID = 2010, SkillID = 41}, 
		[7024] = {BuffID = 2001, DebuffID = 2011, SkillID = 9}, 
	}
	
	if player.GetSkillLevel(tItemToBuff[item.dwIndex].SkillID) == 10 then  -- 对应奇穴已畅通情况下无法使用护心丹药
		player.SendSystemMessage(SKILL_STRING_TABLE[32172])
		return false, false
	end 
	
	if player.nUsedTrainValue < 40000 then
		player.SendSystemMessage(SKILL_STRING_TABLE[32166])
		return false, false
	end
	
	if player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL) > 0 then
		player.SendSystemMessage(SKILL_STRING_TABLE[31338]) 
		return false, false
	end
	if player.GetBuff(2029, 1) then --中转BUFF存在时，不能使用丹药。不提示
		return false, false
	end
	for k, v in pairs(tItemToBuff) do 
		if item.dwIndex == k then -- 已经具有同样奇穴的返还效果情况下，不允许再吃一颗丹药。
			if player.GetBuff(v.DebuffID, 1) then
				player.SendSystemMessage(SKILL_STRING_TABLE[31351])
				return false, false
			end
		end
		if player.GetBuff(v.BuffID, 1) then  -- 拥有任何一个气劲的情况下不允许吃药
			player.SendSystemMessage(SKILL_STRING_TABLE[31338])
			return false, false
		end
	end

	if tItemToBuff[item.dwIndex].BuffID then
		player.AddBuff(0, 99, tItemToBuff[item.dwIndex].BuffID, 1)
		return false, true
	end

	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com