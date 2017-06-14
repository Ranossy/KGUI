---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_添加持伞换动作Buff第十五重.lua
-- 更新时间:	2015/11/27 15:18:12
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 15)--添加开伞后加持伞换动作Buff第十五重
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com