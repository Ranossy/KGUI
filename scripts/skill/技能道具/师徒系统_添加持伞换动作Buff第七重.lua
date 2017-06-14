---------------------------------------------------------------------->
-- 脚本名称:	G:/zhugan/client/scripts/skill/技能道具/师徒系统_添加持伞换动作Buff第七重.lua
-- 更新时间:	2012-10-24 9:57:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 7)--添加开伞后加持伞换动作Buff第四重
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com