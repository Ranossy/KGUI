---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff第十五重.lua
-- 更新时间:	2015/11/27 15:10:56
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13299) 	--播放收伞动作
	player.AddBuff(0, 99, 4186, 11)--第15重
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com