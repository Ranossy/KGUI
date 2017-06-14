---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/90级奇穴/冰蚕减千蝶.lua
-- 更新时间:	2013/4/29 16:06:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6058) == 1 then
		player.CastSkill(6200, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com