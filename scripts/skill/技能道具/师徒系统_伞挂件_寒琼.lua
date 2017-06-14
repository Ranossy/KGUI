---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统_伞挂件_寒琼.lua
-- 更新时间:	2016/8/19 11:22:48
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com