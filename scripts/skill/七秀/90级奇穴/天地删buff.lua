---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/���ɾbuff.lua
-- ����ʱ��:	2013/5/1 10:44:43
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5795, 1)
	if not buff then
		return
	end
	--if buff.dwSkillSrcID == dwSkillSrcID then
		player.DelBuff(5795, 1)
	--end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com