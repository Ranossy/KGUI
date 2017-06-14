---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/儿童节活动道具_风车.lua
-- 更新时间:	05/10/10 19:44:13
-- 更新用户:	liuhengzhi1
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(SKILL_STRING_TABLE[23805])
		return false, false
	end
	
	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
	player.DelBuff(1593, 1)
	player.AddBuff(0, 99, 1910, 1)				--添加拿风车Bufff
	
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com