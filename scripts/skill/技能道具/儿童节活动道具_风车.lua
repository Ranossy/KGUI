---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/��ͯ�ڻ����_�糵.lua
-- ����ʱ��:	05/10/10 19:44:13
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
	
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
	player.DelBuff(1593, 1)
	player.AddBuff(0, 99, 1910, 1)				--����÷糵Bufff
	
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com