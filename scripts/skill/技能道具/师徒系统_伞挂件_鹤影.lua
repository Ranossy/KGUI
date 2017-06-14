---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_伞挂件_鹤影.lua
-- 更新时间:	2017/5/19 2:16:22
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 19466 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 395)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com