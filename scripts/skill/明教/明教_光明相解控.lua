---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��������.lua
-- ����ʱ��:	2013/6/4 9:32:08
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if player.IsExistBuffByFunctionType(2) == true then
		player.DelMultiGroupBuffByFunctionType(2)
		player.AddBuff(0, 99, 4422, 1)
	end
	if player.IsExistBuffByFunctionType(4) == true then
		player.DelMultiGroupBuffByFunctionType(4)
		player.AddBuff(0, 99, 4432, 1)
	end
	if player.IsExistBuffByFunctionType(7) == true then
		player.DelMultiGroupBuffByFunctionType(7)
		player.AddBuff(0, 99, 4434, 1)
	end
	if player.IsExistBuffByFunctionType(8) == true then
		player.DelMultiGroupBuffByFunctionType(8)
		player.AddBuff(0, 99, 4433, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com