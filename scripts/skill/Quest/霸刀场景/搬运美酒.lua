---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�Ե�����/��������.lua
-- ����ʱ��:	2016/8/30 16:30:56
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	--player.DelBuff(2587, 10)
	if player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, 27084) >= 1 then		
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "�����ڰ������ơ�", 4)
		player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 27084, 1)
		return false
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com