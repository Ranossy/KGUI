---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff_寒琼.lua
-- 更新时间:	2016/8/19 11:19:11
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 13332) 	--播放收伞动作
	player.AddBuff(0, 99, 4186, 12)--寒琼
	if player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		player.SetTimer(30,"scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff_寒琼.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
		player.SetTimer(33,"scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff_寒琼.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
		player.SetTimer(20,"scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff_寒琼.lua",0,0)
	elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.SetTimer(24,"scripts/skill/技能道具/师徒系统_驱除持伞换动作Buff_寒琼.lua",0,0)
	end	
end

function OnTimer(player, param1, param2)
	player.DelBuff(4186,12)
	for i = 1, 100 do
		player.DelGroupBuff(409, i)--剑舞删除
	end
	player.DelBuff(9320, 1)	--删除 阳春白雪
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com