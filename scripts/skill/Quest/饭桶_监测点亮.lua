---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��Ͱ_������.lua
-- ����ʱ��:	2013/12/9 17:07:25
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetItemAmountInAllPackages(5, 5263)>=1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7273, 1, 1)
	end
	if player.GetItemAmountInAllPackages(5, 5266)>=1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7274, 1, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com