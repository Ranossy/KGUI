---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ʱ����buff.lua
-- ����ʱ��:	2014/11/27 17:29:20
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(8661, 1) then
		player.DelBuff(8661, 1)
	end
	local nQuestIndex_14960 = player.GetQuestIndex(14960)
	if not nQuestIndex_14960 then
		player.SetDynamicSkillGroup(0)
	end
	--����buffɾ������return������Ҫ���������
	if player.GetBuff(8556, 1) then
		local tbQuestId = {
			14960, 14972, 12740
		}
		for _, nQuestId in pairs(tbQuestId) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				return
			end
		end
		player.DelBuff(8556, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com