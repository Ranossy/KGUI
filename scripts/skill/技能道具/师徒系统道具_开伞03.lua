---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统道具_开伞03.lua
-- 更新时间:	01/11/10 11:13:03
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
	if player.GetBuff(1422, 1)  or player.GetBuff(1426, 1)  or player.GetBuff(1426, 2) or  player.GetBuff(1528, 1) then			--中秋活动中秋礼服、灯笼buff, 成就系统提灯笼Buff
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DelBuff(1422, 1)
		player.DelBuff(1426, 1)
		player.DelBuff(1426, 2)
		player.DelBuff(1528, 1)
		player.DoAction(0, 11319)					--播放开伞动作
		player.AddBuff(0, 99, 1576, 3)				--添加开伞后加持伞换动作Buff
	elseif  player.GetBuff(1575, 1) or player.GetBuff(1575, 2) or player.GetBuff(1575, 3) or player.GetBuff(1575, 4) then			--成就系统提灯笼Buff
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DelBuff(1575, 1)
		player.DelBuff(1575, 2)
		player.DelBuff(1575, 3)
		player.DelBuff(1575, 4)
	else
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DoAction(0, 11319) 					--播放开伞动作
		player.AddBuff(0, 99, 1576, 3)				--添加开伞后加持伞换动作Buff
	end
	
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com