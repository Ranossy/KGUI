---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_�͵���/С��/BUFF���Խű�.lua
-- ����ʱ��:	2017/2/15 17:30:31
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		--npc.CastSkill(28, 1)
		npc.DoAction(0, 10055)
		print(1)
	end
	print(2)
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com