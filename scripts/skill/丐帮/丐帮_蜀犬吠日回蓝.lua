---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮_蜀犬吠日回蓝.lua
-- 更新时间:	2013/9/16 14:23:31
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local dwSkillLevel = player.GetSkillLevel(6815)
	if dwSkillLevel == 1 then
		player.nCurrentMana = player.nCurrentMana + 0.6 * player.nMaxMana
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com