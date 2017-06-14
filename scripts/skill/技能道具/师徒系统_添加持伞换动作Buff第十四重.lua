---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_添加持伞换动作Buff第十四重.lua
-- 更新时间:	2013/10/22 11:35:55
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 14)--添加开伞后加持伞换动作Buff第四重
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com