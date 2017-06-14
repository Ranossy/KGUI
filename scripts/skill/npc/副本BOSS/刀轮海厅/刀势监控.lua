---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/���Ƽ��.lua
-- ����ʱ��:	2017/4/1 18:46:43
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc then
		if npc.GetBuff(11854, 1) then
			local Nbuff = npc.GetBuff(11854, 1)
			local Num = Nbuff.nStackNum
			if Num == 10 then
				npc.DelGroupBuff(11854, 1)
				npc.AddBuff(npc.dwID, npc.nLevel, 11855, 1)
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com