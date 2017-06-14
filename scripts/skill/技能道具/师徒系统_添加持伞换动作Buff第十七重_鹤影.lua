---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_添加持伞换动作Buff第十七重_鹤影.lua
-- 更新时间:	2017/5/19 1:48:58
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 17)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com