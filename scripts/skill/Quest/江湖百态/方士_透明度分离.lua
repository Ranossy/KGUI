---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_͸���ȷ���.lua
-- ����ʱ��:	2016/11/7 9:13:55
-- �����û�:	qinfupi
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local buffChuhun = player.GetBuff(10827, 1) --ÿ���Լ죬������buff10827���Լ�ɾ��
	if not buffChuhun then
		player.DelBuff(11494, 1)		--ÿ���Լ죬���Ƿ�ʿ״̬��ɾ��
	end
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com