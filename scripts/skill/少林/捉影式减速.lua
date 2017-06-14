---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/捉影式减速.lua
-- 更新时间:	2016/6/17 17:27:32
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--if player.GetSkillLevel(6578) == 1 then
	target.AddBuff(dwSkillSrcID, player.nLevel, 6191, 1, 1)
	--end

	--奇穴缘断双捉影
--[[
	if player.GetSkillLevel(5911) == 1 then
		if not player.GetBuff(8417, 1) and not player.GetBuff(8747, 1) then
			player.AddBuff(player.dwID, player.nLevel, 8416, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 8747, 1, 1)
		else
			--print(44444)
			player.DelBuff(8417, 1)
			player.DelBuff(8747, 1)
		end
	end
	--print(111111)
	if player.GetBuff(8417, 1) then
		player.DelBuff(8417, 1)
	end
--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com