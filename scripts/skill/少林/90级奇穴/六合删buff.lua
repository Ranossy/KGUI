---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����ɾbuff.lua
-- ����ʱ��:	2013/5/16 10:53:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local buff = target.GetBuff(5708, 1)
	if not buff then
		return
	end
	local id = buff.dwSkillSrcID
	if id == dwSkillSrcID then
		target.DelBuff(5708, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com