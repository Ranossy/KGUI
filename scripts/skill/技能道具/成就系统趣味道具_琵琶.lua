---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua
-- ����ʱ��:	2015/10/20 20:59:39
-- �����û�:	kelin-PC
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return false, false
	end
	--if player.nGender == 2 then
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
	--player.DoAction(0, 10962) --����Ů�Ե����ö���
	if player.CheckEmotionAction(40) == true then
		player.SendSystemMessage(GetEditorString(8, 2481))
	else
		player.AddEmotionAction(40)
	end
	--player.AddAchievementCount(1143, 1)
	--else
	--	player.SendSystemMessage("�õ���ֻ����Ů��ʹ��")
	--end
	return false, true
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com