---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����¼�_��������_buff��ɢ.lua
-- ����ʱ��:	2013/9/11 17:08:04
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player.GetBuff(2778, 1) then
		player.DelBuff(6810, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com