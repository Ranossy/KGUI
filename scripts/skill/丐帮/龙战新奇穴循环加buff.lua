---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_施放_突.lua
-- 更新时间:	2013/4/17 20:45:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetSkillLevel(6821) == 1 then
		player.AddBuff(player.dwID,player.nLevel,7789,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com