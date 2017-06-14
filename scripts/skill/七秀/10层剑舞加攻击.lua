---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/10层剑舞加攻击.lua
-- 更新时间:	2013/7/29 11:34:24
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--假死效果
	if player.GetSkillLevel(6567) == 1 then
		--[[
		if (not player.GetBuff(5970, 1)) and player.nCurrentLife > player.nMaxLife * 0.01 and (not player.GetBuff(6183, 1)) then
			player.AddBuff(player.dwID, player.nLevel, 6179, 1, 10)
		end
		--]]
		if player.nCurrentLife > player.nMaxLife * 0.01 and (not player.IsHaveBuff(6183, 1)) then
			player.AddBuff(player.dwID, player.nLevel, 6179, 1, 10)	--添加假死判定效果
		end
	end
	--[[if player.GetSkillLevel(6571) == 1 then
		if player.bFightState and (not player.GetBuff(6187, 1)) then
			if player.nAccumulateValue == 10 then
				player.ClearCDTime(123)
				player.AddBuff(dwCharacterID, player.nLevel, 6187, 1, 1)
			end
		end
	end--]]
	local n = player.nAccumulateValue
	local m = 10
	if player.GetSkillLevel(5882) == 1 then
		for i = 1, 10 do
			player.DelBuff(6228, 1)
		end
		for i = 1, n do
			player.AddBuff(dwCharacterID, player.nLevel, 6228, 1, 1)
		end
	end
	--朝露提高AP
	if player.GetSkillLevel(6779) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 and not player.IsHaveBuff(9766, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9766, 1)
		end
		--[[
		if player.bFightState and (not player.GetBuff(6320, 1)) then
			if player.nAccumulateValue == 10 then
				--player.ClearCDTime(123)
				player.AddBuff(dwCharacterID, player.nLevel, 6319, 1, 1)	--每秒1%回蓝 持续6秒
				player.AddBuff(dwCharacterID, player.nLevel, 6320, 1, 1)	--内置CD
			end
		end
		--]]
	end
	--降低威胁值、回蓝
	if player.GetSkillLevel(6847) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 and (not player.IsHaveBuff(9767, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 9768, 1, 1)	--降低40%威胁
			player.AddBuff(dwCharacterID, player.nLevel, 9767, 1, 1)	--内置CD
		end
		--[[
		if player.bFightState and (not player.GetBuff(6430, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 6384, 1, 1)	--降低40%威胁
			player.AddBuff(dwCharacterID, player.nLevel, 6430, 1, 1)	--内置CD
		end
		--]]
	end

	--10层剑舞增加剑破虚空伤害
--[[
	if player.GetSkillLevel(14715) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 then
			if not player.GetBuff(9926, 1) then
				player.AddBuff(player.dwID, player.nLevel, 9926, 1)
			end
		else
			if player.GetBuff(9926, 1) then
				player.DelBuff(9926, 1)
			end
		end
	end
--]]
	--10层剑舞增加剑破虚空伤害
	if player.GetSkillLevel(14939) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 then
			if not player.IsHaveBuff(9929, 1) then
				player.AddBuff(player.dwID, player.nLevel, 9929, 1)
			end
		else
			if player.IsHaveBuff(9929, 1) then
				player.DelBuff(9929, 1)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com