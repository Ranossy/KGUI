---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�������.lua
-- ����ʱ��:	09/14/09 16:25:24
-- �����û�:	tangyiming
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
		player.DoAction(0, 10102)
		player.DoCustomOTAction(0, 1, 3 * GLOBAL.GAME_FPS, TARGET.NO_TARGET, 0, 
				"scripts/skill/���ܵ���/�������.lua", SKILL_STRING_TABLE[22959]
		)
	-- ����Ҫ����������ֵ��ȷ��: 1] �Ƿ����ʹ�õ����Դ����� 2] �Ƿ����ٴ˵���
	return false, false
end

function OnCustomEvent(player)
	local nItemAmount = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 4893)
	if nItemAmount == 0 then
		player.SendSystemMessage(SKILL_STRING_TABLE[22958])
		return
	end
	if player.nRoleType == ROLE_TYPE.LITTLE_GIRL or player.nRoleType == ROLE_TYPE.SEXY_FEMALE or player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.AddBuff(0, 99, 1409, 1)
	else
		player.AddBuff(0, 99, 1409, 2)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com