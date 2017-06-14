---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ִ����/����_��ؿ���_������ͨ.lua
-- ����ʱ��:	2016/8/13 20:44:58
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene.dwMapID == 1 then
		local nQuest = 873
		local nQuestIndex = player.GetQuestIndex(nQuest)
		if nQuestIndex then
			player.SetQuestValue(nQuestIndex, 2, 1)
		end
		player.AddBuff(0, 99, 1899, 1, 54)
		if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 67, false)
		elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 8, false)
		else
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 68, false)
		end
		if player.GetBuff(1160, 1) then
			player.DelBuff(1160, 1)
		end
		player.SetTimer(50 * GLOBAL.GAME_FPS, "scripts/Map/�����/event/������ͨ�ӳٴ���.lua", 0, player.dwID)--�����¼���
	end
	--�������ṦCG
	--RemoteCallToClient(player.dwID, "OnPlayerUIMovie", "ui/Video/thirdmovie.mp4", 5, true)

	if scene.dwMapID == 247 then
		local nQuest = 15587
		local nQuestIndex = player.GetQuestIndex(nQuest)
		if nQuestIndex then
			player.SetQuestValue(nQuestIndex, 2, 1)
		end
		if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 67, false)
		elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 8, false)
		else
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 68, false)
		end
		if player.GetBuff(1160, 1) then
			player.DelBuff(1160, 1)
		end
		player.SetTimer(50 * GLOBAL.GAME_FPS, "scripts/Map/�λص���/event/������ͨ�ӳٴ���.lua", 0, player.dwID)
	end

end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com