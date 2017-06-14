---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/千斤坠.lua
-- 更新时间:	2013/9/11 9:50:35
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nDamageLevel = player.GetSkillLevel(498)
	player.ClearCDTime(193)
	player.CastSkill(499, nDamageLevel)
	player.AddBuff(0, 99, 3473, 2) --抗摔
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com