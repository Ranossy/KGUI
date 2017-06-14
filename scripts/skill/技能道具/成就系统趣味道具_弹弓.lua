---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/成就系统趣味道具_弹弓.lua
-- 更新时间:	12/07/09 19:19:15
-- 更新用户:	liuhengzhi1
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return false, false
	end
	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
	--player.DoAction(0, 10959) --播放玩弹弓动作
	if player.CheckEmotionAction(42) == true then
		player.SendSystemMessage(GetEditorString(8, 2481))
	else
		player.AddEmotionAction(42)
	end
	--player.AddAchievementCount(1139, 1)
	return false, true
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com