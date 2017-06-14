---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/90级奇穴/平湖黄龙破甲效果.lua
-- 更新时间:	2014/6/29 17:13:20
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	
	--[[
	--平湖黄龙破甲效果
	if player.GetSkillLevel(9289) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 7974, 1)
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com