---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/韦陀献杵天赋判定.lua
-- 更新时间:	2013/5/11 17:49:25
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local tlevel1 = tplayer.GetSkillLevel(5898)
	local tlevel2 = tplayer.GetSkillLevel(5913)
	if tlevel1 == 1 then
		tlevel1 = 2
	end
	if tlevel2 == 1 then
		tlevel2 = 2
	end
	if tlevel1 == 1 and tlevel2 == 1 then
		tplayer.CastSkill(3851, 1)
		tplayer.CastSkill(3853, 1)
	elseif tlevel1 == 1 and tlevel2 == 2 then
		tplayer.CastSkill(3852, 1)
		tplayer.CastSkill(3854, 1)
	elseif tlevel1 == 2 and tlevel2 == 1 then
		tplayer.CastSkill(3855, 1)
		tplayer.CastSkill(3857, 1)
	elseif tlevel1 == 2 and tlevel2 == 2 then
		tplayer.CastSkill(3856, 1)
		tplayer.CastSkill(3858, 1)
	elseif  tlevel1 ~= 1 and tlevel1 ~= 2 and tlevel2 == 1 then
		tplayer.CastSkill(3861, 3)
	elseif  tlevel1 ~= 1 and tlevel1 ~= 2 and tlevel2 == 2 then
		tplayer.CastSkill(3861, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com