---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/�����Ұ���.lua
-- ����ʱ��:	2017/2/19 20:42:08
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)		--������buff��npc����boss
	if not  npc then
		return
	end
	npc.CastSkill(17387, 1)
	npc.AddBuff(npc.dwID, npc.nLevel, 11722, 1)		--������
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com