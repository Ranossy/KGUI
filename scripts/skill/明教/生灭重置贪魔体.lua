---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/生灭重置贪魔体.lua
-- 更新时间:	2013/6/4 5:48:53
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5977) == 1 then
		player.ClearCDTime(515)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com