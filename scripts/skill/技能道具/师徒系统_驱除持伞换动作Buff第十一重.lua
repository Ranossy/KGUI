---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff第九重.lua
-- 更新时间:	2013/3/4 11:19:15
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 11483) 	--播放收伞动作
	player.AddBuff(0, 99, 4186, 7)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com