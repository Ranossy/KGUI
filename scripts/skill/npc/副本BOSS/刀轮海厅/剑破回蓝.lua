---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/���ƻ���.lua
-- ����ʱ��:	2017/2/19 23:18:29
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local n = 5 / 100		--�ٷֱ�
	if npc.nCurrentMana >= npc.nMaxMana - npc.nMaxMana * n then
		npc.nCurrentMana = npc.nMaxMana
	else
		npc.nCurrentMana = npc.nCurrentMana + npc.nMaxMana * n
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com