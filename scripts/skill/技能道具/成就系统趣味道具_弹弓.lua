---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua
-- ����ʱ��:	12/07/09 19:19:15
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
	--player.DoAction(0, 10959) --�����浯������
	if player.CheckEmotionAction(42) == true then
		player.SendSystemMessage(GetEditorString(8, 2481))
	else
		player.AddEmotionAction(42)
	end
	--player.AddAchievementCount(1139, 1)
	return false, true
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com