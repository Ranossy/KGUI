---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_伞挂件5.lua
-- 更新时间:	2013/3/4 11:18:29
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 11009 or player.dwBackItemIndex == 13759 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 184)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com