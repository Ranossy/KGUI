---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff第十四重.lua
-- 更新时间:	2015/7/28 15:40:55
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13277) 	--播放收伞动作
	player.AddBuff(0, 99, 4186, 10)--第14重
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com