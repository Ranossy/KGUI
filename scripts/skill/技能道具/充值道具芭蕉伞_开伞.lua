---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/师徒系统道具_开伞03.lua
-- 更新时间:	01/11/10 11:13:03
-- 更新用户:	yinhongdali
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(SKILL_STRING_TABLE[23805])
		return false, false
	end
 	if player.GetBuff(3047, 1)  then			--芭蕉扇Buff
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DelBuff(3047, 1)

	else
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DoAction(0, 11371) 					--播放开伞动作
		player.AddBuff(0, 99, 3049, 1)				--添加开伞后加持伞换动作Buff
	end
	
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com