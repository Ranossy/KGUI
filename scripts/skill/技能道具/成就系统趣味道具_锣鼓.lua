---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/成就系统趣味道具_锣鼓.lua
-- 更新时间:	2015/9/15 11:23:28
-- 更新用户:	huanglu1
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return false, false
	end
	--if player.nGender == 1 then
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		--player.DoAction(0, 10962) --播放男性敲锣鼓动作
		if player.CheckEmotionAction(40) == true then
			player.SendSystemMessage(GetEditorString(8, 2481))
		else
			player.AddEmotionAction(40)
		end
		--player.AddAchievementCount(1142, 1)
	--else
		--player.SendSystemMessage("该道具只能由男性使用")
	--end
	return false, true
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com