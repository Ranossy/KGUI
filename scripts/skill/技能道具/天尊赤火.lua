---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/������.lua
-- ����ʱ��:	09/10/09 19:54:15
-- �����û�:	tangyiming
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.DoAction(0, 10941)
	local tAroundPlayerID = player.GetAroundPlayerID()
	for i = 1, #tAroundPlayerID do
		local playerAround = GetPlayer(tAroundPlayerID[i])
		if playerAround and player.dwTongID == playerAround.dwTongID and GetCharacterDistance(playerAround.dwID, player.dwID) < 8 * 64 then
			playerAround.DoAction(0, 10150)
		end
	end
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com