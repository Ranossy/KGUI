------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-10-13
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
	local cNpc = GetNpc(dwSkillSrcID)
	if not cNpc then
		return
	end
	local tNpc = GetNpc(dwCharacterID)
	if not tNpc then
		return
	end
	if tNpc.dwModelID == 27153 or tNpc.dwModelID == 27154 or tNpc.dwModelID == 27397 or tNpc.dwModelID == 27396 or tNpc.dwModelID == 27151 or tNpc.dwModelID == 27152 or tNpc.dwModelID == 29915 then
		cNpc.CastSkill(4784, 6,TARGET.NPC,dwCharacterID)
	elseif  tNpc.dwModelID == 37395 then
		cNpc.CastSkill(4786, 6,TARGET.NPC,dwCharacterID)
	else
		cNpc.CastSkill(4785, 6,TARGET.NPC,dwCharacterID)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com