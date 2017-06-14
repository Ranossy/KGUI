---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_奔雷枪术_龙城铁壁铁牢仇恨.lua
-- 更新时间:	2013/6/7 8:12:52
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetKungfuMount().dwSkillID == 10062 then
		--player.AddBuff(dwCharacterID,player.nLevel,6366,1,1)
	end
	
	ModityCDToUI(player, 2628, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com