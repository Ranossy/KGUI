---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_幻光步1.lua
-- 更新时间:	2013/6/4 2:57:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DoAction(0, 11461)
	player.PlaySfx(235, player.nX, player.nY, player.nZ-100)
	if player.GetSkillLevel(5990) == 1 then
		player.CastSkill(6734, 1)
		if player.GetKungfuMount().dwSkillID == 10243 then
			player.CastSkill(6180,1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com