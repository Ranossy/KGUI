---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/成就系统趣味道具_灯笼.lua
-- 更新时间:	12/07/09 19:13:11
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
	player.DoAction(0, 10102)
	player.DoCustomOTAction(0, 1, 3 * GLOBAL.GAME_FPS, 
		TARGET.NO_TARGET, 0, 
		"scripts/skill/技能道具/成就系统趣味道具_灯笼.lua", 
		GetEditorString(1, 218))
		player.AddAchievementCount(320, 1)
	return false, false
end

function OnCustomEvent(player, target)
	if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5159) == 0 then
		player.SendSystemMessage(GetEditorString(8, 2170))
		return
	end
	
	if player.GetBuff(1422, 1) then			--中秋活动莲花灯灯笼buff
		player.DelBuff(1422, 1)
		player.AddBuff(0, 99, 1528, 1)  --添加成就系统提灯笼Buff
	elseif  player.GetBuff(1426, 1) then			--中秋活动中秋礼服带灯笼buf
		player.DelBuff(1426, 1)
		player.AddBuff(0, 99, 1528, 1)  --添加成就系统提灯笼Buff
	elseif  player.GetBuff(1426, 2) then			--中秋活动中秋礼服带灯笼buf
		player.DelBuff(1426, 2)
		player.AddBuff(0, 99, 1528, 1)  --添加成就系统提灯笼Buff
	else
		player.AddBuff(0, 99, 1528, 1)  --添加成就系统提灯笼Buff
	end	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com