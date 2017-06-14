---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����ϵ/����ϵ_������ǧ��buff.lua
-- ����ʱ��:	2013/10/14 19:52:39
-- �����û�:	meizhu
-- �ű�˵��:	
----------------------------------------------------------------------<
local tbTransTurn = {
	[331] = 204,
	[335] = 108,
	[339] = 71,
	[346] = 39,
}
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	
	local nCityID = nCustomValue
	
	if not nCityID then
		return
	end

	--������س���
	if tbTransTurn[nCityID] then
		player.TurnTo(tbTransTurn[nCityID])
	end
	
	--����ǧ��ר�ô��ͽӿ�
	player.Transmission(nCityID)

	--����ָ���������
	local nQuestId = 13906
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com