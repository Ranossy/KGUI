---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/90级奇穴/坐忘无我带减伤.lua
-- 更新时间:	2015/9/2 20:21:19
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.IsSkillRecipeActive(115, 1) then
		player.AddBuff(player.dwID, player.nLevel, 10112, 1)
	end
	
	--[[
	--坐忘期间40%的减伤效果
	if player.GetSkillLevel(5813) == 1 then
		print(11111111)
		player.AddBuff(dwCharacterID, player.nLevel, 2983, 2, 1)
	end
	--]]

	local lv = player.GetSkillLevel(312)
	local nSkill = player.GetKungfuMount()
	--持而赢
	if player.GetSkillLevel(6469) == 1 then
		if nSkill ~= nil then
			--QC
			if nSkill.dwSkillID == 10014 then
				player.AddBuff(dwCharacterID, player.nLevel, 6090, lv, 1)
			else
				player.AddBuff(dwCharacterID, player.nLevel, 8868, lv, 1)
			end
		end
		--无我
		if player.GetSkillLevel(5813) == 1 then
			--player.AddBuff(dwCharacterID, player.nLevel, 6166, 1, 1)
			player.SetTimer(1, "scripts/skill/纯阳/90级奇穴/坐忘无我带减伤.lua", 0, 0)
		end
	else
		if nSkill ~= nil then
			if nSkill.dwSkillID == 10014 then
				player.AddBuff(dwCharacterID, player.nLevel, 134, lv, 1)
			else
				player.AddBuff(dwCharacterID, player.nLevel, 8867, lv, 1)
			end
		end

		if player.GetSkillLevel(5813) == 1 then
			--player.AddBuff(dwCharacterID, player.nLevel, 6166, 1, 1)
			player.SetTimer(1, "scripts/skill/纯阳/90级奇穴/坐忘无我带减伤.lua", 0, 0)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.AddBuff(player.dwID, player.nLevel, 2983, 2)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com