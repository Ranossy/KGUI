---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/��ڤ�������ű�.lua
-- ����ʱ��:	2015/10/15 20:29:25
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local nQuestID = 873
	local nQuestPhase = player.GetQuestPhase(nQuestID )
	if nQuestPhase == 3 then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID ~= 1 then
		return
	end
	if player.nLevel <= 15 then
		player.AddBuff(0, 99, 1160, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com