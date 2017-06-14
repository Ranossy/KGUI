---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_添加持伞换动作Buff_寒琼.lua
-- 更新时间:	2016/8/19 10:55:34
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1575, 16)--添加开伞后加持伞换动作Buff_寒琼
	player.AddBuff(0, 99, 11115, 1, 1000)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com