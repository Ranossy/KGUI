---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/HorseSkill/skill/�����м��_ħ��.lua
-- ����ʱ��:	2014/11/7 14:42:02
-- �����û�:	zhangyan3
-- �ű�˵��:	--��BUFF��Чʱ�򴥷�һ��Ӧ��
-- ��ͷʵ�ⱸע��һ��BUFF��ħ���ű��е�Apply ����������Ӵ�BUFFʱ�򴥷�һ��
-- ��ͷʵ�ⱸע��һ��BUFF��ħ���ű��е�UnApply �������ڴ�BUFF��ʧʱ�򴥷�һ�θ����������ᴥ����ά��������������ʧ��player.DelBuff(8475,1)��ʧ��ʱ�䵽����ʧ��
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(33333)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
--	player.Talk("��")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "set character freeze 0 1")
end

function UnApply(dwCharacterID)
	--print(44444)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
--	player.Talk("��")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "set character freeze 0 0")
	RemoteCallToClient(player.dwID,"On_Freeze_End")	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com