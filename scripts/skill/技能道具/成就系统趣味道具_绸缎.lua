---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_���.lua
-- ����ʱ��:	12/07/09 19:20:56
-- �����û�:	liuhengzhi1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(SKILL_STRING_TABLE[23805])
		return false, false
	end
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
	player.DoAction(0, 10960) --����Ť��趯��
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com