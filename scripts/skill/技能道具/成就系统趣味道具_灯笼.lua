---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua
-- ����ʱ��:	12/07/09 19:13:11
-- �����û�:	liuhengzhi1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return false, false
	end
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
	player.DoAction(0, 10102)
	player.DoCustomOTAction(0, 1, 3 * GLOBAL.GAME_FPS, 
		TARGET.NO_TARGET, 0, 
		"scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua", 
		GetEditorString(1, 218))
		player.AddAchievementCount(320, 1)
	return false, false
end

function OnCustomEvent(player, target)
	if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5159) == 0 then
		player.SendSystemMessage(GetEditorString(8, 2170))
		return
	end
	
	if player.GetBuff(1422, 1) then			--���������Ƶ���buff
		player.DelBuff(1422, 1)
		player.AddBuff(0, 99, 1528, 1)  --��ӳɾ�ϵͳ�����Buff
	elseif  player.GetBuff(1426, 1) then			--�����������������buf
		player.DelBuff(1426, 1)
		player.AddBuff(0, 99, 1528, 1)  --��ӳɾ�ϵͳ�����Buff
	elseif  player.GetBuff(1426, 2) then			--�����������������buf
		player.DelBuff(1426, 2)
		player.AddBuff(0, 99, 1528, 1)  --��ӳɾ�ϵͳ�����Buff
	else
		player.AddBuff(0, 99, 1528, 1)  --��ӳɾ�ϵͳ�����Buff
	end	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com