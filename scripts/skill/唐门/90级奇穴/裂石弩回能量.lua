---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/��ʯ�������.lua
-- ����ʱ��:	2013/5/12 10:30:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5888, 1)
	if not buff then
		return
	end
	player.nCurrentEnergy = player.nCurrentEnergy + buff.nStackNum * 3
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com