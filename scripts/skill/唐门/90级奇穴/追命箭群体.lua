---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/90级奇穴/追命箭群体.lua
-- 更新时间:	2013/5/14 10:32:05
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local lv = player.GetSkillLevel(3096)
	if player.GetSkillLevel(5722) == 1 then
		target.AddBuff(dwCharacterID, player.nLevel, 5782, 1, 1)
		player.CastSkill(6202, lv)
		--target.AddBuff(dwCharacterID, player.nLevel, 7659, 1, 1)
	end
	--[[
	if player.GetSkillLevel(6473) == 1 then
		target.AddBuff(dwCharacterID, player.nLevel, 7659, 1, 1)
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com