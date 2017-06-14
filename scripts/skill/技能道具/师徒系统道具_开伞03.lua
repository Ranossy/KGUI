---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ����_��ɡ03.lua
-- ����ʱ��:	01/11/10 11:13:03
-- �����û�:	liuhengzhi1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND or player.nMoveState == MOVE_STATE.ON_WALK or player.nMoveState == MOVE_STATE.ON_RUN) then
		player.SendSystemMessage(SKILL_STRING_TABLE[23805])
		return false, false
	end
	if player.GetBuff(1422, 1)  or player.GetBuff(1426, 1)  or player.GetBuff(1426, 2) or  player.GetBuff(1528, 1) then			--�����������������buff, �ɾ�ϵͳ�����Buff
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DelBuff(1422, 1)
		player.DelBuff(1426, 1)
		player.DelBuff(1426, 2)
		player.DelBuff(1528, 1)
		player.DoAction(0, 11319)					--���ſ�ɡ����
		player.AddBuff(0, 99, 1576, 3)				--��ӿ�ɡ��ӳ�ɡ������Buff
	elseif  player.GetBuff(1575, 1) or player.GetBuff(1575, 2) or player.GetBuff(1575, 3) or player.GetBuff(1575, 4) then			--�ɾ�ϵͳ�����Buff
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DelBuff(1575, 1)
		player.DelBuff(1575, 2)
		player.DelBuff(1575, 3)
		player.DelBuff(1575, 4)
	else
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DoAction(0, 11319) 					--���ſ�ɡ����
		player.AddBuff(0, 99, 1576, 3)				--��ӿ�ɡ��ӳ�ɡ������Buff
	end
	
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com