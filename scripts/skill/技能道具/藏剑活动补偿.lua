---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ؽ������.lua
-- ����ʱ��:	07/09/10 11:54:43
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if player.GetBuff(2064, 1) then
		player.SendSystemMessage(SKILL_STRING_TABLE[32199])
		return false, false
	end
	
	for i = 1, 5 do 
		player.AddBuff(0, 99, 2064, 1)
	end
	return false, true
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com