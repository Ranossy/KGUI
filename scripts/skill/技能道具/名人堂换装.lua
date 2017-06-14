---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�����û�װ.lua
-- ����ʱ��:	07/22/10 09:25:37
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	local nBuffID = 2073 --�а���
	local nBuffLevel = 1 --�а���
	if player.GetBuff(nBuffID, 1) or player.GetBuff(nBuffID, 2) then
		player.SendSystemMessage(SKILL_STRING_TABLE[33123])
	 	return false, false
	 end
	if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE or player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		nBuffLevel = 2 --Ů������װ
	end
	player.AddBuff(0, 99, nBuffID, nBuffLevel)
	
	local tAroundPlayerID = player.GetAroundPlayerID()
	for i = 1, #tAroundPlayerID do
		local playerAround = GetPlayer(tAroundPlayerID[i])
		if playerAround and player.dwTongID == playerAround.dwTongID and player.dwTongID ~= 0 and GetCharacterDistance(playerAround.dwID, player.dwID) < 8 * 64 then
			playerAround.DoAction(0, 10150)
		end
	end
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com