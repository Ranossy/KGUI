---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ����_��ɡ03.lua
-- ����ʱ��:	01/11/10 11:13:03
-- �����û�:	yinhongdali
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(SKILL_STRING_TABLE[23805])
		return false, false
	end
 	if player.GetBuff(3047, 1)  then			--�Ž���Buff
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DelBuff(3047, 1)

	else
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DoAction(0, 11371) 					--���ſ�ɡ����
		player.AddBuff(0, 99, 3049, 1)				--��ӿ�ɡ��ӳ�ɡ������Buff
	end
	
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com