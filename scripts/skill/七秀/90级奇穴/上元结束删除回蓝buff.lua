---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�������������.lua
-- ����ʱ��:	2013/5/1 10:10:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if not target then
		return
	end
	local buff = target.GetBuffByOwner(7660,1,player.dwID) 
	if buff then
		target.DelBuffByIndex(buff.nIndex)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID,dwSkillSrcID)

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
		
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	local buff = target.GetBuffByOwner(7660,1,player.dwID) 
	if buff then
		target.DelBuffByIndex(buff.nIndex)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com