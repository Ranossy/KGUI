---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_�Ǻ�«.lua
-- ����ʱ��:	2015/9/15 11:24:44
-- �����û�:	huanglu1
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
	--player.DoAction(0, 10958) --���ų��Ǻ�«����
	if player.CheckEmotionAction(41) == true then
		player.SendSystemMessage(GetEditorString(8, 2481))
	else
		player.AddEmotionAction(41)
	end
	--player.AddAchievementCount(1213, 1)
	return false, true
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com