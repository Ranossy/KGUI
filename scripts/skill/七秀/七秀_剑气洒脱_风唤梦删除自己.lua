---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��������_�绽��ɾ���Լ�.lua
-- ����ʱ��:	2013/6/1 23:48:41
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.GetBuff(2831, 1) then
		player.DelBuff(4676, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com