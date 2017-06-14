---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_驱换动作Buff第十七重_鹤影.lua
-- 更新时间:	2017/5/19 1:34:59
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13360) 	--播放收伞动作
	if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
		player.AddBuff(0, 99, 4186, 13, 9)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.AddBuff(0, 99, 4186, 13, 13)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
		player.AddBuff(0, 99, 4186, 13, 12)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		player.AddBuff(0, 99, 4186, 13, 18)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com